module problem.p003;

import fptools.fp;

long[] p003() {
    return primeFactors(600851475143);
}

struct Prime {
    long num = 2;

    enum empty = false;

    long front() const @property {
        return num;
    }

    void popFront() {
        num += 1;
        while (!isPrime(num)) {
            num += 1;
        }
    }
}

bool isPrime(long n) {
    import std.math : sqrt;

    long max = cast(long)(sqrt(cast(double)n));

    int i = 2;
    while(i <= max) {
        if (n % i == 0) {
            return false;
        }
        i++;
    }
    return true;
}

//TODO - Range to pipe
long[] primeFactors(long n) {
    
}

long[] takeWhile(bool delegate(long) p)