pub fn ans() {
    let mut a: Vec<usize> = vec![1];
    for _i in 0 .. 1000 {
        a.exp();
    }
    println!("{}", a.into_iter().fold(0, |x, y| x + y));
}

trait ExpVec {
    fn exp(&mut self);
}

impl ExpVec for Vec<usize> {
    fn exp(&mut self) {
        let mut n = 0usize;
        let mut up = false;

        while n < self.len() - 1 {
            let target = 2*self[n];
            if target >= 10 {
                self[n] = target % 10;
                if up {
                    self[n] += 1;
                }
                up = true;
            } else {
                self[n] = target;
                if up {
                    self[n] += 1;
                }
                up = false;
            }
            n += 1;
        }

        let target = 2*self[n];
        if target >= 10 {
            self[n] = target % 10;
            self.push(1);
        } else {
            self[n] = target;
        }
        if up {
            self[n] += 1;
        }
    }
}
