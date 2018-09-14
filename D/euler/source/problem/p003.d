module problem.p003;

import fptools.fp;

long[] p003() {
    auto p = Prime(600851475143);
    return p.factors;
}

struct Prime {
    import std.math : sqrt;

    long num;
    long[] primes;

    this(long n) {
        mixin FP!long;
        auto max = cast(long)sqrt(cast(double)n);

        Pipe p;
        p.input([2L] ~ seq(3, max, 2));
        p.proc(
            filter(x => isPrime(x))
        );
        this.num = n;
        this.primes = p.output;
    }

    long[] factors() {
        long[] result;
        long q = this.num;

        ulong i = 0;

        while (q >= this.primes[i]) {
            if (q % this.primes[i] == 0) {
                result ~= this.primes[i];
                q /= this.primes[i];
            } else {
                i++;
            }
        }
        return result;
    }
}

bool isPrime(long n) {
    import std.math : sqrt;

    mixin FP!long;

    long max = cast(long)(sqrt(cast(double)n));

    Pipe p;
    p.input([2L] ~ seq(3, max, 2));
    return p.all(x => n % x == 0);
}