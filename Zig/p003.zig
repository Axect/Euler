const std = @import("std");
const print = std.debug.print;
const sqrt = std.math.sqrt;

pub fn main() void {
    print("{}\n", .{maxPrimeFactor(600851475143)});
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

fn maxPrimeFactor(n: u64) u32 {
    const range: u32 = @floatToInt(u32, sqrt(@intToFloat(f64, n)));
    var p: u32 = 3;
    var result: u32 = undefined;
    while (p <= range) {
        if (n % p == 0 and isPrime(u32, p)) {
            result = p;
        }
        p += 2;
    }
    return result;
}
