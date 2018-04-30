import future, math, sequtils

echo (toSeq 1..999).filter(x => x mod 3 == 0 or x mod 5 == 0).sum
