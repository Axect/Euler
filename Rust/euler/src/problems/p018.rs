use std::cmp::max;
use std::fs::File;
use std::io::prelude::*;

pub fn ans() {
    let mut f= File::open("data/p018.csv").expect("Can't open file");
    let mut txts = String::new();
    f.read_to_string(&mut txts).expect("Can't read file");
    let mut result = txts
        .split('\n')
        .filter(|&x| x != "")
        .map(|x| x.split(' ').map(|t| t.parse::<usize>().unwrap()).collect::<Vec<usize>>())
        .rev()
        .collect::<Vec<Vec<usize>>>();
    println!("{}", reduce_total(&mut result));
}

fn reduce_total(xs: &mut Vec<Vec<usize>>) -> usize {
    if xs.len() == 1 {
        xs[0][0]
    } else {
        let head = xs[0].clone();
        for i in 0 .. (head.len() - 1) {
            xs[1][i] += max(head[i], head[i+1]);
        }
        reduce_total(&mut xs[1..].to_vec())
    }
}
