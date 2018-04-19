use std::fs::File;
use std::io::prelude::*;
use std::ops::Deref;

pub fn main() {
    let mut f = File::open("data/13.txt").expect("There is no file here");
    let mut texts = String::new();
    f.read_to_string(&mut texts)
        .expect("Something went wrong reading the file");
    let result = texts.split('\n')
        .filter(|&x| x != "")
        .collect::<Vec<&str>>();
    
    let ls = large_sum(result);

    println!("{:?}", ls);
}

fn large_sum(str_array: Vec<&str>) -> Vec<u64> {
    let mut mat = str_array.clone();
    let mut times = str_array[0].len();
    let mut sums: Vec<u64> = Vec::new();

    if times > 18 {
        let s: u64 = str_array().into_iter()
            .map(|x| x.to_string().chars().take(18).into_iter().collect::<String>()
                 .parse::<u64>().unwrap())
            .sum();
        sums.push(s);
    }
    sums
}
