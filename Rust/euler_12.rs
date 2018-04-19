pub fn main() {
    // a_n = 1 + Σ(n+1) = 1 + n(n-1)/2 + n-1 = n(n+1)/2
    let result: Num = (1..)
        .map(|x| x * (x + 1) / 2)
        .take_while(|x| x.calc_divisors() < 600)
        .filter(|x| x.calc_divisors() > 500)
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
        let l = self.clone() / 2;
        let mut count: u64 = 0;
        
        for _i in 1..(l+1) {
            if self % l == 0 {
                count += 1;
            }
        }
        count
    }
}
