module Multiple where

main :: IO()
main = print $ sumMultiple 999

sumMultiple :: Int -> Int
sumMultiple n = sum [x | x <- [1..n], x`mod`3==0 || x`mod`5==0]
