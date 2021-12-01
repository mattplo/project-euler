using Primes

function sum_primes_below_n(n::Int)
    prime = 2
    sum = 0
    while prime < n
        sum += prime
        prime = nextprime(prime + 1)
    end
    sum
end

sum_primes_below_n(2000000)
