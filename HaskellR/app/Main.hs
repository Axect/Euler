module Main where

import           Vector
import           Stats
import           Data.Random.Normal

main :: IO ()
main = do
  print "Hello"
  let a = Vector [1 .. 100] :: Vector Double
      r = mkNormals 42
      b = a + Vector (take 100 r)
  print $ lm a b
