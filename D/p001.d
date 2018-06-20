void main() {
    import std.range : iota;
    import std.algorithm.iteration : filter, sum;
    import std.stdio : writeln;

    iota(1,1000)
        .filter!(x => x%3 == 0 || x%5 == 0)
        .sum
        .writeln;
}