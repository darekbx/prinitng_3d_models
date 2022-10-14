$fn = 90;
t = 3; // thickness
h = 30; // mount height
d = 8; // bottom diameter

cube([60, 30, t]);

translate([15, 30 / 2, t]) {
    cylinder(d1 = d, d2 = d / 2, h = h);
    translate([30, 0, 0]) cylinder(d1 = d, d2 = d / 2, h = h);
}