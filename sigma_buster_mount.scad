include <libs/cyl_head_bolt.scad>

$fn = $preview ? 60 : 90;

handle_bar_diameter = 23;
mount_thickness = 11;

difference() {
    translate([0, 0, 0]) {
        mount();
        translate([5, 19, 0]) rotate([90, 0, 0]) cylinder(d = 14, h = 2);
    }
    translate([-2, 23, -8]) rotate([90, 0, 0]) cube([18, 16, 5]);
    
    translate([5, 0, 0]) rotate([0, 90, 0]) {
        difference() { 
            rotate_extrude() { 
                translate([24 - 5 / 2, 0, 0]) {
                    circle(d = 12);
                }
            }
            translate([-40, -11, -10]) cube([80, 22, 20]);
            translate([0, 20, 0]) rotate([90, 0, 0]) cylinder(d = 14, h = 12);
        }
    }
    
    translate([5, 10, 0]) {
        rotate([90, 0, 0]) {
            scale([1.05, 1.05, 2.5]) nutcatch_parallel("M3", clh=0.1);
            translate([0, 0, -10]) cylinder(d = 3.4, h = 5.5);
        }
    }
}

module mount() {
    difference() {
        {
            rotate([0, 90, 0]) minkowski() {
                sphere(d = 4);
                cylinder(d = handle_bar_diameter + mount_thickness, h = 10);
            }
            translate([-5, 2.5, -30]) rotate([90, 0, 0]) cube([30, 60, 5]);
            
            // top screw hole 
            screwHole(-14.5);
            screwHole(14.5);
        }
        translate([0, 0, 0]) {
            translate([-10, 0, 0]) rotate([0, 90, 0]) cylinder(d = handle_bar_diameter, h = 100);
        }
    }
    
    module screwHole(z) {
        translate([5, 20, z]) rotate([90, 0, 0]) cylinder(d = 5, h = 40);
        
        //#translate([7, 27, z]) rotate([90, 0, 0]) cylinder(d = 9, h = 20);
        translate([5, 7, z]) rotate([90, 0, 0]) scale([1.05, 1.05, 2.5]) nutcatch_parallel("M5", clh=0.1);
        translate([5, -7, z]) rotate([90, 0, 0]) cylinder(d = 9, h = 20);
    }
}