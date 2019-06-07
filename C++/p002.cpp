#include <iostream>

class EvenFib {
public:
    EvenFib(int s1, int s2) : curr(s1), next(s2) {}
    void operator()() {
        curr += next;
        std::swap(curr, next);
        while (curr % 2 == 1)
            (*this)();
    }
    int& get_curr() {
        return this->curr;
    }
private:
    int curr, next;
};

int main() {
    EvenFib f(1, 2);
    f(); // Find First even
    int& curr = f.get_curr();
    long s = 0;

    while (curr <= 4000000) {
        s += curr;
        f();
    }

    std::cout << s << std::endl;
}
