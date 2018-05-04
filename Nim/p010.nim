import sequtils, p003, math

proc main =
  let val = (toSeq 2..200_0000'i64).filter(isPrime).sum
  echo val

if isMainModule:
  main()
