#![feature(slice_patterns)]

fn main() {
    let n: u64 = 600851475143;
    println!("{:?}", prime_factors(n));
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
    (2..x+1)
        .take_while(|p| p*p <= x)
        .all(|p| x%p > 0)
}

fn prime_factors(n: u64) -> Vec<u64> {
    Prime { num: 1 }
    .take_while(|&p| p*p <=n )
    .filter(|&p| n%p == 0)
    .collect::<Vec<u64>>()
}

/* It's not lazy language. So, it can't axcelerate speed.
fn factors(n: u64, ns: Vec<u64>) -> Vec<u64> {
    match (n, ns.as_slice()) {
        (1, _) => vec![],
        (m, &[p, ref ps..]) => 
            if m < p*p { 
                vec![m] 
            } else if m%p == 0 {
                let mut t: Vec<u64> = vec![p];
                let mut origin: Vec<u64> = vec![p];
                origin.extend(ps.to_vec());
                t.extend(factors(m/p,  origin));
                t
            } else {
                factors(m, ps.to_vec())
            },
        (_, &[]) => vec![]
    }
}
*/
