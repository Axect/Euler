import os, osproc, strutils, strformat, sequtils

let num = parseInt(paramStr(1))

let rust = &"./Rust/bin/Euler{num}"
let haskell = &"./Haskell/bin/{num}"
var nim = &"./Nim/bin/p00{num}"

case num
of 1..9: nim = &"./Nim/bin/p00{num}"
of 10..100: nim = &"./Nim/bin/p0{num}"
else: nim = &"./Nim/bin/p{num}"

proc main =
  let output = case num
  of 1..9: execProcess(&"hyperfine -w 3 --export-markdown Bench/euler00{num}.md " & rust & " " & nim & " " & haskell)
  of 10..99: execProcess(&"hyperfine -w 3 --export-markdown Bench/euler0{num}.md " & rust & " " & nim & " " & haskell)
  else: execProcess(&"hyperfine -w 3 --export-markdown Bench/euler{num}.md " & rust & " " & nim & " " & haskell)

  echo output

if isMainModule:
  main()
