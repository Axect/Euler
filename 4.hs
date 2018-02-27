module Palindrome where

main :: IO()
main = do

revNumList :: Int -> [Int]
revNumList n = if r/=0 then r : revNumber q else [] where (q,r) = quotRem n 10

revNum :: Int -> Int
revNum n =
