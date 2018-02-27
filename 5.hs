module EvenlyDivisible where

import Data.Numbers.Primes

main :: IO()
main = do

wholeLCM :: [Integer] -> Integer
wholeLCM [x] = x
wholeLCM (x:xs) = lcm x (wholeLCM xs)
