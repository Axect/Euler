pub struct Prime {
    pub num: u64,
}

impl Iterator for Prime {
    type Item = u64;
    
    fn next(&mut self) -> Option<Self::Item> {
        self.num += 1;
        while !is_prime(self.num) {
            self.num += 1;
        }
        Some(self.num)
    }
}

pub fn is_prime(n: u64) -> bool {
    let range: u64 = (n as f64).sqrt() as u64;
    if n == 2 {
        return true;
    } else if n % 2 == 0 {
        return false;
    }
    
    let mut i: u64 = 3;
    
    while i <= range {
        if n % i == 0 {
            return false;
        } else {
            i += 2;
        }
    }
    true
}

pub fn prime_factors(n: u64) -> Vec<u64> {
    let range: u64 = (n as f64).sqrt() as u64;
    Prime { num : 1}
        .take_while(|&x| x <= range)
        .filter(|&x| n % x == 0)
        .collect::<Vec<u64>>()
}