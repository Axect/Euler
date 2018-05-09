import Graphics.EasyPlot
import Data.List -- sort
import Data.List.Split -- splitOn
import System.Directory -- listDirectory

main = do
  scanDir <- listDirectory "Bench/toPlot/"
  proto0  <- mapM readFile $ map ("Bench/toPlot/" ++) (sort scanDir)
  let proto1  = map ((filter (/= "")) . (splitOn "\n")) proto0
      proto2  = map (sort . (drop 1)) proto1
      proto3  = map (map (readDouble . (!! 1) . (splitOn ","))) proto2
      haskell = zip [1.0 ..] (map (!! 0) proto3)
      nim     = zip [1.0 ..] (map (!! 1) proto3)
      rust    = zip [1.0 ..] (map (!! 2) proto3)
  plot X11
    $ [ Data2D [Title "Haskell", Style Linespoints] [] haskell
      , Data2D [Title "Nim", Style Linespoints]     [] nim
      , Data2D [Title "Rust", Style Linespoints]    [] rust
      ]



type Until = Int
type Points = [(Double, Double)]
type Data = (Points, Points, Points)

readDouble :: String -> Double
readDouble str = read str :: Double

