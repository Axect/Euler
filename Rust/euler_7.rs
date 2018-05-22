mod prime;

use prime::Prime;

fn main() {
    let mut p = Prime { num: 1 };
    println!("{}", p.nth(10000).unwrap());
}
