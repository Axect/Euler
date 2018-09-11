import std.stdio : writeln;
import std.conv : to;

import problem.p001;
import problem.p002;

void main() {
  answer(1, to!string(p001));
  answer(2, to!string(p002));
}

void answer(int n, string str) {
  writeln("Answer of ", n, "th problem : ", str);
}
