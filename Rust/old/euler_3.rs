#![feature(slice_patterns)]

fn main() {
    let n: u64 = 600851475143;
    println!("{}", prime_factors(n).into_iter().fold(0, |x, y| x.max(y)));
}

struct Prime {
    num: u64,
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

fn is_prime(x: u64) -> bool {
    (2..x + 1).take_while(|p| p * p <= x).all(|p| x % p > 0)
}

fn prime_factors(n: u64) -> Vec<u64> {
    let mut result: Vec<u64> = vec![];
    let mut q = n;
    let mut p = Prime { num: 2 };
    while q >= p.num {
        if q % p.num == 0 {
            result.push(p.num);
            q /= p.num;
        } else {
            p.next();
        }
    }
    result
}