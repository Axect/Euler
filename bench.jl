strnum, strtimes = ARGS
num = parse(Int64, strnum)
times = parse(Int64, strtimes)

rust = `./Rust/bin/Euler$(num)`
nim = `./Nim/bin/p00$(num)`
haskell = `./Haskell/bin/$(num)`

rust_time = 0
nim_time = 0
haskell_time = 0

for i = 1:times
  rust_time += @elapsed run(rust);
  nim_time += @elapsed run(nim);
  haskell_time += @elapsed run(haskell);
end

rust_time /= times
nim_time /= times
haskell_time /= times

println("Rust: ", rust_time)
println("Nim: ", nim_time)
println("Haskell: ", haskell_time)

result = ["Rust: $(rust_time)sec", "Nim: $(nim_time)sec", "Haskell: $(haskell_time)sec"]

if num < 10
  writecsv("Bench/euler00$(num).csv", result)
elseif num < 100
  writecsv("Bench/euler0$(num).csv", result)
else
  writecsv("Bench/euler$(num).csv", result)
end
