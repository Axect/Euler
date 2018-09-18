mod prime;

use prime::is_prime;

pub fn main() {
    let result: u64 = (1..200_0000).filter(|&x| is_prime(x)).sum();

    println!("Result: {}", result);
}
