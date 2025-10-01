let m = grid.len();
let n = grid[0].len();
let dirs = [(1, 0), (0, 1), (-1, 0), (0, -1)];
let valid_idx = |x: i32, y: i32, m: i32, n: i32| {
    x >= 0 && x < m && y >= 0 && y < n
};
