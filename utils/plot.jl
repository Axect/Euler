using Plots; gr()

haskell = readcsv("Bench/toPlot/haskell.csv")
nim = readcsv("Bench/toPlot/nim.csv")
rust = readcsv("Bench/toPlot/rust.csv")

plot(haskell[1:6,2], lab="haskell", w=3, alpha=0.5)
plot!(nim[1:6,2], lab="nim", w=3, alpha=0.5)
plot!(rust[1:6,2], lab="rust", w=3, alpha=0.5)
xticks!(haskell[1:6,1])
title!("Euler Benchmark (1~6)")
xaxis!("problem")
yaxis!("time(ms)")
savefig("Bench/euler.png")
