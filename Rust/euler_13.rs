use std::fs::File;
use std::io::prelude::*;

pub fn main() {
    let mut f = File::open("data/13.txt").expect("There is no file here");
    let mut texts = String::new();
    f.read_to_string(&mut texts)
        .expect("Something went wrong reading the file");
    let mat = texts.split('\n')
        .filter(|&x| x != "")
        .map(|x| x.chars().take(10).collect::<String>().parse::<u64>().unwrap())
        .collect::<Vec<u64>>();

    println!("{:?}", mat)
}
