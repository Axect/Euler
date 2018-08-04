import std.stdio : writeln;

void main() {
    auto s = 0;
    
    foreach(i; 0 .. 1000) {
        if (i % 3 == 0 || i % 5 == 0) {
            s += i;
        }
    }

    s.writeln;
}