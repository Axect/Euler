fn main() {
    let result = (1..)
        .map(|x| 3*x - 1)
        .map(|x| fib_tup(1,1,x).0)
        .take_while(|&x| x <= 4000000)
        .fold(0, |x, y| x + y);

    println!("{:?}", result);
}

fn fib_tup(a: u64, b: u64, n: u64) -> (u64, u64, u64) { 
    match (a,b,n) {
        (_, _, 0) => (a, b, 0),
        (x, y, z) => fib_tup(y, x+y, z-1)
    }
}

