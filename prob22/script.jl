
line = readline(joinpath(@__DIR__, "./input.txt"))
names = split(SubString(line, 2, length(line) - 1), "\",\"")
sort!(names)

function alpha_value(s)
    sum(Int.(collect(s)) .- Int('A') .+ 1)
end
values = [alpha_value(names[i]) * i for i = 1:length(names)]
total = sum(values)