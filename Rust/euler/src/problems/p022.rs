use std::fs::File;
use std::io::prelude::*;

pub fn ans() {
    let mut f = File::open("data/p022.txt").expect("Can't open file");
    let mut reader = String::new();
    f.read_to_string(&mut reader).expect("Can't read file");
    
    let mut sorted_reader = reader.split(',').map(|t| t.to_string()).collect::<Vec<String>>();
    sorted_reader.sort();

    let mut score = 0usize;

    for (i, name) in sorted_reader.into_iter().enumerate() {
        let mut temp = name.to_string();
        temp.retain(|c| c != '\"');
        let temp_score = (i + 1) * name_score(temp.clone());
        score += temp_score;
        println!("{}-{}: {}/{}", i, temp, temp_score, score);
    }

    println!("{}", score);
}

fn name_score(s: String) -> usize {
    s.chars().map(|x| ((x as u8) - 64) as usize).sum()
}
