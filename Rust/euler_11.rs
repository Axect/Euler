use std::fs::File;
use std::io::prelude::*;

pub fn main() {
    let mut f = File::open("data/11.txt").expect("file not found");
    let mut contents = String::new();
    f.read_to_string(&mut contents)
        .expect("Something went wrong reading the file");
    let result = contents.split('\n')
        .map(|x| x.split(' ').collect::<Vec<&str>>())
        .filter(|ref x| *x != &vec![""])
        .collect::<Vec<Vec<&str>>>();

    let mat = gen_matrix(result);

    let (h, v) = (mat.h_product(), mat.v_product());

    println!("{:?}, {:?}", h, v);
    println!("{:?}", mat.diagonal());
}

// Type Aliases
type Row = Vec<u64>;
type Matrix = Vec<Vec<u64>>;

trait MatOperation {
    fn transpose(&self) -> Matrix;
    fn diagonal(&self) -> Row;
    fn h_product(&self) -> u64;
    fn v_product(&self) -> u64;
}

// Matrix Tool
fn gen_matrix(str_array: Vec<Vec<&str>>) -> Matrix {
    str_array.iter()
        .map(|x| x.iter().map(|t| t.to_string().parse::<u64>().unwrap()).collect::<Row>())
        .collect::<Matrix>()
}

// Product Tool
fn prod_row(row: Row) -> u64 {
    let mut largest = 1;
    for i in 0..row.len()-4 {
        let mut prod = 1;
        for j in i..i+4 {
            prod *= row[j];
            if prod > largest {
                largest = prod;
            }
        }
    }
    largest
}

impl MatOperation for Matrix {
    fn transpose(&self) -> Matrix {
        let mut a = self.clone();
        for i in 0..self.len() {
            for j in 0..self[i].len() {
                a[i][j] = self[j][i];
            }
        }
        a
    }

    fn diagonal(&self) -> Row {
        let mut row: Row = Vec::new();
        for i in 0..self.len() {
            row.push(self[i][i]);
        }
        row
    }

    fn h_product(&self) -> u64 {
        self.iter()
            .map(|v| prod_row(v.to_vec()))
            .max().unwrap()
    }

    fn v_product(&self) -> u64 {
        self.transpose().h_product()
    }
}
