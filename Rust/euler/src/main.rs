#![feature(exclusive_range_pattern)]
mod problems;

#[macro_use]
extern crate peroxide;

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
        14 => problems::p014_ans(),
        15 => problems::p015_ans(),
        16 => problems::p016_ans(),
        17 => problems::p017_ans(),
        18 => problems::p018_ans(),
        19 => problems::p019_ans(),
        20 => problems::p020_ans(),
        21 => problems::p021_ans(),
        22 => problems::p022_ans(),
        23 => problems::p023_ans(),
        _ => (),
    }
}
