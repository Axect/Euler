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

    println!("{:?}", result);
}
