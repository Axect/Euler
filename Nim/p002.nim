import math

proc fib(l: int): int =
  var a = (x:1,y:1)
  for i in 1..l:
    (a.x, a.y) = (a.y, a.x + a.y)
  return a[0]

proc main() =
  var s = 0
  var l = 1
  while fib(l) < 4000000:
    if fib(l) mod 2 == 0:
      s += fib(l)
    l += 1
  echo s

if isMainModule:
  main()
