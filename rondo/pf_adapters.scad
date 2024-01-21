$fn = 90;

tube();
!pf_outer();
pf_bearing();

module tube() {
    difference() {
        cylinder(d = 16, h = 80);
        translate([0, 0, -1]) cylinder(d = 10, h = 82);
    }
}

// Adapter for frame
module pf_outer() {
    difference() {
        translate([0, 0, 0]) {
            cylinder(d = 49, h = 7);
            translate([0, 0, -4.5]) cylinder(d = 40.5, h = 5);
        }
        translate([0, 0, 3.7]) cylinder(d = 36.7, h = 3.4);
        translate([0, 0, -10]) cylinder(d = 10, h = 20);
    }
}

// Adapter for bearing
module pf_bearing() {
    difference() {
        translate([0, 0, 0]) {
            cylinder(d = 44, h = 7);
            translate([0, 0, -6.5]) cylinder(d = 28.5, h = 7);
        }
        translate([0, 0, 4.1]) cylinder(d = 33.3, h = 3);
        translate([0, 0, -10]) cylinder(d = 10, h = 20);
    }
}