pub fn ans() -> u64 {
    Triplet { a: 1, b: 2, c: 3, constrain: 1000}
        .next().unwrap()
}

pub struct Triplet {
    a: u64,
    b: u64,
    c: u64,
    constrain: u64,
}

impl Iterator for Triplet {
    type Item = u64;
    fn next(&mut self) -> Option<Self::Item> {
        let mut x = self.a;
        let mut y = self.b;
        let mut z = self.c;

        if y == 300 {
            x += 1;
        } else {
            y += 1;
        }
        z = ((x.pow(2) + y.pow(2)) as f64).sqrt() as u64;
    
        while !(z.pow(2) == (x.pow(2) + y.pow(2)) && x + y + z == self.constrain) {
            if y >= (z - 1) {
                x += 1;
                y = x + 1;
            } else {
                y += 1;
            }
            z = ((x.pow(2) + y.pow(2)) as f64).sqrt() as u64;
        }

        self.a = x;
        self.b = y;
        self.c = z;
        
        Some(x * y * z)
    }
}