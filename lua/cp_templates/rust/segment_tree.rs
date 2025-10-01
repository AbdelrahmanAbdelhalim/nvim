impl<T> segtree<T> {
    /// new(1,1,size)
    pub fn new(u: usize, lo: usize, hi: usize) -> Self {
        let mxn = 200005;
        let mn = vec![T; mxn * 5];
        let lz = vec![T; mxn * 5];
        create(&mn, &lz, u, lo, hi);
        Self {
            mn: mn,
            lz: lz,
        }
    }
    fn create(mn: &mut mn, lz: &mut lz, u: usize, lo: usize, hi: usize) {
        if (lo != hi) {
            let mid = lo + hi >> 1;
            create(mn, lz, u << 1, lo, mid);
            create(mn, lz, u << 1 ^ 1, mid + 1, hi);
        }
    }
    pub fn lazy_prop(&mut self, u: usize) {
        if self.lz[u] == 0 {
            return
        } 
        self.lz[u << 1] += lz[u];
        self.lz[u << 1 ^ 1] += lz[u];
        self.mn[u << 1] += lz[u];
        self.mn[u << 1 ^ 1] += lz[u];
        self.lz[u] = 0;
    }
    pub fn incre(&mut self, s: T, e: T, x: T, u: T, lo: T, hi: T){
        if (lo >= s && hi <= e) {
            mn[u as usize] += x;
            lz[u as usize] += x;
            return
        }
        self.lazy_prop(u as usize);
        let mid = lo + hi >> 1;
        if s <= mid {
            self.incre(s, e, x, u << 1, lo, mid);
        }
        if e > mid {
            self.incre(s, e, x, u << 1 ^ 1, mid + 1, hi);
        }
        mn[u as usize] = min(mn[(u << 1) as usize], mn[(u << 1 ^ 1) as usize]);
    }
}
