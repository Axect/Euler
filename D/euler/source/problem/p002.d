module problem.p002;

import dnum.tensor;
import dnum.utils;
import dnum.stats;

int p002() {
  auto fib = Fib(1, 2);
  int s = 0;
  while(fib.curr <= 4000000) {
    if (fib.curr % 2 == 0) {
      s += fib.curr;
    }
    fib.update;
  }
  return s;
}

struct Fib {
  int curr;
  int next;

  this(int i1, int i2) {
    this.curr = i1;
    this.next = i2;
  }

  void update() {
    int a, b;
    a = this.curr;
    b = this.next;
    this.curr = b;
    this.next = a + b;
  }
}
