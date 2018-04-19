fn main() {
    let sum = 5050_u64.pow(2) - (1..101).map(|x| x * x).fold(0, |x, y| x + y);
    println!("Result: {}", sum)
}
