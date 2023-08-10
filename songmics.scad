$fn = 90;

difference() {
    import("songmics_support.stl");
    translate([-50, -2, 7]) {
        cube([100, 4, 20]);
    }
    translate([-2, -50, 7]) {
        cube([4, 100, 20]);
    }
    
    translate([-50, 1, 2]) {
        #cube([100, 20, 3.5]);
    }
}