use std::mem::swap;

pub fn ans() -> u64 {
    Fib { curr: 1, next: 2}
        .take_while(|&x| x <= 4_000_000)
        .filter(|&x| x % 2 == 0)
        .fold(0, |x, y| x + y)
}

struct Fib {
    curr: u64,
    next: u64,
}

impl Iterator for Fib {
    type Item = u64;
    fn next(&mut self) -> Option<Self::Item> {
        self.curr += self.next;
        swap(&mut self.curr, &mut self.next);

        Some(self.curr)
    }
}
