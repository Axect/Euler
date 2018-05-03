import sequtils, strutils

proc isPalindrome(n: int): bool =
  let origin = $n
  var reversed = $n
  for i in 0 .. origin.high:
    reversed[i] = origin[^(i+1)]
  return reversed == origin
  
proc main =
  var largest = 0
  for i in 100..999:
    for j in 100..999:
      if isPalindrome(i*j) and i*j > largest:
        largest = i*j

  echo largest

if isMainModule:
  main()
