pub fn ans() -> u64 {
    let a: u64 = (1u64 .. 101)
        .sum::<u64>().pow(2);
    let b: u64 = (1 .. 101)
        .map(|x: u64| x.pow(2)).sum();
    a - b
}
