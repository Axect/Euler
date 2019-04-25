use self::Day::*;
use self::Month::*;

pub fn ans() {
    let mut date = Date {
        year: 1900,
        month: January,
        day: Monday,
        num: 1,
    };
    while date.year == 1900 {
        date.next();
    }
    let mut count_sunday = 0usize;
    loop {
        date.next();
        println!("{:?}-{:?}-{:?}-{:?}", date.year, date.month, date.day, date.num);
        match (date.year, date.month, date.day, date.num) {
            (_, _, Sunday, 1) => count_sunday += 1,
            (2000, December, _, 31) => break,
            _ => (),
        }
    }
    println!("{}", count_sunday);
}

struct Date {
    year: usize,
    month: Month,
    day: Day,
    num: usize,
}

#[derive(Debug, Clone, Copy)]
enum Day {
    Monday,
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
    Saturday,
    Sunday
}

#[derive(Debug, Clone, Copy, PartialEq)]
enum Month {
    January,
    February,
    March,
    April,
    May,
    June,
    July,
    August,
    September,
    October,
    November,
    December
}

impl Iterator for Date {
    type Item = Day;

    fn next(&mut self) -> Option<Self::Item> {
        let (curr_year, curr_month, curr_day, curr_num) = 
            (self.year, self.month, self.day, self.num);
        let capacity: usize = match curr_month {
            February => {
                {
                    if is_leap(curr_year) {
                        29
                    } else {
                        28
                    }
                }
            },
            September => 30,
            April => 30,
            June => 30,
            November => 30,
            _ => 31,
        };

        if curr_num < capacity {
            self.num += 1;
            self.day = next_day(curr_day);
        } else {
            self.num = 1;
            self.day = next_day(curr_day);
            self.month = next_month(curr_month);
            if curr_month == December {
                self.year += 1;
            }
        }

        Some(curr_day)
    }
}

fn is_leap(year: usize) -> bool {
    match (year%4, year%100, year%400) {
        (x, _, _) if x > 0 => false,
        (_, y, _) if y > 0 => true,
        (_, _, z) if z > 0 => false,
        _ => true,
    }
}

fn next_month(month: Month) -> Month {
    match month {
        January => February,
        February => March,
        March => April,
        April => May,
        May => June,
        June => July,
        July => August,
        August => September,
        September => October,
        October => November,
        November => December,
        December => January,
        _ => unreachable!()
    }
}

fn next_day(day: Day) -> Day {
    match day {
        Monday => Tuesday,
        Tuesday => Wednesday,
        Wednesday => Thursday,
        Thursday => Friday,
        Friday => Saturday,
        Saturday => Sunday,
        Sunday => Monday,
        _ => unreachable!()
    }
}
