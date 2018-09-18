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
        let new_next = self.curr + self.next;

        self.curr = self.next;
        self.next = new_next;

        Some(self.curr)
    }
}