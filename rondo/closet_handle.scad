$fn = 90;

one();


!translate([30, 0, 0]) cylinder(d2 = 18, d1 = 26, h = 24,$fn = 4);

module one() {
    difference() {
        translate([0, 0, 0]) {
            sphere(d = 24);
            translate([0, 0, -7]) cube([24, 24, 3], true);
        }
        translate([0, 0, -13.5]) cube([24, 24, 10], true);
    }
}

