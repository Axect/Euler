mod prime;

use prime::Prime;

fn main() {
    for (i, val) in gen_prime().enumerate() {
        if i > 10000 {
            println!("result: {}", val);
            break;
        }
    }
}

fn gen_prime() -> Prime {
    Prime { num: 1 }
}
