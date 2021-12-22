function spell(n::Int)
    @assert n >= 1 && n <= 1000
    numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
    tens = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

    if n == 1000
        return ["one", "thousand"]
    else
        str = Vector{String}()
        nb_hundreds = n ÷ 100
        nb_tens = (n % 100) ÷ 10
        units = (n % 10)
        if nb_hundreds > 0
            push!(str, numbers[nb_hundreds], "hundred")
            if nb_tens > 0 || units > 0
                push!(str, "and")
            end
        end
        if nb_tens < 2 && nb_tens * 10 + units > 0
            push!(str, numbers[10*nb_tens+units])
        else
            if nb_tens > 0
                push!(str, tens[nb_tens])
            end
            if units > 0
                push!(str, numbers[units])
            end
        end
        return str
    end
end

function count_letters(n::Int)
    s = 0
    for i = 1:n
        words = spell(i)
        s += sum(length.(words))
    end
    s
end

count_letters(1000)