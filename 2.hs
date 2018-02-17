module EvenFibo where

main :: IO()
main = do
  print $ evenFib

fib :: Int -> Int
fib n | n<=0 = 0
      | n==1 = 1
      | n==2 = 2
      | otherwise = fib(n-1) + fib(n-2)

evenFib :: Int
evenFib = sum [x | x <- takeWhile (<=4000000) $ map fib [1..], x `mod` 2 == 0]
