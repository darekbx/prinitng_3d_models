$fn = 45;

w = 107;
h = 68;
d = 15;
e = 24;

difference() {
    minkowski() {
        cube([w - e, h - e, 4], true);
        cylinder(d1 = e - 6, d2 = e, h = d - 2);
    }
    
    translate([0, 0, -10]) minkowski() {
        cube([w - e, h - e, d], true);
        cylinder(d = e/2, h = d);
    }

    translate([0, 0, -1]) cube([120, 50, d], true);
    translate([0, 0, -1]) cube([90, 80, d], true);
    
    for (i = [-2, -1, 0, 1, 2]) {
        translate([0, i * 12, 10]) b();
    }
}

module b() {
    minkowski() {
        cube([86, 1, d], true);
        cylinder(d = 5, h = 0.01);
    }
}