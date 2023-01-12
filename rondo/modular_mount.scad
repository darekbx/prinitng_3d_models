$fn = $preview ? 45 : 120;

bolt = 5; // M5
hammock_mount();
//hammock_clamp_top();
//hammock_clamp_bottom();

//#translate([55, 0, -2.8]) frame_mount();
//frame_mount();
//spacer();

module hammock_mount() {
    width = 120;
    diameter = 100;
    
    removable_mount();
    
    translate([-57, 0, 0]) cube([16, 30, 6], true);
    translate([70, 0, 0]) difference() {
        cube([40, 30, 6], true);
        translate([-20, 0, -2.8]) scale([1.1, 1.015, 1.015]) frame_mount(false, false);
        translate([0, 0, -1.8]) cube([50, 21, 5], true);
        translate([-6, 0, 1]) minkowski() {
            cube([30, 9, 5], true);
            cylinder(d = 5, h = 1);
        }
    }
    
}
    
module hammock_clamp_top() {
    difference() {
        translate([0, 0, 0]) {
            cube([16, 38, 11], true);
            translate([-8, 0, -50]) rotate([0, 90, 0]) difference() {
                cylinder(d = 100, h = 16);
                translate([0, 0, -1]) cylinder(d = 94, h = 18);
                translate([0, -50, -1]) cube([200, 100, 20]);
                translate([-5, -75, 3]) cube([2, 140, 10]);
            }
        }
        translate([14, 0, 0]) scale([1.01, 1.01, 1.01]) #cube([40, 30, 6], true);
    }
}

module hammock_clamp_bottom() {
    difference() {
        translate([0, 0, 0]) {
            cube([16, 40, 12], true);
            translate([-8, 0, -50]) rotate([0, 90, 0]) difference() {
                cylinder(d = 100, h = 16);
                translate([0, 0, -1]) cylinder(d = 94, h = 18);
                translate([0, -50, -1]) cube([200, 100, 20]);
                translate([-5, -75, 3]) cube([2, 140, 10]);
            }
        }
        translate([10, 0, 0]) scale([1.01, 1.01, 1.01]) cube([40, 30, 6], true);
        translate([10, 0, 5]) scale([1.01, 1.01, 1.01]) cube([40, 21, 6], true);
    }
}

module removable_mount() {
    w = 100 - 0.4;
    difference() {
        cube([100, 30, 6], true);
        translate([4.2, 0, -2.8]) scale([1.1, 1.015, 1.015]) frame_mount(false, false);
        translate([4.5, 0, -1.8]) cube([w, 21, 5], true);
        translate([-10, 0, 1]) minkowski() {
            cube([60, 10, 5], true);
            cylinder(d = 5, h = 1);
        }
        
        // Cutoffs
        translate([42.1, 6, 1]) cube([20, 2, 5], true);
        translate([42.1, -6, 1]) cube([20, 2, 5], true);
    }
    translate([50, 0, 1.85]) {
        minkowski() {
            cube([20, 5, 2.3], true);
            cylinder(d = 5, h = 0.001);
        }
    }
    translate([54.5, 0, 0.6]) {
        scale([1, 1, 1.3]) {
            difference() {
                rotate([0, -15, 0]) {
                    cube([8, 10, 2], true);
                }
                translate([3, 0, 2.5]) cube([3, 12, 2], true);
            }
            translate([-4.1, 0, -0.5]) cube([1, 10, 3], true);
        }
    }
}

module spacer() {
    difference() {
        cylinder(d = 10, h = 1);
        translate([0, 0, -1]) cylinder(d = 5.2, h = 4);
    }
}

module frame_mount(angle_rake = true, round_edge = true) {
    difference() {
        translate([0, 0, 0]) {
            inset(round_edge);
            translate([-45, 10, 0.75]) rake();
            translate([-45, -10, 0.75]) mirror([0, -1, 0]) rake();
            
            if (angle_rake) {
                angle_rake();
                mirror([0, -1, 0]) angle_rake();
            }
        }

        translate([0, 0, 2]) scale([0.95, 0.8, 1]) {
            inset(round_edge);
        }

        bolts();
        translate([-52.51, 0, 0]) cube([5, 30, 10], true);
    }
}

module angle_rake() {
    translate([-46.3, 9.55, 0.75]) rotate([0, 0, 15]) rake(2);
    translate([-47.3, 8.85, 0.75]) rotate([0, 0, 30]) rake(2);
    translate([-48.3, 7.8, 0.75]) rotate([0, 0, 45]) rake(2);
    translate([-49.0, 6.5, 0.75]) rotate([0, 0, 60]) rake(2);
    translate([-49.23, 5.2, 0.75]) rotate([0, 0, 75]) rake(2);
    translate([-49.15, -0.8, 0.75]) rotate([0, 0, 90]) rake(6.5);
}

module rake(size = 90) {
    difference() {
        rotate([45, 0, 0]) cube([size, 4, 4]);
        translate([-1, -4, 2.75]) cube([size + 2, 8, 4]);
        translate([-1, -4, -4]) cube([size + 2, 4, 8]);
        translate([-1, 2, -4]) cube([size + 2, 4, 8]);
    }
}

module round_edge_rt(diameter = 10, t = 7) {
    difference() { 
        translate([0, 0, -(t / 2)]) cylinder(d = diameter, h = t);
        translate([0, -((diameter + 1) / 2), 0]) cube(diameter + 1, true);
        translate([((diameter + 1) / 2), 0, -0]) cube(diameter + 1, true);
    }
}
module round_edge_lt(diameter = 10, t = 7) {
    difference() { 
        translate([0, 0, -(t / 2)]) cylinder(d = diameter, h = t);
        translate([0, ((diameter + 1) / 2), 0]) cube(diameter + 1, true);
        translate([((diameter + 1) / 2), 0, 0]) cube(diameter + 1, true);
    }
}

module inset(round_edge = true) {
    cube([90, 20, 7], true);
    if (round_edge) {
        translate([-45, 0, 0]) cube([10, 10, 7], true);
        translate([-45, 5, 0]) round_edge_rt();
        translate([-45, -5, 0]) round_edge_lt();
    }
}

module m5_bolt() {
    translate([0, 0, 12]) cylinder(d = 10, h = 5);
    cylinder(d = 5, h = 12);
}

module bolts() {
    holeOffset = 0;
    translate([holeOffset + (64 / 2), 0, -10]) {
        bolt_hole();
    }
    translate([holeOffset + (-64 / 2), 0, -10]) {
        bolt_hole();
    }
}

module bolt_hole() {
    translate([-1, 0, 0]) cylinder(h = 20, d = bolt);
    translate([-1, -(bolt / 2), 0]) cube([2, bolt, 20]);
    translate([1, 0, 0]) cylinder(h = 20, d = bolt);
}