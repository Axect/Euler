mod prime;

use prime::Prime;

pub fn main() {
    // a_n = 1 + Σ(n+1) = 1 + n(n-1)/2 + n-1 = n(n+1)/2
    let result: Num = (1..)
        .map(|x| x*(x+1)/2)
        .skip_while(|x| x.calc_divisors() < 500)
        .take(1)
        .sum();

    println!("Result: {:?}", result);
}

type Num = u64;

trait Divisors {
    fn calc_divisors(&self) -> u64;
}

impl Divisors for Num {
    fn calc_divisors(&self) -> u64 {
        let mut a = self.clone();
        let mut div: u64 = 1;

        for p in gen_prime().take_while(|p| p < self) {
            let mut count: u64 = 0;
            while a%p == 0 && a >= p {
                a = a / p;
                count += 1;
            }
            div *= (count + 1);
            if a < p { break; }
        }
        div
    }
}

fn gen_prime() -> Prime {
    Prime { num: 1 }
}
