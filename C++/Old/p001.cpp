#include <iostream>

int main() {
    unsigned int s = 0u;

    for (unsigned n = 1; n < 1000; n++)
        s += (n % 3 == 0 || n % 5 == 0) ? n : 0u;

    std::cout << s << std::endl;
}
