import os, times, osproc, strutils, strformat, algorithm, sequtils
import csvtools

type BenchMark = object
  lang: string
  time: string

let num = parseInt(paramStr(1))
let repeat = parseInt(paramStr(2))

let rust = &"./Rust/bin/Euler{num}"
let haskell = &"./Haskell/bin/{num}"
var nim = &"./Nim/bin/p00{num}"

case num
of 1..9: nim = &"./Nim/bin/p00{num}"
of 10..100: nim = &"./Nim/bin/p0{num}"
else: nim = &"./Nim/bin/p{num}"

proc measureTime(cmd: string): float =
  let output = splitLines(cmd)
  let temp = output[2].rsplit("m")
  let temp2 = temp[1].rsplit("s")
  result = parseFloat(temp2[0])
  return result

proc main =
  var rust_time = 0.0
  var nim_time = 0.0
  var haskell_time = 0.0
  
  for i in 1 .. repeat:
    rust_time += measureTime(execProcess("time " & &"{rust}"))
    nim_time += measureTime(execProcess("time " & &"{nim}"))
    haskell_time += measureTime(execProcess("time " & &"{haskell}"))

  rust_time /= repeat.float
  nim_time /= repeat.float
  haskell_time /= repeat.float

  let bench_head = BenchMark(lang: "Language", time: "Time (sec)")

  let rust_bench = BenchMark(lang: "Rust", time: $rust_time)
  let nim_bench = BenchMark(lang: "Nim", time: $nim_time)
  let haskell_bench = BenchMark(lang: "Haskell", time: $haskell_time)

  var bench_result: seq[BenchMark] = @[rust_bench, nim_bench, haskell_bench]
  bench_result.sort do (x, y: BenchMark) -> int:
    result = cmp(x.time, y.time)
    if result == 0:
      result = cmp(x.lang, y.lang)

  bench_result = concat(@[bench_head], bench_result)

  echo &"Rust:    {rust_time}s"
  echo &"Nim:     {nim_time}s"
  echo &"Haskell: {haskell_time}s"

  case num
  of 1..9: bench_result.writeToCsv(&"Bench/euler00{num}.csv")
  of 10..99: bench_result.writeToCsv(&"Bench/euler0{num}.csv")
  else: bench_result.writeToCsv(&"Bench/euler{num}.csv")

if isMainModule:
  main()
