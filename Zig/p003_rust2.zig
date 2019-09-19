const std = @import("std");
const warn = std.debug.warn;
const sqrt = std.math.sqrt;

pub fn main() void {
    const p = primeFactors(600851475143);
    warn("result: {}\n", p[p.len - 1]);
}

pub fn Prime(comptime T: type) type {
    return packed struct {
        const Self = @This();

        pub num: T,

        pub fn new(n: T) Self {
            return Self {
                .num = n,
            };
        }

        pub fn next(self: *Self) void {
            self.num += 1;
            while (!isPrime(T, self.num)) {
                self.num += 1;
            }
        }
    };
}

fn isPrime(comptime T: type, n: T) bool {
    const range: u32 = @floatToInt(u32, sqrt(@intToFloat(f64, n)));
    if (n == 2) {
        return true;
    } else if (n % 2 == 0 or n == 1) {
        return false;
    }

    var i: u32 = 3;

    while (i <= range) {
        if (n % i == 0) {
            return false;
        } else {
            i += 2;
        }
    }
    return true;
}

fn primeFactors(n: u64) []u32 {
    const range: u32 = @floatToInt(u32, sqrt(@intToFloat(f64, n)));
    var array: [10]u32 = undefined;
    var p = Prime(u32).new(1);
    var i: u32 = 0;
    while (p.num <= range) {
        if (n % p.num == 0) {
            array[i] = p.num;
            i += 1;
        }
        p.next();
    }
    return array[0 .. i];
}