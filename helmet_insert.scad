$fn = 90;

d1 = 6.4;
d2 = 4.5;
height = 3.2;
distance = 13;
angle = 2;

bolts();
top();

module bolts() {
    rotate([0, -angle, 0]) bolt(d1);
    translate([d1 / 2 + d2 / 2 + distance, 0, 0]) bolt(d2);
}

module bolt(diameter) {
    cylinder(d = diameter, h = height);
    translate([0, 0, -1]) cylinder(d1 = diameter - 0.8, d2 = diameter, h = 1);
}

module top() {
    translate([-0.1, 0, 3.1]) minkowski() {
        cube([18, 0.0001, 1]);
        cylinder(d = d1, h = 0.0001);
    }
}