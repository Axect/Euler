#![feature(exclusive_range_pattern)]

pub fn main() {
    println!("Hello, world!");
    let a: Vec<u64> = vec![2,0];
    println!("{:?}", iterate_exp(a, 1000).into_iter().sum::<u64>());
}

type Exp = Vec<u64>;

trait ExpOps {
    fn exp(&self) -> Exp;
}

impl ExpOps for Exp {
    fn exp(&self) -> Exp {
        let mut a = self.iter().rev().map(|x| 2 * x).collect::<Exp>();
        for i in 0..a.len() {
            let val = a[i];
            match &val {
                0..9 => (),
                10..99 => {
                    if i <= self.len() - 2 {
                        a[i+1] += val / 10;
                    } else {
                        a.push(val / 10);
                    }
                    a[i] -= (val / 10) * 10;
                }
                100..999 => {
                    if i <= self.len() - 2 {
                        a[i+1] += val / 10;
                    } else {
                        a.push(val/10);
                    }
                    a[i] -= (val / 100) * 100 + ((val - (val / 100) * 100) / 10) * 10;
                }
                _ => (),
            }
        }
        a.iter().rev().map(|x| *x).collect::<Exp>()
    }
}

fn iterate_exp(target: Exp, pow: u64) -> Exp {
    match (&target, pow) {
        (_, 1) => target.clone(),
        (t, n) => iterate_exp(t.exp(), n-1),
    }
}
