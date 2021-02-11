const std = @import("std");
const print = std.debug.print;
const sqrt = std.math.sqrt;

pub fn main() void {
    var p = primeFactors(600851475143);
    print("result: {}\n", .{p[p.len - 1]});
}

const Prime = struct {
    num: u32,

    pub fn next(self: Prime) Prime {
        var n = self.num + 1;
        while (!isPrime(u32, n)) {
            n += 1;
        }
        return Prime{
            .num = n,
        };
    }
};

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
    var array: [100]u32 = undefined;
    var p = Prime{ .num = 2 };
    var i: u32 = 0;
    while (p.num <= range) {
        if (n % p.num == 0) {
            array[i] = p.num;
            i += 1;
        }
        p = p.next();
    }
    return array[0..i];
}
