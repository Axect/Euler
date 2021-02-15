using BenchmarkTools

mutable struct Fib{T}
    curr::T
    next::T
end

function next(f::Fib{T}) where T <: Number
    (f.curr, f.next) = (f.next, f.next + f.curr)
end

function p002()
    init = Fib(1, 1)
    s = 0
    while init.next <= 400_0000
        next(init)
        s += iseven(init.curr) ?
            init.curr :
            0
    end
    return s
end

@btime p002()

