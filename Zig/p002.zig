const std = @import("std");
const warn = std.debug.warn;

pub fn main() void {
    var f: Fib = Fib.init(1, 2);

    const s = blk: {
        var c: u32 = 0;
        while (f.curr <= 4000000) {
            if (f.curr % 2 == 0) {
                c += f.curr;
            }
            f.iter();
        }
        break :blk c;
    };
    warn("result: {}\n", s);
}

const Fib = struct {
    curr: u32,
    next: u32,

    pub fn init(x1: u32, x2: u32) Fib {
        return Fib {
            .curr = x1,
            .next = x2,
        };
    }

    pub fn iter(self: Fib) void {
        const c = self.curr;
        const n = self.next;
        self.curr = n; // compile error <- Can't change member
        self.next = c + n;
    }
};
