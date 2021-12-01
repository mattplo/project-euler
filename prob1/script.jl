
function sum_multiples(n::Int)
    sum = 0
    for i in 1:n - 1
        if mod(i, 3) == 0 || mod(i, 5) == 0
            sum += i
        end
    end
    return sum
end

sum_multiples(1000)
        
    