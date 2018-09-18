use std::fs::File;
use std::io::Read;

pub fn ans() -> u64 {
    let mut f = File::open("data/p008.txt").expect("File not found");
    let mut data = String::new();
    f.read_to_string(&mut data).expect("Reading error");
    data.retain(|s| s != '\n'); // remove new line
    let results = data
        .chars()
        .map(|x| x.to_digit(10u32).unwrap() as u64)
        .collect::<Vec<u64>>();
    greatest_product(results)
}

pub fn greatest_product(ns: Vec<u64>) -> u64 {
    let mut gp: u64 = 0;
    for i in 0 .. (ns.len() - 12) {
        let mut prod: u64 = 1;
        for j in i .. (i + 13) {
            prod *= ns[j] as u64;
        }
        if gp <= prod {
            gp = prod;
        }
    }
    return gp;
}