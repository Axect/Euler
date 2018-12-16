#![feature(exclusive_range_pattern)]
mod problems;


use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    let name: u64 = args[1].parse::<u64>().unwrap();

    match name {
        1 => problems::p001_ans(),
        2 => problems::p002_ans(),
        3 => problems::p003_ans(),
        4 => problems::p004_ans(),
        5 => problems::p005_ans(),
        6 => problems::p006_ans(),
        7 => problems::p007_ans(),
        8 => problems::p008_ans(),
        9 => problems::p009_ans(),
        10 => problems::p010_ans(),
        11 => problems::p011_ans(),
        12 => problems::p012_ans(),
        13 => problems::p013_ans(),
        _ => (),
    }
}
