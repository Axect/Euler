pub fn ans() -> u64 {
    let a: u64 = (1 .. 101)
        .fold(0, |x: u64, y: u64| x + y).pow(2);
    let b: u64 = (1 .. 101)
        .map(|x: u64| x.pow(2)).sum();
    a - b
}