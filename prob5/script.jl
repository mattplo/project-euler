
function least_common_multiple(n::Int)
    smallest_multiple = 1
    for i = 1:n
        remainder = smallest_multiple % i
        if remainder > 0
            if i % remainder == 0
                fac = i ÷ remainder
            else
                fac = i
            end
            smallest_multiple *= fac
        end
    end
    return smallest_multiple
end

least_common_multiple(20)

#or a one-liner...

lcm(1:20)