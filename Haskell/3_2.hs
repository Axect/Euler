primes = 2 : (filter isPrime [3 ..])
isPrime n = all (\p -> n `mod` p > 0) (takeWhile (\p -> p * p <= n) primes)

primeFactors :: Integer -> [Integer]
primeFactors n = primeFactors' n primes
 where
  primeFactors' n xs@(p:ps) | n < p          = []
                            | n `mod` p == 0 = p : primeFactors' (n `div` p) xs
                            | otherwise      = primeFactors' n ps
