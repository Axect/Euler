using Plots; gr()

n = 9

haskell = readcsv("Bench/toPlot/haskell.csv")
nim = readcsv("Bench/toPlot/nim.csv")
rust = readcsv("Bench/toPlot/rust.csv")

plot(haskell[1:n,2], lab="haskell", w=3, alpha=0.5)
plot!(nim[1:n,2], lab="nim", w=3, alpha=0.5)
plot!(rust[1:n,2], lab="rust", w=3, alpha=0.5)
xticks!(haskell[1:n,1])
title!("Euler Benchmark (1~$n)")
xaxis!("problem")
yaxis!("time(s)")
savefig("Bench/euler.png")
