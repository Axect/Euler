use crate::problems::tools::Prime;

pub fn ans() -> u64 {
    Prime { num: 1 }
        .nth(10000).unwrap()
}