using JuMP
using GLPK

# https://www.juliaopt.org/notebooks/JuMP-Sudoku.html

function solve_sudoku(init_grid::Matrix{Int})
    sudoku = Model(GLPK.Optimizer)
    @variable(sudoku, x[1:9, 1:9, 1:9], Bin) #x[i,j,k] if cell (i,j) contains number k
    @constraint(sudoku, [i = 1:9, j = 1:9], sum(x[i, j, k] for k = 1:9) == 1) #only one number in each cell
    @constraint(sudoku, [i = 1:9, k = 1:9], sum(x[i, j, k] for j = 1:9) == 1) #one of each number in each row
    @constraint(sudoku, [j = 1:9, k = 1:9], sum(x[i, j, k] for i = 1:9) == 1) #one of each number in each column
    @constraint(sudoku, [i = 1:3:7, j = 1:3:7, k = 1:9], sum(x[r, c, k] for r = i:i+2, c = j:j+2) == 1) #one of each number in each sub-square
    #grid
    for i = 1:9, j = 1:9
        if init_grid[i, j] != 0
            @constraint(sudoku, x[i, j, init_grid[i, j]] == 1)
        end
    end
    optimize!(sudoku)
    val = value.(x)
    sol = sum([k .* round.(Int, val[:, :, k]) for k = 1:9])
    return sol
end

function get_grids()
    lines = readlines(joinpath(@__DIR__, "./input.txt"))
    nb_grids = length(lines) ÷ 10
    grids = zeros(Int, nb_grids, 9, 9)
    for n = 0:nb_grids-1
        for l = 2:10
            grids[n+1, l-1, :] .= parse.(Int, collect(lines[n*10+l]))
        end
    end
    return grids
end

function solve_grids(grids::Array{Int,3})
    s = 0
    for n = 1:size(grids, 1)
        sol = solve_sudoku(grids[n, :, :])
        digits = sol[1, 1:3]
        s += digits[1] * 100 + digits[2] * 10 + digits[3]
    end
    s
end

grids = get_grids()
solve_grids(grids)