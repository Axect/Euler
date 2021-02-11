const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    var f: Fib = Fib.init(1, 2);

    const s = blk: {
        var c: u32 = 0;
        while (f.curr <= 4000000) {
            if (f.curr % 2 == 0) {
                c += f.curr;
            }
            f = f.next_fib();
        }
        break :blk c;
    };
    print("result: {}\n", .{s});
}

const Fib = struct {
    curr: u32,
    next: u32,

    pub fn init(x1: u32, x2: u32) Fib {
        return Fib{
            .curr = x1,
            .next = x2,
        };
    }

    fn next_fib(self: Fib) Fib {
        return Fib{
            .curr = self.next,
            .next = self.curr + self.next,
        };
    }
};
