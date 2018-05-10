import sequtils, strutils, future

type
  Row = seq[int]
  Matrix = seq[Row]

proc hProd(row: Row): int =
  var largest = 1
  for i in 0..(row.high - 4):
    var s = 1
    for j in i..i+3:
      s *= j
    if largest < s:
      largest = s
  return largest

proc transpose(mat: Matrix): Matrix =
  var a = mat
  for i in 0..mat.high:
    for j in 0..mat[i].high:
      a[j][i] = mat[i][j]
  return a

proc hProduct(mat: Matrix): int =
  mat.map(hProd).max

proc vProduct(mat: Matrix): int =
  hProduct(transpose(mat))

proc main =
  let temp = readFile("Data/11.txt")
  let data = temp.split({'\n'}).filter(x => x != "").map(x => x.split({' '}))
  echo data

if isMainModule:
  main()
