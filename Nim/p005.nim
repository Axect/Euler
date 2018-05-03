import math, sequtils

proc gcd(a,b: int): int =
  if b == 0:
    return a
  else:
    return gcd(b, a mod b)

proc lcm(a,b: int): int =
  a * b div gcd(a,b)

proc main =
  echo foldr(toSeq 1..20, lcm(a,b))

if isMainModule:
  main()
