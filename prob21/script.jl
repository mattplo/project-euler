function d(n::Int)
    max_divisor = floor(Int, sqrt(n))
    sum = 0
    if n > 1
        sum += 1
    end
    for k = 2:max_divisor
        if n % k == 0
            sum += k + n ÷ k
        end
    end
    sum
end

function sum_amicable(n::Int)
    sum = 0
    for i = 2:n
        j = d(i)
        if d(j) == i && i < j
            sum += i + j
        end
    end
    sum
end

sum_amicable(10000)