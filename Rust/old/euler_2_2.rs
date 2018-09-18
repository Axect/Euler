fn main() {
    let result = Fibonacci { curr: 1, next: 1 }
        .take_while(|&x| x <= 4000000)
        .filter(|&x| x % 2 == 0)
        .fold(0, |x, y| x + y);
    println!("{:?}", result);
}

struct Fibonacci {
    curr: u64,
    next: u64,
}

impl Iterator for Fibonacci {
    type Item = u64;

    fn next(&mut self) -> Option<u64> {
        let new_next = self.curr + self.next;

        self.curr = self.next;
        self.next = new_next;

        Some(self.curr)
    }
}
