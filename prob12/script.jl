
function triangle_sequence(n::Int)
    return Int(n * (n + 1) / 2)
end

function nb_dividers(n::Int)
    max_divider = floor(sqrt(n))
    dividers = (n == 1 ? 1 : 2)
    for k = 2:max_divider
        if n % k == 0
            dividers += 2
        end
    end
    dividers
end

n = 1
dividers = 500
while nb_dividers(triangle_sequence(n)) < dividers
    n += 1
end
triangle_sequence(n)