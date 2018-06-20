void main() {
    Fibonacci fib;

    import std.stdio : writeln;
    import std.range : enumerate;
    import std.algorithm.searching : until;
    import std.algorithm.iteration : sum, filter;

    fib.until!("a >= 4000000")
        .filter!(x => x%2 == 0)
        .sum
        .writeln;
}

struct Fibonacci {
    int a = 2; int b = 3;

    enum empty = false;

    int front() const @property {
        return a;
    }

    void popFront() {
        auto t = a;
        a = b;
        b = t + b;
    }
}