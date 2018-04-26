main :: IO ()
main = do
  let result = head
        [ a * b * (1000 - a - b)
        | a <- [1 .. 999]
        , b <- [1 .. 999]
        , a ^ 2 + b ^ 2 == (1000 - a - b) ^ 2
        ]
  print $ result
