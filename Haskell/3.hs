module Prime where

-- import Data.Numbers.Primes (Very Fast Prime Module)

main :: IO()
main = do
  let s = 600851475143
  print $ primeFactors'' s

-- Source Code of Data.Numbers.Primes
primes' = 2 : [x | x <- [3..], isPrime' x]
isPrime' x = all (\p -> x `rem` p > 0) (factorsToTry x)
  where
    factorsToTry x = takeWhile (\p -> p*p <= x) primes'

primeFactors' n = filter (\p -> mod n p == 0) (takeWhile (\p -> p*p <= n) primes')

-- Accelerate! (if m become smaller than p^2 then stop iteration!)
factors :: Integral a => a -> [a] -> [a]
factors 1 _ = []
factors m (p:ps) | m < p*p = [m]
                 | r==0 = p:factors q (p:ps)
                 | otherwise = factors m ps
                 where (q,r) = quotRem m p

-- More Fast primeFactors
primeFactors'' n = factors n (takeWhile (\p -> p*p <= n) primes')
