$fn = 12;

minkowski() {
    difference() {
        cylinder(h = 26, d1 = 40, d2 = 50);
        translate([0, 0, 2]) cylinder(h = 27, d1 = 38, d2 = 48);
    }
    
    sphere(r = 1);
}