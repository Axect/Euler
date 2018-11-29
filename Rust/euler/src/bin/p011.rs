extern crate peroxide;
use peroxide::*;
use std::process::exit;

fn main() {
    let b = Matrix::read("data/p011.csv", false, ' ');
    let c = match b {
        Ok(m) => m,
        Err(e) => {
            println!("{}", e);
            exit(1)
        },
    };
    c!(c.h_product(), c.v_product(), c.d_product(), c.r_product()).reduce(0, |x,y| x.max(y)).print();
}

trait Problem11Vector {
    fn product(&self) -> f64;
}

impl Problem11Vector for Vector {
    fn product(&self) -> f64 {
       let mut max = 1f64;

        for i in 0 .. (self.len()-4) {
            let mut p = 1f64;
            for j in i .. (i+4) {
                p *= self[j];
            }
            max = if p > max { p } else { max };
        }
        return max;
    }
}

trait Problem11Matrix {
    fn h_product(&self) -> f64;
    fn v_product(&self) -> f64;
    fn d_product(&self) -> f64;
    fn r_product(&self) -> f64;
}

impl Problem11Matrix for Matrix {
    fn h_product(&self) -> f64 {
        let r = self.row;
        let mut max = 1f64;
        for i in 0 .. r {
            let p = self.row(i).product();
            max = if p > max { p } else { max };
        }
        return max;
    }

    fn v_product(&self) -> f64 {
        let c = self.col;
        let mut max = 1f64;
        for i in 0 .. c {
            let p = self.col(i).product();
            max = if p > max { p } else { max };
        }
        return max;
    }

    fn d_product(&self) -> f64 {
        let n = self.row;
        assert_eq!(self.row, self.col);

        let mut max = 1f64;

        for i in 0 .. n {
            for j in 0..(n-4) {
                let mut p = 1f64;
                for k in j .. j+4 {
                    let idx = (i + k) % n;
                    p *= self[(idx, k)];
                }
                max = if p > max { p } else { max };
            }
        }
        return max;
    }

    fn r_product(&self) -> f64 {
        let n = self.row;
        assert_eq!(self.row, self.col);

        let mut max = 1f64;

        for i in 0 .. n {
            for j in 0..(n-4) {
                let mut p = 1f64;
                for k in j .. j+4 {
                    let idx = (i + k) % n;
                    p *= self[(n-idx-1, k)];
                }
                max = if p > max { p } else { max };
            }
        }
        return max;
    }
}
