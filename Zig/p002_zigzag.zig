const std = @import("std");
const warn = std.debug.warn;

pub fn main() void {
    var f = Fib(u32).new(1, 2);
    var s: u32 = 0;
    while (f.n1 <= 4000000) {
        if (f.n1 % 2 == 0) {
            s += f.n1;
        }
        f.next();
    }
    warn("result: {}\n", s);
}

pub fn Fib(comptime T: type) type {
    return packed struct {
        const Self = @This();

        pub n1: T,
        pub n2: T,

        pub fn new(x: T, y: T) Self {
            return Self {
                .n1 = x,
                .n2 = y,
            };
        }

        pub fn next(self: *Self) void {
            const n1 = self.n1;
            const n2 = self.n2;
            self.n1 = n2;
            self.n2 = n1 + n2;
        }
    };
}
