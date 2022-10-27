$fn = 90;

debug = false;

if (debug) {
    #cylinder(r1 = 75, h = 1);

    translate([18, 18, 2]) rotate([0, 0, 45]) #cube([48, 1, 1]);
    translate([70, 20, 2]) rotate([0, 0, 135]) #cube([73, 1, 1]);
}

BCD = 90;
BT  = 10; // Crank Cog bolt diameter

RH = 2;
D1 = 132.2;
D2 = 150;

fullCover();

module inner() {
    difference() {
        translate([0, 0, 1]) cylinder(h = 12, d = D2 - 1);
        scale([1, 1, 10]) fullCover();
    }
}

difference() {
    translate([0, 0, -9]) { 
        translate([0, 0, 2]) cylinder(d1 = 60, d2 = D1 - 0.4, h = 4);
        translate([0, 0, 0]) cylinder(d1 = 60, d2 = 120 - 0.4, h = 8);
        translate([0, 0, 6]) cylinder(d1 = D1 - 0.4, d2 = D1 - 0.4, h = 4);
    }
    translate([0, 0, -11]) inner();
}

module fullCover() {
    cover();
    rotate([0, 0, 90]) cover();
    rotate([0, 0, 180]) cover();
    rotate([0, 0, 270]) cover();
    ring();
}

module ring() {
    difference() {
        cylinder(d = D2, h = RH);
        translate([0, 0, -0.5]) cylinder(d = D1, h = RH * 2);
    }
}

module mounting() {
    difference() {
        translate([-3, -3, 0]) 
            minkowski() {
                cube([30, 6, 2]);
                cylinder(d = 8, h = 0.001);
            }
        translate([0, 0, -4]) cylinder(d = BT, h = 10);
    }
}

module top() {
    translate([22.75, 21.75, 0]) {
        minkowski() {
            linear_extrude(height=5)
            polygon(points=[[2, 2], [0, 73 - 33], [73 - 33, 0]]);
            {
                cylinder(d = 15);
            }
        }
    }
}

module cover() {
    extend = 1;
    difference() {
        cylinder(r = 74.2, h = 2);
        rotate([0, 0, 45]) translate([-83, -83, -4]) cube([150, 200, 10]);
    }

    translate([21.5, 21.5, 0]) {
        minkowski() {
            linear_extrude(height=1)
            polygon(points=[[extend, extend], [-extend, 73 - 31.5], [73 - 31.5, -extend]]);
            {
                cylinder(d = 15);
            }
        }
    }
}

