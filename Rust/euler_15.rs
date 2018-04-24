pub fn main() {
    println!("{:?}", calc_path(21)[20][20]);  
}

type Lattice = Vec<Vec<u64>>;

fn calc_path(n: usize) -> Lattice {
    let mut lattice: Lattice = vec![vec![1; n]; n];
    for i in 1..n {
        for j in 1..n {
            lattice[i][j] = lattice[i][j-1] + lattice[i-1][j];
        }
    }
    lattice
}
