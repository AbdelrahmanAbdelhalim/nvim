#[allow(unused_imports)]
use std::cmp::{min,max};
use std::collections::{HashMap, HashSet, VecDeque};
use std::io::{BufWriter, stdin, stdout, Write};

#[derive(Default)]
struct Scanner {
    buffer: Vec<String>
}
impl Scanner {
    fn next<T: std::str::FromStr>(&mut self) -> T {
        loop {
            if let Some(token) = self.buffer.pop() {
                return token.parse().ok().expect("Failed parse");
            }
            let mut input = String::new();
            stdin().read_line(&mut input).expect("Failed read");
            self.buffer = input.split_whitespace().rev().map(String::from).collect();
        }
    }
}


fn solve(n:usize, k:usize) {
}

fn main() {
    let mut scanner = Scanner::default();
    let t: usize = scanner.next();
    for _ in 0..t {
        let n: usize = scanner.next();
        let k: usize = scanner.next();
        solve(n,k);
    }

}

