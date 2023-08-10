$fn = 90;

difference() {
    cylinder(d = 40, h = 7);
    translate([0, 0, -1]) cylinder(d = 37, h = 12);
    translate([-20, 0, -1]) cube([50, 20, 50]);
}

translate([0, -19, 3.5]) rotate([90, 0, 0]) cylinder(d = 7, h = 120);
translate([0, -139, 3.5]) rotate([90, 0, 0]) cylinder(d1 = 7, d2 = 2, h = 20);