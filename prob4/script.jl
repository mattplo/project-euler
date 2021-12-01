
function is_palindrom(n::Int)
    str = string(n)
    len = length(str)
    res = true
    for k in 1:Int(floor(len / 2))
        if str[k] !== str[len - k + 1]
            res = false
        end
    end
    return res
end

is_palindrom(9012109)
    
function brute(digits::Int)
    max_number = 10^digits - 1
    max_palindrom = 0
    for i in max_number:-1:1
        for j in i:-1:1
            prod = i * j
            if is_palindrom(prod)
                if prod > max_palindrom
                    max_palindrom = prod
                end
            end
        end
    end
    return max_palindrom
end

brute(3)
