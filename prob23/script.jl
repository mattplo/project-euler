
function sum_proper_divisors(n::Int)
    max_divisor = floor(Int, sqrt(n))
    sum = 0
    if n > 1
        sum += 1
    end
    for k = 2:max_divisor
        q, r = n ÷ k, n % k
        if r == 0
            sum += k
            if k != q
                sum += q
            end
        end
    end
    sum
end

function is_abundant(n::Int)
    return sum_proper_divisors(n) > n
end


function is_sum_of_two_abundant()
    upper_bound = 28123
    abundant = Vector{Int}()
    is_sum_of_two_abundant = zeros(Bool, upper_bound)
    for i = 12:upper_bound
        if is_abundant(i)
            push!(abundant, i)
            for a in abundant
                if a + i <= upper_bound
                    is_sum_of_two_abundant[a+i] = true
                end
            end
        end
    end
    is_sum_of_two_abundant
end

res = is_sum_of_two_abundant()
sum(findall(.!res))