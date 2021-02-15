using BenchmarkTools

mutable struct Prime
    num::Int64
end

function is_prime(n)
    range = Int(round(sqrt(n)))
    if n == 2
        return true
    elseif iseven(n)
        return false
    end

    i = 3
    while i <= range
        if n%i == 0
            return false
        else
            i += 2
        end
    end
    return true
end

function next(p::Prime)
    p.num += 1
    while !is_prime(p.num)
        p.num += 1
    end
end

function prime_factors(n)
    range = Int64(round(sqrt(n)))
    p = Prime(1)
    v = Int64[]
    while p.num <= range
        if n % p.num == 0
            push!(v, p.num)
        end
        next(p)
    end
    return v
end

@btime prime_factors(600851475143)
