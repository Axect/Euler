import std.stdio : writeln;
import std.math;
import std.range : take;

void main() {
  Prime p;
  p.take(10).writeln;
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
  long maxRange = cast(long)(sqrt(cast(double)n));
  foreach(e; 2 .. maxRange + 1) {
    if (n % e == 0) {
      return false;
    }
  }
  return true;
}

// pure long[] primeFactors(n: long) {
//   long[] result = 
//   long q = n.dup;
// }