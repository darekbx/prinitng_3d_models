$fn = 120;

r1 = 7 / 2;
r2 = 12 / 2;
a = 55;

top();

difference() {
    plug();
    translate([0, 0, -2.2]) cube([15, 15, 5], true);
}

module top() {
    intersection() {
        minkowski() {
            oval(0.1, 5, 0.1);
            translate([0, -2.5, 0]) cylinder(r1 = 3.5, r2 = 0.1, h = 3);
        }
        oval(r1, r2, 1);
    }
}
module plug() {
    difference() {
        translate([0, 1.9, -1]) 
            rotate([a, 0, 0]) {
                cylinder(r = r1, h = 15);
                translate([0, 0, 13]) cylinder(r1 = r1 + 0.3, r2 = r1, h = 2);
        }
        translate([-0.5, -8, 0]) rotate([a, 0, 0]) cube([1, 10, 10]);
    }
}

module oval(w, h, height, center = false) {
    scale([1, h / w, 1]) cylinder(h = height, r = w, center = center);
}