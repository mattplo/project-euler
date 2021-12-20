lines = readlines(joinpath(@__DIR__, "./input.txt"))
matrix = parse.(Int, permutedims(reduce(hcat, collect.(split.(lines)))))

function find_max_prod(matrix::Matrix{Int})
    directions = [(0, 1), (1, 1), (1, 0), (1, -1)]
    m, n = size(matrix)
    max = 0
    for dir in directions
        for i = 1:m, j = 1:n
            max_pos = (i, j) .+ (4 .* dir)
            if checkbounds(Bool, matrix, max_pos...)
                prod = 1
                for k = 1:4
                    pos = (i, j) .+ (k .* dir)
                    prod *= matrix[pos...]
                end
                # @show prod
                if prod > max
                    max = prod
                end
            end
        end
    end
    max
end

find_max_prod(matrix)