module EvenlyDivisible where

main :: IO()
main = do
  print $ wholeLCM [1..20]

wholeLCM :: [Integer] -> Integer
wholeLCM [x] = x
wholeLCM (x:xs) = lcm x (wholeLCM xs)
