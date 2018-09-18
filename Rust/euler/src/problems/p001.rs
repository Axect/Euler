pub fn ans() -> u64 {
    (1 .. 1000).filter(|x| x%3 == 0 || x%5 == 0).fold(
        0,
        |x, y|
        x + y,
    )
}