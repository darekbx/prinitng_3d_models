$fn = 90;
width = 70;
thickness = 3.5;

cube([width, 30, 2]);

module support() {
    difference() {
        cylinder(d = 11, h = 20);
        translate([0, 0, -1]) cylinder(d = 6.6, h = 22);
    }
}

linear_extrude(height = 2) {
    polygon(points = [[0, 30], [width/2-8, 80], [width/2+8, 80], [width, 30]]);
}

clipR();
clipL();
screwClip();
column();

module column() {
    translate([width/2, 33, 0]) {
        translate([0, 0, 11.5]) { 
            difference() {
                cube([18, 10, 22], true);
                translate([0, 0, 14]) rotate([-15, 0, 0]) cube([20, 20, 10], true);
            }
        }
        //cylinder(d = 10, h= 21);
    }
}

module clipR() {
    translate([-2, 0, 0]) cube([2, 15, thickness*2+ 0.5]);
    translate([-2, 0, thickness*2-1.5]) cube([5, 15, 2]);
}

module clipL() {
    translate([width, 0, 0]) cube([2, 15, thickness*2+ 0.5]);
    translate([width-3, 0, thickness*2-1.5]) cube([5, 15, 2]);
}

module screwClip() {
    translate([width / 2, 74, 9]) rotate([0, 90, 90]) {
        difference() {
            translate([0, 0, 0]) {
                translate([0, 0, 0]) cylinder(d = 16, h = 6);
                translate([0, -8, 0]) cube([8, 16, 6]);
            }
            translate([0, 0, -1]) cylinder(d = 11, h = 8);
            translate([-10, -4.5, -1]) cube([10, 9, 10]);
        }
    }
}