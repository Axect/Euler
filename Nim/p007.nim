import p003, sequtils

proc main =
  var i: int64 = 0
  var p: seq[int64] = @[]
  while p.len <= 10000:
    if isPrime(i):
      p.add(i)
    i += 1
  echo p[p.high]

if isMainModule:
  main()
