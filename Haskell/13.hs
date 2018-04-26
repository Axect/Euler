import Data.List.Split

main :: IO ()
main = do
  r <- readFile "../Data/13.txt"
  let nums      = map (read) (filter (/= "") $ splitOn "\n" r) :: [Integer]
  let tenDigits = take 10 $ map (read . (: "")) (show $ sum nums) :: [Integer]
  print tenDigits

