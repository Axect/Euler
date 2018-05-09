import sequtils, future, math

echo ((toSeq 1..100).sum)^2 - (toSeq 1..100).map(x => x^2).sum
