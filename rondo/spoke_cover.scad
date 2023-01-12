$fn = 30;

length = 200;
thickness = 6;

rotate([-90, 0, 0]) {
    difference() {
        translate([0, 0, 0]) {
            cylinder(d = thickness, h = length);
            translate([0, 0, length]) cylinder(d1 = thickness, d2 = 3.5, h = 10);
        }
        translate([0, 0, -1]) spoke();
        translate([-1.5, 0, -2]) cube([3, 8, 13]);
        translate([0, 0, -1]) nippel();
        translate([-1, 0, -2]) cube([2, 8, 300]);
    }
}

module nippel() {
    cylinder(d = 4.2, h = 12);
}

module spoke() {
    cylinder(d = 2.1, h = 300);
}