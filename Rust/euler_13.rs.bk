#![feature(exclusive_range_pattern)]

use std::fs::File;
use std::io::prelude::*;

pub fn main() {
    let mut f = File::open("data/13.txt").expect("There is no file here");
    let mut texts = String::new();
    f.read_to_string(&mut texts)
        .expect("Something went wrong reading the file");
    let result = texts.split('\n')
        .filter(|&x| x != "")
        .map(
            |x| x.chars()
             .map(|t| t.to_digit(10u32).unwrap() as u64).collect::<Row>()
            ).collect::<Matrix>();
    
    let ls = result.split_sum().merge_sum();
    println!("{:?}", ls);
}

type Row = Vec<u64>;
type Matrix = Vec<Vec<u64>>;

trait LargeRow {
    fn merge_sum(&self) -> String;
}

trait LargeArray {
    fn split_sum(&self) -> Row;
}

impl LargeArray for Matrix {
    fn split_sum(&self) -> Row {
        let mut b: Row = Vec::new();
        for i in 0..self[0].len() {
            let mut s = 0;
            for j in 0..self.len() {
                s += self[j][i];
            }
            b.push(s);
        }
        b
    }
}

impl LargeRow for Row {
    fn merge_sum(&self) -> String {
        let mut a = self.iter().rev()
            .map(|x| *x as u64).collect::<Vec<u64>>();
        for i in 0..self.len() {
            let val = a[i];
            match &val {
                0 .. 9 => (),
                10 .. 99 => if i <= self.len() - 2 { 
                    a[i+1] += val / 10;
                    a[i] -= (val / 10) * 10;
                },
                100 .. 900 => if i <= self.len() - 2 { 
                    a[i+1] += val / 10;
                    a[i] -= (val / 100) * 100 + ((val - (val/100)*100) / 10) * 10;
                },
                _ => ()
            }
        }
        a.into_iter().rev()
            .map(|x| x.to_string())
            .collect::<Vec<String>>()
            .concat()
    }
}
