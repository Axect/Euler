fn main() {
    let mut maximum = 0;
    for i in 100..1000 {
        for j in i..1000 {
            let temp = i * j;
            if is_palindrome(temp) && (temp > maximum) {
                maximum = temp;
            }
        }
    }
    println!("Largest: {}", maximum);
}

fn is_palindrome(n: u64) -> bool {
    let s = n.to_string();
    // zip makes simultaneous iterator
    for (i1, i2) in s.chars().zip(s.chars().rev()) {
        if i1 != i2 {
            return false;
        }
    }
    return true;
}
