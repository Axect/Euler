fn main() {
    println!("{:?}, {:?}", gcd(16, 36), lcm(16,36));
}

fn lcm(a: u64, b: u64) -> u64 {
    a*b / gcd(a,b)
}

fn gcd(a: u64, b: u64) -> u64 {
    if b == 0 { a } else { gcd(b, a%b) }
}

