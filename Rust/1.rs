fn main() {
    println!("Result: {:?}", sumMultiple(999))
}

fn sumMultiple(n: u64) -> u64 {
    (1..n+1)
        .filter(|x| x%3 == 0 || x%5 == 0)
        .fold(0, |x,y| x + y)
}
