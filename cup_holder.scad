$fn = 90;

cup_diamenter_1 = 80; // Cup diameter is 80mm
cup_diamenter_2 = 60; // Cup diameter is 80mm
band_height = 20;
band_thickness = 5;
handle_bar_diameter = 23;
mount_thickness = 12;

cup_band();
translate([-10, 55, 10]) mount();

module cup_band() {
    difference() {
        cylinder(d = cup_diamenter_1, h = band_height);
        translate([0, 0, -50]) cylinder(h = 90, d1 = cup_diamenter_2, d2 = cup_diamenter_1);
    }
}

module mount() {
    difference() {
        {
            rotate([0, 90, 0]) minkowski() {
                sphere(d = 4);
                cylinder(d = handle_bar_diameter + mount_thickness, h = 20);
            }
            translate([-5, 2.5, -30]) rotate([90, 0, 0]) cube([30, 60, 5]);
            
            // top screw hole 
            screwHole(-15);
            screwHole(15);
        }
        translate([0, 0, 0]) {
            translate([-10, 0, 0]) rotate([0, 90, 0]) cylinder(d = handle_bar_diameter, h = 100);
        }
    }
    
    module screwHole(z) {
        translate([10, 20, z]) rotate([90, 0, 0]) cylinder(d = 5, h = 40);
        translate([10, 27, z]) rotate([90, 0, 0]) cylinder(d = 9, h = 20);
        translate([10, -7, z]) rotate([90, 0, 0]) cylinder(d = 9, h = 20);
    }
}