import os, times, osproc, strutils, strformat
import csvtools

type BenchMark = object
  lang: string
  time: float


let num = parseInt(paramStr(1))
let repeat = parseInt(paramStr(2))

let rust = &"./Rust/bin/Euler{num}"
let nim = &"./Nim/bin/p00{num}"
let haskell = &"./Haskell/bin/{num}"

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

  let rust_bench = BenchMark(lang: "Rust", time: rust_time)
  let nim_bench = BenchMark(lang: "Nim", time: nim_time)
  let haskell_bench = BenchMark(lang: "Haskell", time: haskell_time)

  let bench_result: seq[BenchMark] = @[rust_bench, nim_bench, haskell_bench]

  echo &"Rust:    {rust_time}s"
  echo &"Nim:     {nim_time}s"
  echo &"Haskell: {haskell_time}s"
  
  case num
  of 1..9: bench_result.writeToCsv(&"Bench/euler00{num}.csv")
  of 10..99: bench_result.writeToCsv(&"Bench/euler0{num}.csv")
  else: bench_result.writeToCsv(&"Bench/euler{num}.csv")

if isMainModule:
  main()
