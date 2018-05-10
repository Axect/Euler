main :: IO ()
main = do
  anum <- readFile "../Data/8.txt"
  let alist = map (read . (: "")) anum :: [Integer]
  print $ gp13 alist

gp13 :: [Integer] -> Integer
gp13 xs@(n:ns) = gp13' xs ns
 where
  ps :: [Integer] -> Integer
  ps xs = product (take 13 xs)
  gp13' :: [Integer] -> [Integer] -> Integer
  gp13' as bs | length bs <= 13 = max (ps as) (ps bs)
              | length as <= 13 = max (ps as) (ps bs)
              | ps as >= ps bs  = gp13' as (drop 1 bs)
              | otherwise       = gp13' (drop 1 as) bs
