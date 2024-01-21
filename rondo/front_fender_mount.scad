include <libs/cyl_head_bolt.scad>;

$fn = 60;

rotate([90, 0, 0]) {
    difference() {
        body();
        translate([0, 0, 7]) cylinder(d = 9, h = 4);
        translate([0, 0, -3]) cylinder(d = 9, h = 5);
    }
    mount();
    clamp();
}

module mount() {
    difference() {
        cylinder(d = 12, h = 9);
        translate([0, 0, -1]) cylinder(d = 6.3, h = 13);
        translate([0, 0, 7]) cylinder(d = 9, h = 5);
        translate([0, 0, -3]) cylinder(d = 9, h = 5);
    }
}

module clamp() {
    translate([54, 4.5, -0.5]) difference() {
        cylinder(d = 11, h = 10);
        translate([-7, -9, 4]) cube([16, 20, 2]);
        translate([0, 0, -1]) cylinder(d = 4.5, h = 14);
        translate([0, 0, 11]) nutcatch_parallel("M4");
        translate([0, 0, 2]) nutcatch_parallel("M4");
        translate([-42, -4.5, 5]) rotate([0, 90, 0]) cylinder(d = 5, h = 70);
    }
}

module body() {
    translate([4, 0, 4.5]) rotate([0, 90, 0]) difference() {
        cylinder(d = 7, h = 60);
        translate([0, 0, -1]) cylinder(d = 4.8, h = 70);
        translate([-1, 0, 26.1]) cube([2, 10, 34]);
        translate([-4.5, 4.5, 50]) rotate([0, 90, 0]) {
            translate([0, 0, -1]) cylinder(d = 4.5, h = 14);
            translate([0, 0, 11]) nutcatch_parallel("M4");
            translate([0, 0, 2]) nutcatch_parallel("M4");
        }
    }
}