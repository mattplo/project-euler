lines = readlines(joinpath(@__DIR__, "./input.txt"))
numbers = parse.(BigInt, lines)
SubString(string(sum(numbers)), 1, 10)

#more clever...
numbers_truncated = parse.(Int, SubString.(lines, 1, 11))
SubString(string(sum(numbers_truncated)), 1, 10)