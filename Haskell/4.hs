main = do
  print $ maximum
    [ i * j | i <- [100 .. 999], j <- [i .. 999], isPalindrome (i * j) ]

isPalindrome :: Integer -> Bool
isPalindrome n = show n == (reverse . show) n
