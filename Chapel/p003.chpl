use Math;

proc main() {
    writeln(max reduce primeFactors(600851475143));
}

proc isPrime(n: int): bool {
    if n == 2 then return true;

    const high: int = floor(sqrt(n)) : int;
    var dom: domain(1) = {2 .. high};
    for x in dom {
        if (n % x == 0) {
           return false;
        }
    }
    return true;
}

iter primes(val: int) {
    for x in 2..val {
        if isPrime(x) {
            yield x;
        }
    }
}

iter primeFactors(val: int) {
    var (quot, rem) = (val, 0);
    var p: int = 2;
    while quot >= p {
        if quot % p == 0 {
            yield p;
            quot /= p;
        } else {
            p += 1;
            while !isPrime(p) {
                p += 1;
            }
        }
    } 
}