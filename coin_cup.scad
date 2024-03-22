$fn = 12;

minkowski() {
    difference() {
        cylinder(h = 26, d1 = 30, d2 = 40);
        translate([0, 0, 2]) cylinder(h = 27, d1 = 28, d2 = 38);
    }
    
    sphere(r = 1);
}