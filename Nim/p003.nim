import sequtils, math, future

proc isPrime*(n: int64): bool =
  case n
  of 1: return false
  of 2: return true
  else: return (toSeq 2..int(sqrt(n.float))).all(p => n mod p != 0)

proc primeFactors*(n: int64): seq[int64] =
  var fac: seq[int64] = @[]
  var m = n
  var p = 2
  while m >= p:
    if m mod p == 0:
      fac.add(p)
      m = m div p
    else:
      p += 1
      while not isPrime(p):
        p += 1
  return fac

proc main =
  echo primeFactors(600851475143).max

if isMainModule:
  main()
