const std = @import("std");
const warn = std.debug.warn;

pub fn main() void {
    var num: i32 = 1;
    var s: i64 = 0;
    while (num < 1000) {
        if (@rem(num, 3) == 0 or @rem(num, 5) == 0) {
            s += num;
        }
        num += 1;
    }
    warn("result: {}\n", s);
}
