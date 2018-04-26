main :: IO ()
main = do
  print $ sum $ map (length . numToEn) [1 .. 1000]

enList1 =
  ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
enList2 =
  [ "ten"
  , "eleven"
  , "twelve"
  , "thirteen"
  , "fourteen"
  , "fifteen"
  , "sixteen"
  , "seventeen"
  , "eighteen"
  , "nineteen"
  ]
enList3 =
  [ "twenty"
  , "thirty"
  , "forty"
  , "fifty"
  , "sixty"
  , "seventy"
  , "eighty"
  , "ninety"
  , "onehundred"
  ]

numToEn :: Int -> String
numToEn n
  | n <= 9 = enList1 !! (n - 1)
  | n <= 19 = enList2 !! (n - 10)
  | n <= 100 = if r >= 1
    then (enList3 !! (q - 2)) ++ (enList1 !! (r - 1))
    else enList3 !! (q - 2)
  | n == 1000 = "onethousand"
  | otherwise = if r' >= 1
    then (enList1 !! (q' - 1)) ++ "hundredand" ++ numToEn (n - (q' * 100))
    else enList1 !! (q' - 1) ++ "hundred"
 where
  (q , r ) = quotRem n 10
  (q', r') = quotRem n 100
