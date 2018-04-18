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
    println!("{:?}", diagonal(mat));
}

// Type Aliases
type Row = Vec<u64>;
type Matrix = Vec<Vec<u64>>;

trait MatProd {
    fn h_product(&self) -> u64;
    fn v_product(&self) -> u64;
}

// Matrix Tool
fn gen_matrix(str_array: Vec<Vec<&str>>) -> Matrix {
    str_array.iter()
        .map(|x| x.iter().map(|t| t.to_string().parse::<u64>().unwrap()).collect::<Row>())
        .collect::<Matrix>()
}

fn transpose(mat: Matrix) -> Matrix {
    let mut a = mat.clone();
    for i in 0..mat.len() {
        for j in 0..mat[i].len() {
            a[i][j] = mat[j][i];
        }
    }
    a
} 

fn diagonal(mat: Matrix) -> Row {
    let mut row: Vec<u64> = Vec::new();
    for i in 0..mat.len() {
        row.push(mat[i][i]);
    }
    row
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

/*
fn h_product(mat: Matrix) -> u64 {
    mat.iter()
        .map(|v| prod_row(v.to_vec()))
        .max().unwrap()
}

fn v_product(mat: Matrix) -> u64 {
    h_product(transpose(mat))
}
*/

impl MatProd for Matrix {
    fn h_product(&self) -> u64 {
        self.iter()
            .map(|v| prod_row(v.to_vec()))
            .max().unwrap()
    }

    fn v_product(&self) -> u64 {
        transpose(self.to_vec()).h_product()
    }
}
