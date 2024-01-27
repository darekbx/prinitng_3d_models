$fn = 90;

difference() {
    translate([0, 0, 0]){
        minkowski() {
            cube([65.5, 1.5, 5.8], true);
            translate([0, 0, -0.1]) cylinder(d = 15, h = 0.000001);
        }
        //translate([18 - 2, 0, 1]) mount();
        //translate([-18 - 2, 0, 1]) mount();
    }
    translate([-32, 0, 0.8]) hole();
    translate([32, 0, 0.8]) hole();
    
    translate([0, 0, -2.8]) {
        minkowski() {
            cube([45.25, 0.001, 1], true);
            translate([0, 0, -0.1]) cylinder(d = 1.6, h = 0.000001);
        }
    }
    translate([0, 6.3, -2.8]) {
        minkowski() {
            cube([50, 0.001, 1], true);
            translate([0, 0, -0.1]) cylinder(d = 1.6, h = 0.000001);
        }
    }
    translate([0, 3.15, -2.8]) {
        minkowski() {
            cube([46.5, 0.001, 1], true);
            translate([0, 0, -0.1]) cylinder(d = 1.6, h = 0.000001);
        }
    }
    translate([0, -3.15, -2.8]) {
        minkowski() {
            cube([46.5, 0.001, 1], true);
            translate([0, 0, -0.1]) cylinder(d = 1.6, h = 0.000001);
        }
    }
    translate([0, -6.3, -2.8]) {
        minkowski() {
            cube([50, 0.001, 1], true);
            translate([0, 0, -0.1]) cylinder(d = 1.6, h = 0.000001);
        }
    }
        
    translate([-38, 13, 0.]) rotate([90, 180, 70]) {
        rotate([0, 0, 30]) cylinder(d=3.5, h=56, $fn=6);
        translate([0, 0, 8]) rotate([0, 0, 30]) cylinder(d=3.5, h=11, $fn=90);
        rotate([0, 90, 0]) rotate([0, 0, 30]) cylinder(d=3.5, h=20, $fn=6);
    }
}

module mount() {
    difference() {
        rotate([90, 0, 90]) cylinder(d = 15, h = 4);
        translate([-1, -10, 0]) cube([6, 20, 10]);
        translate([-1, -1.5, -8]) cube([6, 3, 3]);
    }
}

module hole() {
    cylinder(d = 15, h = 3);
    translate([0, 0, -5]) cylinder(d = 5.5, h = 10);
    translate([0, 0, -4.5]) cylinder(d = 9.5, h = 3);
}