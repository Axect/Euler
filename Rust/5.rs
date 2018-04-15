fn main() {
    let mut move_lcm = 1;
    for i in 1..21 {
        move_lcm = lcm(move_lcm, i);
    }
    println!("Result: {}", move_lcm);
}

fn lcm(a: u64, b: u64) -> u64 {
    a*b / gcd(a,b)
}

fn gcd(a: u64, b: u64) -> u64 {
    if b == 0 { a } else { gcd(b, a%b) }
}
