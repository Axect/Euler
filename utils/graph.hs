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
  let proto1 = map ((filter (/= "")) . (splitOn "\n")) proto0
      proto2 = map (sort . (drop 1)) proto1
      proto3 = map (map (readDouble . (!! 1) . (splitOn ","))) proto2
  print $ proto3

readDouble :: String -> Double
readDouble str = read str :: Double
