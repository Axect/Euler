use std::fs::File;
use std::io::prelude::*;

pub fn main() {
    let mut f = File::open("../Data/8.txt").expect("file not found");
    let mut contents = String::new();
    f.read_to_string(&mut contents)
        .expect("Something went wrong reading the file");
    let result = contents.chars()
        .map(|x| x.to_digit(10u32).unwrap() as u64)
        .collect::<Vec<u64>>();
    
    let gp = greatest_product(result);

    println!("Result: {:?}", gp);
}

fn greatest_product(xs: Vec<u64>) -> u64 {
    let mut gp = 1;
    for i in 0..(xs.len()-12) {
        let mut prod = 1;
        for j in i..(i+13) {
            prod *= xs[j];
        }
        if prod >= gp {
            gp = prod;
        }
    }
    gp
}
