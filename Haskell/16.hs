main :: IO ()
main = do
  print $ (sum . intToArray) (2 ^ 1000)

intToArray :: Integer -> [Integer]
intToArray int = (map (read . (: "")) $ show int) :: [Integer]
