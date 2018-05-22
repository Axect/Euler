import Data.Csv
import qualified Data.ByteString.Lazy as BSL

import Data.List -- sort
import Data.List.Split -- splitOn
import System.Directory -- listDirectory

main = do
  (haskell, nim, rust) <- mining
  BSL.writeFile "Bench/toPlot/haskell.csv" $ encode haskell
  BSL.writeFile "Bench/toPlot/nim.csv" $ encode nim
  BSL.writeFile "Bench/toPlot/rust.csv" $ encode rust


type Until = Int
type Points = [(Double, Double)]
type Data = (Points, Points, Points)

mining :: IO Data
mining = do
  scanDir <- listDirectory "Bench/data/"
  proto0  <- mapM (readFile . ("Bench/data/" ++)) (sort scanDir)
  let proto1  = map (filter (/= "") . (splitOn "\n")) proto0
      proto2  = map (sort . (drop 1)) proto1
      proto3  = map (map (readDouble . (!! 1) . (splitOn ","))) proto2
      haskell = zip [1.0 ..] (map (!! 0) proto3)
      nim     = zip [1.0 ..] (map (!! 1) proto3)
      rust    = zip [1.0 ..] (map (!! 2) proto3)
  return (haskell, nim, rust)

readDouble :: String -> Double
readDouble str = read str :: Double

