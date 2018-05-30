module Prob1 where

import           Vector

main :: IO ()
main = do
  let a = Vector [1 .. 999]
  print $ sum (filter (\x -> x `mod` 3 == 0 || x `mod` 5 == 0) (toList a))

