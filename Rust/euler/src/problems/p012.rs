use crate::problems::tools::Prime;

pub fn ans() {
    // a_n = 1 + Σ(n+1) = 1 + n(n-1)/2 + n-1 = n(n+1)/2
    let result: u64 = (1..)
        .map(|x| x * (x+1) / 2)
        .skip_while(|&x| number_of_divisors(x) < 500)
        .take(1)
        .sum();

    println!("{}", result);
}

fn number_of_divisors(a: u64) -> u64 {
    let mut div: u64 = 1;
    let b = (a as f64).sqrt() as u64;

    for p in gen_prime().take_while(|&p| p < b) {
        let mut x = a;
        let mut count: u64 = 0;
        while x % p == 0 && x >= p {
            x /= p;
            count += 1;
        }
        div *= count + 1;
        if x < p {
            break;
        }
    }
    div
}

fn gen_prime() -> Prime {
    Prime { num: 1 }
}
