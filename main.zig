const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const stdout = std.io.getStdOut().writer();
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        try stdout.print("Usage: {s} <src file>\n", .{args[0]});
        return;
    }

    const path = args[1];
    const file = try std.fs.cwd().openFile(path, .{});
    const src_bytes = try file.readToEndAlloc(allocator, 65536);
    defer allocator.free(src_bytes);

    var cell: u8 = 0;

    for (src_bytes) |ch| {
        switch (ch) {
            '+' => cell +%= 1,
            '-' => cell -%= 1,
            '.' => try stdout.writeByte(cell),
            else => {},
        }
    }
}
