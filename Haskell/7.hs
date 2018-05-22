import Prime (primes)

main :: IO()
main = print $ primes !! 10001
