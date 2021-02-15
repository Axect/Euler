using BenchmarkTools

@btime reduce(lcm, 1:20)
