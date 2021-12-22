using Dates

function count_sundays()
    s = 0
    for year = 1901:2000
        for month = 1:12
            t = Date(year, month, 1)
            if Dates.dayname(t) == "Sunday"
                s += 1
            end
        end
    end
    s
end

count_sundays()