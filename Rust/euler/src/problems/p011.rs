pub fn ans() {
    
}

pub struct Matrix<T> {
    i: u64,
    j: u64,
    data: Vec<Item>,
}

impl Matrix<T> {
    pub fn new(x: u64, y:u64, v: Vec<T>) -> Matrix {
        Matrix {
            i: x,
            j: y,
            data: v,
        }
    }
}
