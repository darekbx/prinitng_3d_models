$fn = 90;

//!arm();
//!disk();

// body
cube([30, 50, 10]);
armMount();

// axe
translate([15, 15, 10]) cylinder(d = 2.6, h = 3);

// disk
module disk() {
    translate([-15, 15, 10]) difference() {
        cylinder(d = 18, h = 3);
        translate([0, 0, -1]) cylinder(d = 2.9, h = 6);
    }
}

// arm
module arm() {
    difference() {
        translate([0, 0, 0]) {
            translate([14, 25, 30]) rotate([0, -90, 0]) curve(2, 3, 32, 12);
            translate([16, 42, 30]) rotate([0, -90, 0]) cylinder(d = 7, h = 5);
        }
        translate([16.5, 42, 30]) rotate([0, -90, 0]) cylinder(d = 3.9, h = 5);
    }
    translate([14, 7.5, 29]) cube([2, 3.5, 2]);
    translate([15, 8.75, 27]) cube([1, 1, 2]);
}

module armMount() {
    translate([17+13, 42, 15]) rotate([0, -90, 0]) cylinder(d = 3.8, h = 4 + 13);
    translate([17, 40.1, 7]) cube([13, 3.8, 8]);
    translate([17, 42.1, 4]) rotate([45, 0, 0]) cube([13, 8, 8]);
}

module curve(width, height, length, dh) {
    r = (pow(length/2, 2) + pow(dh, 2))/(2*dh);
    a = 2*asin((length/2)/r);
    translate([-(r -dh), 0, -width/2]) rotate([0, 0, -a/2])         rotate_extrude(angle = a) translate([r, 0, 0]) square(size = [height, width], center = true);
}