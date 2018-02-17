module Multiple where

main :: IO()
main = do
  print $ sumMultiple 999

isMultiple :: Int -> Int -> Bool
isMultiple n m = if n `mod` m == 0 then True else False

sumMultiple :: Int -> Int
sumMultiple n = sum [x | x <- [1..n], isMultiple x 3 || isMultiple x 5]
