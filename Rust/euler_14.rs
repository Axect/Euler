pub fn main() {
    let mut a: (usize, usize) = (0, 0);
    for (i, res) in (2..100_0000).map(|x| chain(x).len()).enumerate() {
        if res > a.1 {
            a = (i+2, res);
        }
    }
    
    println!("{:?}", a);
}

fn chain(start: u64) -> Vec<u64> {
    let mut val = start;
    let mut result: Vec<u64> = vec![val];
    while val!=1 {
        val = match val % 2 {
            0 => val / 2,
            1 => 3 * val + 1,
            _ => 1,
        };
        result.push(val);
    }
    result
}
