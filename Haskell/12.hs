import Data.Numbers.Primes

main :: IO ()
main = do
  print $ (head . (dropWhile (\x -> countDivisors x <= 500))) triangle

unique :: Eq a => [a] -> [a]
unique []     = []
unique (x:xs) = x : unique (filter (/= x) xs)

countDivisors :: Int -> Int
countDivisors num = product
  $ map (\p -> (length . (filter (== p))) ps + 1) (unique ps)
  where ps = primeFactors num

triangle :: [Int]
triangle = map (\n -> (n * (n + 1)) `div` 2) [1 ..]

