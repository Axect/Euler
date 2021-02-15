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

function p007()
    p = Prime(1)
    v = Int64[]
    while length(v) <= 10000
        next(p)
        push!(v, p.num) 
    end
    return v[end]
end

@btime p007()
