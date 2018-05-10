import Data.List.Split

main :: IO ()
main = do
  dat <- readFile "Data/11.txt"
  let strArray = map (splitOn " ") $ filter (/= "") $ splitOn "\n" dat
      matArray = map (map read) strArray :: [[Integer]]
  print $ maximum
    [hProdMat matArray, vProdMat matArray, dProdMat matArray, rProdMat matArray]

type Vector = [Integer]
type Matrix = [[Integer]]

-- Product Code
hProd :: Vector -> Integer
hProd vec = (maximum . (map product))
  [ take 4 $ drop i vec | i <- [0 .. (l - 5)] ]
  where l = length vec

hProdMat :: Matrix -> Integer
hProdMat = maximum . (map hProd)

vProdMat :: Matrix -> Integer
vProdMat = maximum . (map hProd) . transpose

dProdMat :: Matrix -> Integer
dProdMat = maximum . (map hProd) . (map diag) . cyclics

rProdMat :: Matrix -> Integer
rProdMat = dProdMat . (map reverse)

-- Matrix Code
transpose :: Matrix -> Matrix
transpose m = map (\l -> map (!! l) m) [0 .. (length m - 1)]

diag :: Matrix -> Vector
diag m = zipWith (!!) m [0 .. (length m - 1)]

cyclic :: Matrix -> Matrix
cyclic m = tail m ++ [head m]

cyclics :: Matrix -> [Matrix]
cyclics m = map (cyclic' m) [0 .. length m - 1]
 where
  cyclic' :: Matrix -> Int -> Matrix
  cyclic' m n | n == 0    = m
              | otherwise = cyclic' (cyclic m) (n - 1)
