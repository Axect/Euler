use peroxide::fuga::*;

#[allow(dead_code)]
pub fn ans() {
    let mut m = matrix(vec![1f64; 21*21], 21, 21, Row);

    for i in 1 .. 21 {
        for j in 1 .. 21 {
            m[(i, j)] = m[(i-1, j)] + m[(i, j-1)];
        }
    }

    m[(20,20)].print();
}
