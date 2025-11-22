$fn = 90;

difference() {
    translate([0, 0, 0]) {
        translate([0, 0, 9]) cylinder(d1 = 8, d2 = 7, h = 4);
        cylinder(d = 8, h = 9);
        cylinder(d = 16, h = 2);
    }
    translate([0, 0, -1]) cylinder(d = 6, h = 20);
}