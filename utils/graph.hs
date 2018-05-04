{-# LANGUAGE ConstraintKinds #-}

import Graphics.Rendering.Chart.Easy
import Graphics.Rendering.Chart.Backend.Cairo
import Data.List -- sort
import Data.List.Split -- splitOn
import System.Directory -- listDirectory

--main = toFile def "Bench/euler.png" $ do
--  layout_title .= "Euler Benchmark"
--  plot (line "Haskell" haskell)
--  plot (line "Nim" nim)
--  plot (line "Rust" rust)

main :: IO ()
main = do
  mining

type Until = Int
type Points = [(Double, Double)]
type Data = [Points]

--mining :: Until -> Points
mining = do
  scanDir <- listDirectory "Bench/"
  proto0  <- mapM readFile $ map ("Bench/" ++) (sort scanDir)
  let proto1 = map (splitOn "\n") proto0
      proto2 = map (filter (/= "")) proto1
      proto3 = map (sort . (drop 1)) proto2
  print $ map (map (tuplify . (splitOn ","))) proto3

tuplify :: [a] -> (a, a)
tuplify [x, y] = (x, y)
