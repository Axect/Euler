proc main() {
    writeln(+ reduce evenFib(4000000));
}

iter evenFib(val: uint) {
    var (curr, next) = (1, 2);
    for (1..) {
        if curr > val {
            break;
        }
        if curr % 2 == 0 {
            yield curr;
        }
        (curr, next) = (next, curr + next);
    }
}