pub fn ans() -> u64 {
    
}

//Type aliases
type Row = Vec<u64>;
type Matrix = Vec<Vec<u64>>;

trait RowOperation {
    fn large_product(&self) -> u64;
}

trait MatrixOperation {
    fn transpose(&self) -> Matrix;
    fn swap_complete(&self) -> Matrix;
    fn diagonal(&self) -> Row;
    fn cyclic(&self) -> Matrix;
    fn horizontal_product(&self) -> u64;
    fn vertical_product(&self) -> u64;
    fn diagonal_product(&self) -> u64;
    fn reverse_diagonal_product(&self) -> u64;
}
