#![feature(slice_patterns)]

fn main() {
    let n: u64 = 600851475143;
    println!("{:?}", prime_factors(n));
}

pub struct Prime {
    pub num: u64,
}

impl Iterator for Prime {
    type Item = u64;
    fn next(&mut self) -> Option<u64> {
        let mut new_next = self.num + 1;
        while !is_prime(new_next) {
            new_next += 1;
        }

        self.num = new_next;

        Some(self.num)
    }
}

pub fn is_prime(x: u64) -> bool {
    (2..x + 1).take_while(|p| p * p <= x).all(|p| x % p > 0)
}

pub fn prime_factors(n: u64) -> Vec<u64> {
    Prime { num: 1 }
        .take_while(|&p| p * p <= n)
        .filter(|&p| n % p == 0)
        .collect::<Vec<u64>>()
}
