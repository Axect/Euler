void main() {
  import std.stdio : writeln;
  import std.algorithm.comparison : max, min;
  import std.algorithm.iteration : reduce;

  primeFactors(600851475143).reduce!(max).writeln;
}

struct Prime {
  long p = 2;

  enum empty = false;

  long front() const @property {
    return p;
  }

  void popFront() {
    p = p + 1;
    while (!isPrime(p)) {
      p += 1;
    }
  }
}

pure bool isPrime(long n) {
  import std.math;
  import std.range : take;

  long maxRange = cast(long)(sqrt(cast(double)n));
  foreach(e; 2 .. maxRange + 1) {
    if (n % e == 0) {
      return false;
    }
  }
  return true;
}

long[] primeFactors(long n) {
  long[] result;
  long q = n;
  Prime prime;
  while (q >= prime.p) {
    if (q % prime.p == 0) {
      result ~= prime.p;
      q /= prime.p;
    } else {
      prime.popFront();
    }
  }
  return result;
}