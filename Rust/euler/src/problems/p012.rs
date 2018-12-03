use crate::problems::tools::prime_factors;

pub fn ans() {
    println!("{:?}", triangular_gen(7));
    println!("{}", number_of_divisors(36));
}

fn triangular_gen(n: u64) -> Vec<u64> {
    let mut s: u64 = 0;
    let mut v: Vec<u64> = vec![0u64; n as usize];
    for i in 1 .. n+1 {
        s += i;
        v[(i-1) as usize] = s;
    }
    v
}

fn number_of_divisors(x: u64) -> usize {
    let p = prime_factors(x);
    p.len()
} 
