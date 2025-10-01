//Watchout for usize
struct Union {
    ids: Vec<usize>,    
}
impl Union {
    pub fn new(n: usize) -> Self {
        let ids: Vec<usize> = (0..n).map(|x| x).collect();
        Self {
            ids: ids
        }
    }
    pub fn find(&mut self, i: usize) -> usize {
        if self.ids[i] != i  {
            self.ids[i] = self.find(i);
        }
        self.ids[i]
    }
    pub fn union(&mut self, a: usize, b: usize) {
        let a = self.find(a);
        let b = self.find(b);
        if a != b {
            self.ids[a] = b;    
        }
    }
}
