include <libs/cyl_head_bolt.scad>

$fn = 50;

d = 40; // hole diameter
h = 18; // height
t = 13; // clamp thickness

#translate([-2, 0, 20]) cube([14, 5, 11]);

difference() {
    clamp();
    tube();
    translate([-15, -40, 0]) cube([50, 80, 1]);
    translate([4.9, -25.5, -4]) nut();
    translate([5.1, 25.5, -4]) nut();
    translate([4.9, -25.5, 5]) bolt();
    translate([5.1, 25.5, 5]) bolt();
}


module tube() {
    translate([-10, 0, 0]) rotate([0, 90, 0]) cylinder(h = 200, d = d);
}

module clamp() {
    radius = 2;
    rotate([0, 90, 0])
        minkowski() {
            cylinder(h = h - radius * 4, d = d + t * 2 - radius * 4);
            sphere(r = 2);
        }
}

module nut() {
    scale([1.05, 1.05, 4]) nutcatch_parallel("M5", clh=0.1);
}

module bolt() {
    //screw("M5x30");
    cylinder(h = 20, d = 8.8);
    translate([0, 0, -15]) cylinder(h = 20, d = 5.3);
}