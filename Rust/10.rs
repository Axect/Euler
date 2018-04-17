mod prime;

use prime::is_prime;

pub fn main() {
    let result: u64 = Prime { num: 1 }
    .take_while(|&x| x < 2000000)
    .sum();

    println!("Result: {}", result);
}

fn gen_prime() -> Prime {
    Prime { num: 1 }
}
