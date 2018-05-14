import sequtils, strutils, future

type
  Row = seq[int]
  Matrix = seq[Row]

proc hProd(row: Row): int =
  var largest = 1
  for i in 0..(row.high - 4):
    var s = 1
    for j in i..i+3:
      s *= row[j]
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

proc diag(mat: Matrix): Row =
  var temp: seq[int] = @[]
  for i in 0..mat.high:
    temp.add(mat[i][i])
  return temp

proc permut(mat: Matrix): Matrix =
  var temp = mat
  temp.delete(0)
  temp.insert(mat[0], mat.high)
  return temp

proc completeSwap(mat: Matrix): Matrix =
  var temp = mat
  for i in 0..mat.high:
    for j in 0..mat[0].high:
      temp[i][j] = mat[i][len(mat[0]) - 1 - j]
  return temp

proc dProduct(mat: Matrix): int =
  var temp = hProd(diag(mat))
  var largest = temp
  for i in 0..mat.high:
    let temp_mat = permut(mat)
    temp = hProd(diag(temp_mat))
    if largest < temp:
      largest = temp
  return largest

proc main =
  let temp = readFile("Data/11.txt")
  let strdata = temp.split({'\n'}).filter(x => x != "").map(x => x.split({' '}))
  let data = strdata.map(x => x.map(y => parseInt(y)))
  echo @[hProduct(data), vProduct(data), dProduct(data), dProduct(completeSwap(data))]
  echo hProd(@[1,2,5,26,63,78,14,3,7,6])

if isMainModule:
  main()
