main = do
  print $ paths 20 20

paths::Integer -> Integer -> Integer
paths h v = factorial (h+v) `div` (factorial h * factorial v)

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n-1)
