for &i in dir.iter() {
    let dx = i.0;
    let dy = i.1;
    let nwx = x + dx;
    let nwy = y + dy;
    if valid(nwx, nwy, m, n) { // m and n are the length and width of grid respectively
        sq.push_back((nwx, nwy)); //change push_back to push_front if needed
    }
}
