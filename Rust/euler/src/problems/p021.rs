pub fn ans() {
    let result: usize = (2usize .. 10001).filter(|x| is_amicable(*x)).sum();
    println!("{}", result);
}

fn is_amicable(n: usize) -> bool {
    let m = divisor_sum(n);
    n != m && n == divisor_sum(m)
}

fn divisor_sum(n: usize) -> usize {
    let mut s = 1usize;
    let sqrt_n = (n as f64).sqrt().round() as usize;
    for i in 2 .. sqrt_n + 1 {
        if n % i == 0 {
            let quot = n / i;
            if i != quot {
                s += i + quot;
            } else {
                s += i;
            }
        }
    }
    s
}
