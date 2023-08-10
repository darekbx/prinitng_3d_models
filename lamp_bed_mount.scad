include <libs/cyl_head_bolt.scad>

$fn = $preview ? 45 : 180;

lamp_d = 12;
bolt_d = 6;
s_bolt_d = 4.5;

//#placeholders();

difference() {
    translate([0, 0, 150]) mount();
    placeholders();
    bolt();
}

module mount() {
    height = 8;
    
    difference() {
        translate([0, 0, 0]) {
            translate([-30, 12, 0]) cube([40, 7, 20]);
            translate([-10, -height, 0]) cube([20, 18 + height, 20]);
            translate([0, -height, 0]) cylinder(d = 20, h = 20);
            
        }
        translate([0, -height, -50]) cylinder(h = 200, d = lamp_d);
        translate([3, -height-1, -1]) cube([10, 3, 22]);
    }
    difference() {
        translate([2, -height, 0]) { 
            // mount
            translate([5, 2, 0]) cube([16, 5, 20]);
            translate([5, -6, 0]) cube([16, 5, 20]);
        }
        translate([2, -height, 0]) {
            translate([13, 20, 10]) rotate([90, 0, 0]) {
                cylinder(d = s_bolt_d, h = 60);
                translate([0, 0, 16]) nut();
            }
        }
    }
}

module nut() {
    scale([1.05, 1.05, 4]) nutcatch_parallel("M4", clh=0.1);
}

module placeholders() {
    // Bed
    translate([-40, 20, 0]) cube([200, 10, 200]);
}

module bolt() {
    // Bolt
    translate([-20, 74, 160]) rotate([90, 0, 0]) { 
        cylinder(d = bolt_d, h = 60);
        translate([0, 0, 57.5]) cylinder(d1 = 6, d2 = 8, h = 3);
        translate([0, 0, 60]) cylinder(d = 15, h = 3);
    }
}