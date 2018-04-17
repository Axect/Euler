using Primes, Lazy

function main()
  result = sum(filter(isprime, 1:2000000))
  println(result)
end
 
main()
