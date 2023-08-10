$fn = $preview ? 60 : 120;

difference() {
    minkowski() {
        cube([34, 1, 4]);
        cylinder(h = 13, r1 = 25, r2 = 14);
    }
    translate([30, 4, 64]) rotate([-10, 0, 0]) kindle();
    translate([17, -6, 7]) rotate([-10, 0, 0]) inset();
    translate([-9, -14, -1]) cylinder(d = 10.5, h = 2);
    translate([-9, 15, -1]) cylinder(d = 10.5, h = 2);
    translate([39, -14, -1]) cylinder(d = 10.5, h = 2);
    translate([39, 15, -1]) cylinder(d = 10.5, h = 2);
}

module kindle() {
    minkowski() {
        cube([167, 9 - 2 * 2, 116], true);
        sphere(r = 2);
    }
}

module inset() {
    minkowski() {
        cube([66, 9 - 2 * 2, 5], true);
        sphere(r = 2);
    }
}