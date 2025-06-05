$fn = 90;

!scale([0.975, 0.975, 0.975]) base();
module base() {
    import("180_motor_holder_3.stl");
    translate([35, 0, 0]) import("180_motor_holder_3.stl");

    // Plates
    translate([0, 4, 0]) cube([35, 2, 17]);
    translate([0, -15, 0]) cube([35, 2, 17]);
    
    // Legs
    translate([-4.25, 6, 0]) cube([6, 6, 17]);
    translate([38.45, 6, 0]) cube([6, 6, 17]);
}

//!pulley();
module pulley() {

    external_d = 19;
    cut_d = 9;
    belt_h = 1.6;

    difference() {
        translate([0, 0, 0]) {
            cylinder(d = external_d, h = belt_h * 3);
        }
        // Hole
        translate([0, 0, -5]) {
            cylinder(d = 2.1, h = 20);
        }
        // Cut-out
        translate([0, 0, belt_h]) {
            difference() {
                cylinder(d = external_d + 1, h = belt_h);
                cylinder(d1 = external_d, d2 = external_d - 2, h = belt_h / 2);
                translate([0, 0, belt_h / 2]) 
                    cylinder(d1 = external_d - 2, d2 = external_d, h = belt_h / 2);
            }
        }
        
        // Holes
        translate([-3.5, -3.5, -5]) {
            cylinder(d = 4.6, h = 20);
        }
        translate([-3.5, 3.5, -5]) {
            cylinder(d = 4.6, h = 20);
        }
        translate([3.5, 3.5, -5]) {
            cylinder(d = 4.6, h = 20);
        }
        translate([3.5, -3.5, -5]) {
            cylinder(d = 4.6, h = 20);
        }
    }
    
    // Indicators
    /*difference() {
        translate([0, 0, belt_h * 3 - 0.75]) {
            cube([external_d + 6, 2, 1.5], true);
            cube([2, external_d + 6, 1.5], true);
        }
        cylinder(d = 2.1, h = 20);
    }*/
}