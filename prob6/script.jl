function diff_sum_squares(n::Int)
    sum_squares = sum(collect(1:n) .^ 2)
    sum_squared = sum(1:n)^2
    return sum_squared - sum_squares
end

diff_sum_squares(100)