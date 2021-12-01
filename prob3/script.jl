
using Primes

function largest_prime_factor(n::Int)
    factors = Primes.factor(n)
    max = 0
    for (factor, mult) in factors
        if factor > max
            max = factor
        end
    end
    return max
end

largest_prime_factor(600851475143)