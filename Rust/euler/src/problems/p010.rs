use crate::problems::tools::Prime;

pub fn ans() -> u64 {
    Prime { num: 1 }
        .take_while(|&x| x < 2_000_000)
        .sum()
}
