include <threads.scad>

$fn = 60;

//top();
translate([0, 0, 21.3]) rotate([180,0,0]) bottom();
//h();

//#translate([-17,0,2])cylinder(d = 1,h = 17);

module bottom(filled = false) {
    difference() {
        translate([0,0,0]) {
            cylinder(d = 40, h = 1.4);
            cylinder(d = 32, h = 15);
        }
        if (!filled) {
            translate([0,0,-8]) cylinder(d=32-4, h=40);
        }
    }

    difference() {
        translate([0,0,15]) {
            if (false&&$preview) {
                cylinder(d=32, h=6);
            } else {
                metric_thread(diameter = 32, pitch = 2, length = 6, internal = true);
            }
        }
        if (!filled) {
            translate([0,0,-8]) cylinder(d=32-4, h=40);
        }
    }
    
}
module h() {
    translate([0,4,24]) {
    difference() {
        rotate([-90,0,0]) import("Hook_single.stl");
        translate([0,11,-2]) cylinder(d = 3, h = 15);
        translate([0,11,8]) cylinder(d = 4.2, h = 5);
    }
    }
}

module top() {
    difference() {
        cylinder(d = 40, h = 3);
        translate([0,0,-16.3]) scale([1.05,1.05,1]) bottom(true);
    }
}