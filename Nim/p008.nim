import sequtils, strutils, math, future, os

proc main =
  let data = readFile("Data/8.txt")
  var largest: int = 0

  for i in 0..(data.high - 13):
    var s = 1
    for j in i .. i+12:
      s *= parseInt($data[j])
    if largest < s:
      largest = s

  echo largest

if isMainModule:
  main()
