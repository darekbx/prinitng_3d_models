$fn = 90;


height = 3;
radius = 10;
screws = 64;
screw_diameter = 5.8;
support_height = 10;

translate([-2, 0, 0]) twoHoles();
//translate([0, 80, -12]) #gas();

module twoHoles() {
    difference() {
        translate([-1, 0, 0]) {
            translate([1, 6, 0]) minkowski() {
                cube([14 - radius, 83 - radius, height]);
                cylinder(d = radius, h = 1);
            }
            translate([1, 75, -6]) minkowski() {
                cube([14 - radius, 14 - radius, 1]);
                cylinder(d = radius, h = 6);
            }
        }
        translate([2, 13, -4]) {
            translate([0, 0, 0]) scale([1.1, 1.1, 1.1]) fork_screw();
            translate([0, screws, 0]) scale([1.1, 1.1, 1.1]) fork_screw();
        }
         
        translate([1, 23, -2]) {
            translate([0, 0, 0]) minkowski() {
                cube([2, 44, 10]);
                cylinder(d = 4, h = 1);
            }
        }
        
        translate([-8, 39, -20]) {
            translate([7, 1, 0]) cube([6, 20, 20]);
            translate([0, 20.9, 0]) cube([20, 20, 20]);
            translate([10, 38, 0]) scale([1.1, 1.1, 1.1]) cylinder(d = 10.4, h = 18);
        }
    }
    
    difference() {
        translate([2, 80, -10.8]) {
            clamp();
        }
        translate([2, 13, -4]) {
            translate([0, screws, 0]) scale([1.1, 1.1, 1.1]) fork_screw();
        }
    }
    
    translate([2, 37.5, -10.8]) {
        clamp();
        translate([-5, -10, 11.8]) cube([10, 10, 3]);
    }
    
    translate([-0.2, 2.503, -3]) {
        rotate([0, 90, 0]) cylinder(d = 3, h = 4.4);
        translate([0, -1.5, 0]) cube([4.4, 3, 3]);
    } 
}

module clamp() {
    rotate([90, 0, 0]) {
        difference() {
            cylinder(d = 26.6, h = 10);
            translate([0, -1, -1]) cylinder(d = 22, h = 12);
            translate([-20, -25.8, -5]) cube([40, 20, 20]);
        }
    }
}

module gas() {
    rotate([90, 0, 0]) {
        cylinder(d = 22, h = 53);
        translate([0, 0, 53]) cylinder(d = 24, h = 34);
    }
}

module fork_screw() {
    cylinder(d = 10.4, h = 6);
    cylinder(d = 5.2, h = 30);
}