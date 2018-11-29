extern crate peroxide;
use peroxide::*;

fn main() {
    let a = c!(1,2,3,4,5);
    a.print();

    let b = Matrix::read("data/p011.csv", false, ' ');
    b.unwrap().print();
}