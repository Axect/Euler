import math, sequtils, future

proc main =
  for c in 1..1000:
    for a in 1..c:
      if c^2 == a^2 + (1000 - a - c)^2:
        echo a*(1000 - a - c)*c
        break

if isMainModule:
  main()

