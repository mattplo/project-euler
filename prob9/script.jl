
function euler_triple(m::Int, n::Int)
    return (m^2 - n^2, 2 * m * n, m^2 + n^2)
end

#TODO Solve 2m^2+2mn (n<m) programmatically 

prod(euler_triple(20, 5))