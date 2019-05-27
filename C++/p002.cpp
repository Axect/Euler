#include <iostream>

int main() {
    unsigned i=1, j=1;
    unsigned s = 0;

    while (i < 4000000u) {
        i += j;
        std::swap(i, j);
        s += (i%2 == 0) ? i : 0;
    }
    std::cout << s << std::endl;
}
