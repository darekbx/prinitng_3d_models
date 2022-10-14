include <libs/cyl_head_bolt.scad>

$fn = 50;

plateFront();
translate([0, 0, -18]) plateBack(); 
translate([0, 0, -30]) frameMount();

module frameMount() {
    difference() {
        translate([30.5 + 0.1, 23 + 0.1, 0]) {
            minkowski() {
                cube([7, 7, 8]);
                cylinder(d = 3);
            }
        }
        translate([34, 26.5, 4]) nutcatch_parallel("M5", clh=0.1);
        translate([34, 26.5, 14]) bolt();
    }
}

module plateFront() {
    difference() {
        translate([0, 0, 0]) {
            basePlate();
            translate([30.5 + 0.1, 23 + 0.1, -11]) spacer();
        }
        translate([34, 26.5, -2]) bolt();
    }
}

module plateBack() {
    difference() {
        translate([0, 0, 0]) {
            basePlate();
        }
        translate([30.5, 23, 1.5]) scale([1.05, 1.05, 1]) spacer();
        translate([34, 26.5, 8]) bolt();
        translate([30.5 + 0.1, 23 + 0.1, -10.5]) spacer();
    } 
}

module basePlate() {
    scale([0.5, 0.5, 0.5]) difference() {
        base();
        translate([5, 3.4, -2]) rotate([0, 0, -27]) scale([1.2, 1.3, 2]) cut();
        translate([25, 4.1, -2]) rotate([0, 0, -27]) scale([1.2, 1.6, 2]) cut();
        translate([45, 4.1, -2]) rotate([0, 0, -27]) scale([1.2, 1.6, 2]) cut();
    }
}

module bolt() {
    cylinder(d = 9, h = 5);
    translate([0, 0, -18]) cylinder(d = 5.3, h = 20);
}

module spacer() {
    minkowski() {
        cube([7, 7, 10]);
        cylinder(d = 3);
    }
}

module cut() {
    minkowski() {
        cube([0.1, 20, 5]);
        cylinder(d = 6);
    }
}

module base() {
    minkowski() {
        linear_extrude(height=3)
        polygon(points=[[-5, 20], [0, 0], [50, 0], [80, 60],[60, 60]]);
        {
            cylinder(d = 15);
            sphere(r = 2);
        }
    }
}