fn main() {
    println!("Result: {:?}", sum_multiple(999))
}

fn sum_multiple(n: u64) -> u64 {
    (1..n + 1).filter(|x| x % 3 == 0 || x % 5 == 0).fold(
        0,
        |x, y| x + y,
    )
}
