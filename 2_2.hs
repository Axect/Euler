module EvenFibo where

main = print $ evenFibo 4000000

evenFibo n = sum [x | x <- takeWhile (<=n) fibs, even x]
  where
    fibs = 1:2:zipWith (+) fibs (tail fibs)
