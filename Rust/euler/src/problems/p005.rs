pub fn ans() -> u64 {
    (1 .. 21)
        .fold(1, |x, y| lcm(x, y))
}

pub struct GCD {
    num1: u64,
    num2: u64,
}

pub fn gcd(x: u64, y: u64) -> u64 {
    let g = GCD { num1: x, num2: y};
    match g {
        GCD { num1: 0, num2: a } => a,
        GCD { num1: a, num2: 0 } => a,
        GCD { num1: a, num2: b } if a >= b => gcd(a%b, b),
        GCD { num1: a, num2: b } if a < b => gcd(a, b%a),  
        _ => 0,
    }
}

pub fn lcm(x: u64, y: u64) -> u64 {
    x * y / gcd(x, y)
}