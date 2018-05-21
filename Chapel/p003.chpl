use Math;

proc main() {
    writeln(isPrime(12));
    writeln(primes(100));
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