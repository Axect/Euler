use std::cmp::max;

pub fn ans() {
    let x = vec![1,3,4,6,2,7,8,1,5,9,8,2,5];
    println!("Hello, World!");
    println!("{}", x.h_product());
    let y = vec![x, vec![1,2,3,4,5,6,7,8]];
    println!("{}", y.h_product());
}

type List = Vec<u64>;
type Matrix = Vec<List>;

trait Product {
    type Output;
    fn h_product(&self) -> Self::Output;
}

impl Product for List {
    type Output = u64;
    fn h_product(&self) -> Self::Output {
        let l = self.len();
        (0 .. l-3).map(|x| self.into_iter().skip(x).take(4).fold(
            1,
            |x,y| x * y,
        )).fold(
            0,
            |x,y| max(x,y),
        )
    }
}

trait ArrayProduct {
    type Output;
    fn h_product(&self) -> Self::Output;
    // fn v_product(&self) -> Self::Output;
    // fn d_product(&self) -> Self::Output;
    // fn r_product(&self) -> Self::Output;
    fn transpose(&self) -> Matrix;
    // fn diag(&self) -> List;
    // fn cyclic(&self) -> Matrix;
    // fn cyclics(&self) -> Vec<Matrix>;
}

impl ArrayProduct for Matrix {
    type Output = u64;
    fn h_product(&self) -> Self::Output {
        self.into_iter().map(|x| x.h_product()).fold(
            0,
            |x,y| max(x,y),
        )
    }

    fn transpose(&self) -> Matrix {
        let l = self.len();
        (0 .. l).map(
            |x| self.into_iter().
        )
    }
}

