#!/bin/sh
if [ $1 -ge 1 -a $1 -lt 10 ]; then
  num="00$1"
elif [ $1 -ge 10 -a $1 -lt 100 ]; then
  num="0$1"
else
  num="$1"
fi

hyperfine -w 1 --export-markdown ./Bench/euler${num}.md --export-csv ./Bench/data/euler${num}.csv "./D/bin/p${num}" "./Rust/bin/euler_$1" "./Nim/bin/p${num}" "./Haskell/bin/$1"

echo "Benchmark complete!"

./utils/benchCSV

echo "Export data complete!"

julia utils/plot.jl

echo "Plot complete!"
