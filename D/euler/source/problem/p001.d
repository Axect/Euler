module problem.p001;

import fptools.fp;

int p001() {
    mixin FP!int;

    Pipe p;
    p.input(seq(1,999));
    p.proc(
        filter(x => (x%3 == 0 || x%5 == 0))
    );
    return p.reduce((x,y) => x + y);
}