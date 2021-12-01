
function sum_fibonacci(n::Int)
    t1 = 1
    t2 = 2
    sum = 2
    while t2 < n
        t1, t2 = t2, t1 + t2
        if t2 < n &&  mod(t2, 2) == 0
            sum += t2
        end
    end
    return sum
end

sum_fibonacci(4000000)