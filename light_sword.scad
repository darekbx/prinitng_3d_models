$fn = 90;

d = 14.5;
h = 20;

two();

module two() {
    difference() {
        translate([0, 0, 0]) {
            cylinder(d = 17, h = 150);
            translate([0, 0, -24]) cylinder(d = d, h = 25);
        }
        translate([0, 0, 4]) cylinder(d = d, h = 113.2);
        translate([0, 0, -30]) cylinder(d = d - 3, h = 160);
        
        translate([0, 0, 117.1]) cylinder(d1 = d, d2 = d - 3, h = 8);
        translate([0, 0, 125.1]) cylinder(d = d - 3, h = 2);
        translate([0, 0, 126]) cylinder(d = d, h = 30);
    }
}

module one() {
    difference() {
        translate([0, 0, 0]) {
            cylinder(d = 17, h = 170);
            translate([0, 0, 170]) sphere(d = 17);
        }
        translate([0, 0, -0.5]) cylinder(d = d, h = h);
        translate([0, 0, 4]) cylinder(d = 10, h = h);
        translate([0, 0, h + 3.9]) cylinder(d = d, h = 168-h);
    }
}