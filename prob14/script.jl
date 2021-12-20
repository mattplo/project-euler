
function sequence_length(n::Int, current_length::Int)
    if n == 1
        return current_length
    elseif n % 2 == 0
        return sequence_length(Int(n / 2), current_length + 1)
    else
        return sequence_length(3 * n + 1, current_length + 1)
    end
end

function max_chain(n::Int)
    max = 0
    argmax = 0
    for i = 1:n
        len = sequence_length(i, 1)
        if len > max
            max = len
            argmax = i
        end
    end
    argmax
end

max_chain(1000000)