pub fn ans() {
    let abundant_numbers = (12usize .. 28124).filter(|&x| is_abundant(x)).collect::<Vec<usize>>();
    let mut cannot_be_sum_of_abundant = vec![0usize; 28124];
    for i in 0 .. abundant_numbers.len() {
        let x = abundant_numbers[i];
        if x >= 14062 {
            break;
        }
        for j in i .. abundant_numbers.len() {
            let y = abundant_numbers[j];
            if (x + y) > 28123 {
                break;
            } else {
                cannot_be_sum_of_abundant[x + y] = x + y;
            }
        }
    }
    let result: usize = 28123 * 28124 / 2 - cannot_be_sum_of_abundant.into_iter().sum::<usize>();
    println!("{}", result);
}

fn is_abundant(n: usize) -> bool {
    let mut s = 1usize;
    let n_sqrt = (n as f64).sqrt() as usize;

    for i in 2 .. (n_sqrt + 1) {
        let co_div = n / i;
        if n % i == 0 {
            if i != co_div {
                s += i;
                s += co_div;
            } else {
                s += i;
            }
        }
        if s > n {
            return true;
        }
    }
    s > n
}
