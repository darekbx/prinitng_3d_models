$fn = 90;

d1 = 6.6;
d2 = 4.5;
height = 3.5;
distance = 13;
angle = 5;


bolts();
top();
//wing();

module bolts() {
    rotate([0, -angle, 0]) bolt(d1, height);
    translate([d1 / 2 + d2 / 2 + distance, 0, -1]) bolt(d2, height + 1);
}

module bolt(diameter, height) {
    cylinder(d = diameter, h = height);
    translate([0, 0, -1]) cylinder(d1 = diameter - 0.8, d2 = diameter, h = 1);
}

module top() {
    translate([-0.1, 0, 3.1]) minkowski() {
        cube([18, 0.0001, 0.7]);
        cylinder(d = d1, h = 0.0001);
    }
}

module wing() {
    s = 1.75;
    translate([20, 1, 3]) rotate([56, 0, 180]) scale([s, s, 1]) linear_extrude(1.2) {
        polygon([
            [0, 0],
            [12, 8],
            [25, 8],
            [13, 0],
            [0, 0]
        ]);
    }
    translate([20, -1.5, 3]) rotate([65, 0, 180]) scale([s, s-0.13, 1]) linear_extrude(1.2) {
        polygon([
            [0, 0],
            [12, 8],
            [25, 8],
            [13, 0],
            [0, 0]
        ]);
    }
}



/*
difference() {
    translate([-150, -21, 0]) import("helmetwing_left.stl");
    #translate([0, 18, -5.1]) cube([50, 1, 4]);
}*/