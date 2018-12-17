#[allow(dead_code)]
pub fn ans() {
    let mut result: (u64, usize) = (1, 1);

    for i in 2 .. 100_0000 {
        let c = Collatz::new(i);
        let l = collatz_len(c);
        if l > result.1 {
            result.0 = i;
            result.1 = l;
        }
    }

    println!("{:?}", result);
}

fn collatz_len(c: Collatz) -> usize {
    c.take_while(|&x| x > 1).collect::<Vec<u64>>().len()
}

struct Collatz {
    num: u64,
}

impl Collatz {
    fn new(num: u64) -> Collatz {
        Collatz { num: num }
    }
}

impl Iterator for Collatz {
    type Item = u64;
    fn next(&mut self) -> Option<u64> {
        let mut n = self.num;

        if n.is_even() {
            n = n / 2;
        } else {
            n = 3 * n + 1;
        }

        self.num = n;

        Some(self.num)
    }
}

trait Num {
    fn is_even(&self) -> bool;
    fn is_odd(&self) -> bool;
}

impl Num for u64 {
    fn is_even(&self) -> bool {
        self % 2 == 0
    }

    fn is_odd(&self) -> bool {
        self % 2 == 1
    }
}
