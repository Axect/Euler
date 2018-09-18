pub fn ans() -> u64 {
    Palindrome { digit: Digit::Three(100, 100) }
        .take_while(|&x| x < 1_000_000)
        .filter(|&x| is_palindrome(x))
        .max().unwrap()
}

pub enum Digit {
    Two(u64, u64),
    Three(u64, u64),
}

pub struct Palindrome {
    digit: Digit,
}

impl Iterator for Palindrome {
    type Item = u64;
    fn next(&mut self) -> Option<Self::Item> {
        let mut s: u64 = 0;
        match self.digit {
            Digit::Two(x, y) => {
                if y == 99 {
                    s = (x + 1).pow(2);
                    self.digit = Digit::Two(x + 1, x + 1);
                } else {
                    s = x * (y+1);
                    self.digit = Digit::Two(x, y + 1)
                }
            },
            Digit::Three(x, y) => {
                if y == 999 {
                    s = (x + 1).pow(2);
                    self.digit = Digit::Three(x + 1, x + 1);
                } else {
                    s = x * (y+1);
                    self.digit = Digit::Three(x, y + 1)
                }
            },
        }
        Some(s)
    }
}

pub fn is_palindrome(n: u64) -> bool {
    let s: String = n.to_string();
    for (i1, i2) in s.chars().zip(s.chars().rev()) {
        if i1 != i2 {
            return false;
        }
    }
    return true;
}