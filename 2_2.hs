module EvenFibo where

import Data.List

main = print $ evenFibo 4000000

evenFibo n = foldl' (+) 0 [x | x <- takeWhile (<=n) fibs, even x]
     where fibs = 1:2:(zipWith (+) fibs (tail fibs))
