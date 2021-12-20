lines = readlines(joinpath(@__DIR__, "./input.txt"))


function get_max_path(lines::Vector{String})
    weights = split.(lines)
    weights = [parse.(Int, line) for line in weights]
    n = length(weights[length(weights)])
    matrix = zeros(Int, (n, n))
    for i = 1:length(weights)
        for j = 1:length(weights[i])
            if checkbounds(Bool, weights, i - 1) && checkbounds(Bool, weights, j - 1)
                matrix[i, j] = max(matrix[i, j], matrix[i-1, j-1])
            end
            if checkbounds(Bool, weights, i - 1) && checkbounds(Bool, weights, j)
                matrix[i, j] = max(matrix[i, j], matrix[i-1, j])
            end
            matrix[i, j] += weights[i][j]
        end
    end
    maximum(matrix[n, :])
end

get_max_path(lines)