use pyo3::prelude::*;
use pyo3::wrap_pyfunction;

// =============================================================================
// Problem 001
// =============================================================================
#[pyfunction]
fn p001() -> PyResult<usize> {
    let mut s = 0usize;
    for number in 1 .. 1000 {
        if number % 3 == 0 || number % 5 == 0 {
            s += number;
        }
    }
    Ok(s)
}

// =============================================================================
// Problem 002
// =============================================================================
#[pyfunction]
fn p002() -> PyResult<usize> {
    let mut fib: (usize, usize) = (1, 2);
    let mut s = 0usize;
    while fib.0 <= 400_0000 {
        let num = &fib.0;
        if num % 2 == 0 {
            s += num;
        }
        fib = (fib.1, fib.0 + fib.1);
    }
    Ok(s)
}


#[pymodule]
pub fn backend(_py: Python, m: &PyModule) -> PyResult<()> {
    m.add_wrapped(wrap_pyfunction!(p001))?;
    m.add_wrapped(wrap_pyfunction!(p002))?;

    Ok(())
}

