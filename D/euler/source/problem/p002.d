module problem.p002;

import fptools.fp;

int p002() {
    mixin FP!int;

    Pipe p;
    p.input(fib(400_0000));
    p.proc(
        filter(x => x%2 == 0)
    );
    return p.reduce((x,y) => x + y);
}

int[] fib(int max) {
    int[] fibs;
    int curr = 1;
    int next = 1;
    while(curr < max) {
        int a = next;
        int b = curr + next;
        fibs ~= a;
        curr = a;
        next = b;
    }
    return fibs;
}