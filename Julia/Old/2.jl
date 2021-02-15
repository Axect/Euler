# fibs : 무한 피보나치 수열
using Lazy, BenchmarkTools
fibs = @lazy 1:2:(fibs + drop(1, fibs));

# 계산하기
@btime reduce(+, filter(iseven, takewhile(x -> x<4000000, fibs)))
