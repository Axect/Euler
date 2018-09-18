pub fn main() {
    let mut a = (1u64, 1u64, 1u64);
    for i in 1..999 {
        for j in 1..(1000 - i) {
            if is_pythagorean(i, j, 1000 - (i + j)) {
                a = (i, j, 1000 - (i + j));
            }
        }
    }
    println!("a,b,c : {:?}", a);
    println!("product: {:?}", a.0 * a.1 * a.2)
}

fn is_pythagorean(a: u64, b: u64, c: u64) -> bool {
    a.pow(2) + b.pow(2) == c.pow(2)
}
