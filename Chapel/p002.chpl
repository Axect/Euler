proc main() {
    var s = 0;
    for i in evenFib(4000000) {
        s += i;
    }
    writeln(s);
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