import Data.List.Split

main :: IO ()
main = do
  r <- readFile "../Data/18.txt"
  let strArray = map (splitOn " ") (filter (/= "") $ splitOn "\n" r)
      numArray = map (map read) strArray :: [[Integer]]
      revArray = reverse numArray
  print $ reduceTotal revArray

reduce :: [Integer] -> [Integer]
reduce (_:[]) = []
reduce (x:xs) = max x (head xs) : reduce xs

reduceTotal :: [[Integer]] -> Integer
reduceTotal [[x] ] = x
reduceTotal (x:xs) = reduceTotal (zipWith (+) (reduce x) (head xs) : tail xs)
