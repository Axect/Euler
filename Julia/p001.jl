using BenchmarkTools

function naive()
    s = Int32(0)
    @simd for i in 1:999
        if i % 3 == 0 || i % 5 == 0
            s += i
        end
    end
    return s
end

# Naive sum
@btime naive()

# Functional (Fastest)
@btime sum(filter(x -> x % 3 == 0 || x % 5 == 0, 1:999))
