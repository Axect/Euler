use std::fs::File;
use std::io::prelude::*;

pub fn main() {
    let mut f = File::open("Data/11.txt").expect("file not found");
    let mut contents = String::new();
    f.read_to_string(&mut contents).expect(
        "Something went wrong reading the file",
    );
    let result = contents
        .split('\n')
        .map(|x| x.split(' ').collect::<Vec<&str>>())
        .filter(|ref x| *x != &vec![""])
        .collect::<Vec<Vec<&str>>>();

    let mat = gen_matrix(result);

    let (h, v, d1, d2) = (
        mat.h_product(),
        mat.v_product(),
        mat.d_product(),
        mat.swap_complete().d_product(),
    );

    println!("{:?}, {:?}, {:?}, {:?}", h, v, d1, d2);
}

// Type Aliases
type Row = Vec<u64>;
type Matrix = Vec<Vec<u64>>;

// Trait for Row
trait RowOperation {
    fn prod_row(&self) -> u64;
}

// Trait for Matrix
trait MatOperation {
    fn transpose(&self) -> Matrix;
    fn swap_complete(&self) -> Matrix;
    fn diagonal(&self) -> Row;
    fn cyclic(&self) -> Matrix;
    fn h_product(&self) -> u64;
    fn v_product(&self) -> u64;
    fn d_product(&self) -> u64;
}

// Implementation for RowOperation
impl RowOperation for Row {
    fn prod_row(&self) -> u64 {
        let mut largest = 1;
        for i in 0..self.len() - 3 {
            let mut prod = 1;
            for j in i..i + 4 {
                prod *= self[j];
                if prod > largest {
                    largest = prod;
                }
            }
        }
        largest
    }
}

// Implementation for Matrix Operation
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

    fn swap_complete(&self) -> Matrix {
        let mut a = self.clone();
        for i in 0..self.len() {
            for j in 0..self[i].len() {
                a[i][j] = self[i][self.len() - 1 - j];
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

    fn cyclic(&self) -> Matrix {
        let mut a = self.clone();
        a.truncate(self.len() - 1);
        a.insert(0, self.last().unwrap().to_vec());
        a
    }

    fn h_product(&self) -> u64 {
        self.iter().map(|v| v.to_vec().prod_row()).max().unwrap()
    }

    fn v_product(&self) -> u64 {
        self.transpose().h_product()
    }

    fn d_product(&self) -> u64 {
        let mut largest = 1;
        let mut a = self.clone();
        for _i in 0..self.len() {
            let prod = a.diagonal().prod_row();
            if prod > largest {
                largest = prod;
            }
            a = a.cyclic();
        }
        largest
    }
}

// Matrix Tool
fn gen_matrix(str_array: Vec<Vec<&str>>) -> Matrix {
    str_array
        .iter()
        .map(|x| {
            x.iter()
                .map(|t| t.to_string().parse::<u64>().unwrap())
                .collect::<Row>()
        })
        .collect::<Matrix>()
}
