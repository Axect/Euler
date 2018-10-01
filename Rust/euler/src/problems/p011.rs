use std::fmt;
use std::cmp::max;

pub fn ans() {
    let mut a = Eleven::new(vec![vec![1,2,3], vec![3,4,3], vec![3,2,3]]);
    println!("{}", a.max_horizontal());
}

#[derive(Debug, Clone)]
pub struct Eleven {
    i: usize,
    j: usize,
    data: Vec<Vec<u64>>,
    prod: u64,
}

impl fmt::Display for Eleven {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        writeln!(f, "Position: {}, {}\nProduct: {}", self.i, self.j, self.prod)
    }
}

impl Eleven {
    fn new(v: Vec<Vec<u64>>) -> Eleven {
        Eleven {
            i: 0,
            j: 0,
            data: v.clone(),
            prod: v[0][0],
        }
    }

    fn move_right(&mut self) {
        self.j += 1;
        self.prod *= self.data[self.i][self.j];
    }

    fn move_down(&mut self) {
        self.i += 1;
        self.prod *= self.data[self.i][self.j];
    }

    fn move_diag(&mut self) {
        self.i += 1;
        self.j += 1;
        self.prod *= self.data[self.i][self.j];
    }

    fn next_row(&mut self) {
        self.i += 1;
        self.j = 0;
        self.prod = self.data[self.i][self.j];
    }

    fn next_col(&mut self) {
        self.i = 0;
        self.j += 1;
        self.prod = self.data[self.i][self.j];
    }

    fn reset_prod(&mut self) {
        self.prod = self.data[self.i][self.j];
    }

    fn next_diag(&mut self, n: usize) {
        self.i = 0;
        self.j = n;
        self.prod = self.data[self.i][self.j];
    }

    fn max_horizontal(&self) -> u64 {
        let l = self.data.len() as usize;
        let mut m = self.clone();
        let mut p = 1;
        while m.i < (l - 1) {
            while m.j < (l - 1) {
                m.move_right();
            }
            if m.j == (l - 1) {
                if p <= m.prod {
                    p = m.prod;
                }
                m.next_row();
            }
        }
        if m.i == (l - 1) {
            while m.j < (l-1) {
                m.move_right();
            }
        }
        return max(m.prod, p);
    }
}


