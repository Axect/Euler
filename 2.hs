module EvenFibo where

import Data.List

main :: IO()
main = print $ evenFib 4000000

fib :: Int -> Int
fib n | n<=0 = 0
      | n==1 = 1
      | n==2 = 2
      | otherwise = fib(n-1) + fib(n-2)

evenFib :: Int -> Int
evenFib n = sum (takeWhile (<=n) (map fib [2,5..]))
