--module Palindrome where
main :: IO ()
main = print $ maximum (findPalindrome 3)

revNum :: Integer -> Integer
revNum n = if q > 0
  then r * 10 ^ (1 + floor (logBase 10 (fromInteger q))) + revNum q
  else r
  where (q, r) = quotRem n 10

isPalindrome :: Integer -> Bool
isPalindrome n = n == revNum n

type Digit = Integer

isProduct :: Integer -> Digit -> Bool
isProduct n d
  | n < 10 ^ (d - 1)
  = False
  | null
      [ x
      | x <- [10 ^ (d - 1) .. (10 ^ d - 1)]
      , let (q, r) = quotRem n x in (q >= 10 ^ (d - 1) && q < 10 ^ d && r == 0)
      ]
  = False
  | otherwise
  = True

findPalindrome :: Digit -> [Integer]
findPalindrome d =
  [ x
  | x <- [100 ^ (d - 1) .. (10 ^ d - 1) ^ 2]
  , isPalindrome x
  , isProduct x d
  ]
