$fn = 90;

/* 
first version
hd = 5;
a = 5;
*/

a = 6; // stem angle
hd = 6; // distance from handlebar to lamp
p = 1; // diameter padding, for rubber


rotate([0, 90, 0]) {
    
    difference() {
        translate([5, -15, -16]) {
            cube([22, 30, 28]);
        }
        {
            Lamp();
            Stem();
        }
    }
    
    translate([18, 14, -7]) rotate([90, 0, 115]) RubberHolder(false);
    translate([18, -14, 3]) rotate([90, 180, 65]) RubberHolder(false);
    
    translate([6, 15, -7]) rotate([90, 0, 65]) RubberHolder(true);
    translate([6, -15, 3]) rotate([90, 180, 115]) RubberHolder(true);

}

module Lamp() {
    translate([0, 0, -30]) {
        cylinder(d = 27 + p, h = 68);
        translate([0, 0, 68]) cylinder(d = 29, h = 42);
    }
}

module Stem() {
    rotate([0, 6, 0]) {
        translate([54 + hd, 0, -60]) {
            oval(40, 38, 120);
        }
    }
}

module RubberHolder(reversed) {
    translate([-1, 0, 0]) cube([6, 10, 3]);
    translate([5, -1.5, 1]) {
        minkowski() {
            cube([1, 13, 1]);
            sphere(1);
        }
        if (reversed) {
            translate([-5.5, 4, -1.87]) rotate([0, -11, 0]) cube([5, 5, 2]);
        } else {
            translate([-6.5, 4, 1]) rotate([0, 11, 0]) cube([6, 5, 2]);
        }
    }
}

module oval(w,h, height, center = false) {
 scale([1, h/w, 1]) cylinder(h=height, r=w, center=center);
}