import Data.List
import Data.Ord

main :: IO ()
main = do
  print $ maximumBy (comparing snd)
                    (zip [1 ..] (map (length . collatzSeq) [1 .. 999999]))

collatzSeq :: Int -> [Int]
collatzSeq 1 = []
collatzSeq n | even n    = n `div` 2 : collatzSeq (n `div` 2)
             | otherwise = 3 * n + 1 : collatzSeq (3 * n + 1)
