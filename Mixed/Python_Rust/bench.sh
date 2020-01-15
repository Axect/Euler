#!/bin/sh
if [ $1 -ge 1 -a $1 -lt 10 ]; then
    num="00$1"
elif [ $1 -ge 10 -a $1 -lt 100 ]; then
    num="0$1"
else
    num="$1"
fi

hyperfine -w 3 --export-markdown "./bench/markdown/p${num}.md" --export-csv "./bench/csv/p${num}.csv" "python frontend/p${num}.py" "python pure/p${num}.py"

echo "Benchmark complete!"