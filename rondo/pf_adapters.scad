$fn = 90;

//tube();
//!pf_outer();
//pf_bearing();
//spacer();
//removal_holder();

translate([0, 45, -4]) insert_holder();
insert_cylinder();

module insert_cylinder() {
    difference() {
        translate([0, 0, 0]) {
            cylinder(d = 38, h = 6);
            translate([0, 0, -6.5]) cylinder(d = 28.5, h = 7);
        }
        translate([0, 0, 3.1]) cylinder(d = 33.1, h = 3);
        translate([0, 0, -10]) cylinder(d = 10, h = 20);
    }
}

module insert_holder() {
    difference() {
        translate([0, 0, 0]) {
            difference() {
                cylinder(d = 44, h = 10);
                translate([0, 0, -0.1]) cylinder(d = 41, h = 2);
                translate([0, 0, 7]) cylinder(d = 36.7, h = 3.4);
            }
        }
        translate([0, 0, -10]) cylinder(d = 10, h = 40);
    }
}

module removal_holder() {
    difference() {
        translate([0, 0, 0]) {
            
            difference() {
                cylinder(d = 47, h = 22);
                translate([0, 0, -0.1]) cylinder(d = 36, h = 16);
                translate([0, 0, -0.1]) cylinder(d = 44.5, h = 2);
                translate([0, 0, 19.7]) cylinder(d = 36.7, h = 3.4);
            }
           
        }
        translate([0, 0, -10]) cylinder(d = 10, h = 40);
    }
}

module removal() {
    difference() {
        translate([0, 0, 0]) {
            cylinder(d = 29.9, h = 13);
            translate([0, 0, -2.5]) difference() {
                cylinder(d = 35, h = 3);
                translate([0, 0, -0.6]) cylinder(d = 33.1, h = 3);
            }
        }
        translate([0, 0, -10]) cylinder(d = 10, h = 40);
    }
}

module spacer() {
    difference() {
        cylinder(d = 35, h = 2.5);
        translate([0, 0, -1]) cylinder(d = 29, h = 4);
    }
}
    
module tube() {
    difference() {
        cylinder(d = 16, h = 80);
        translate([0, 0, -1]) cylinder(d = 10, h = 82);
    }
}

// Adapter for frame
module pf_outer() {
    difference() {
        translate([0, 0, 0]) {
            cylinder(d = 49, h = 7);
            translate([0, 0, -4.5]) cylinder(d = 40.5, h = 5);
        }
        translate([0, 0, 3.7]) cylinder(d = 36.7, h = 3.4);
        translate([0, 0, -10]) cylinder(d = 10, h = 20);
    }
}

// Adapter for bearing
module pf_bearing() {
    difference() {
        translate([0, 0, 0]) {
            cylinder(d = 44, h = 8);
            translate([0, 0, -6.5]) cylinder(d = 28.5, h = 7);
        }
        translate([0, 0, 5.1]) cylinder(d = 33.1, h = 3);
        translate([0, 0, -10]) cylinder(d = 10, h = 20);
        
        translate([0, 0, -0.1]) difference() {
            cylinder(d = 44 - 7, h = 2);
            translate([0, 0, -1]) cylinder(d = 28.5, h = 4);
        }
    }
}