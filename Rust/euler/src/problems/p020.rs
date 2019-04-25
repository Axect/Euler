extern crate ramp;
use ramp::Int;

pub fn ans() {
    let mut a = Int::from(1);
    for i in 2 .. 101 {
        a *= i;
    }
    println!("{}", digit_sum(a));
}

fn digit_sum(a: Int) -> usize {
    let mut s = 0usize;
    let mut b = a.clone();
    while b > 10 {
        s += usize::from(&(b.clone() % 10));
        b /= 10;
    }
    s + usize::from(&b)
}
