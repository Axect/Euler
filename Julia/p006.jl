using BenchmarkTools

@btime abs(sum((1:100).^2) - sum(1:100)^2)
