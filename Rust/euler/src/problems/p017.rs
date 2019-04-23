pub fn ans() {
    let result = (1 .. 1001)
        .map(|x| num_to_en(x).len())
        .fold(0, |x,y| x + y);
    println!("{}", result);
}

fn num_to_en(n: usize) -> String {
    match n {
        0 ... 9 => NUM_LIST_1[n-1].to_string(),
        10 ... 19 => NUM_LIST_2[n-10].to_string(),
        20 ... 100 => {
            {
                let (q, r) = quot_rem(n, 10);
                if r >= 1 {
                    format!("{}{}", NUM_LIST_3[q-2], NUM_LIST_1[r-1])
                } else {
                    NUM_LIST_3[q-2].to_string()
                }
            }
        },
        101 ... 999 => {
            {
                let (q, r) = quot_rem(n, 100);
                if r >= 1 {
                    format!(
                        "{}hundredand{}",
                        NUM_LIST_1[q-1],
                        num_to_en(n - (q * 100))
                    )
                } else {
                    format!("{}hundred", NUM_LIST_1[q-1])
                }
            }
        },
        1000 => "onethousand".to_string(),
        _ => "n".to_string()
    }
}

fn quot_rem(n: usize, base: usize) -> (usize, usize) {
    (n / base, n % base)
}

const NUM_LIST_1: [&str; 9] = [
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
];

const NUM_LIST_2: [&str; 10] = [
    "ten",
    "eleven",
    "twelve",
    "thirteen",
    "fourteen",
    "fifteen",
    "sixteen",
    "seventeen",
    "eighteen",
    "nineteen",
];

const NUM_LIST_3: [&str; 9] = [
    "twenty",
    "thirty",
    "forty",
    "fifty",
    "sixty",
    "seventy",
    "eighty",
    "ninety",
    "onehundred",
];
