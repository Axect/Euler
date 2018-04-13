fn main() {
    println!("{:?}", is_prime(5))
}

fn is_prime(n: u64) -> bool {

}

fn primes_up_to(limit: usize) -> Vec<usize> {
    (2..limit)
        .retain(|&x| x)
}
