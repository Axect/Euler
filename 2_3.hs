module EvenFibThree where

main :: IO()
main = do
  let n = 4000000
  print $ sum (takeWhile (<=n) [fib x | x <- [2,5..]])

fibTuple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
fibTuple (x, y, 0) = (x, y, 0)
fibTuple (x, y, z) = fibTuple (y, x+y, z-1)

fibResult :: (Integer, Integer, Integer) -> Integer
fibResult (x, y, z) = x

fib :: Integer -> Integer
fib x = fibResult (fibTuple (1, 1, x))
