$fn = 45;

atomMount();

module atomMount() {
    difference() {
        translate([0, 0, 0]) {
            translate([3.5, 0, 0]) cube([16, 8, 8]);
            translate([3.5, 4, 0]) {
                difference() {
                    cylinder(d = 8, h = 8);
                    translate([0, -5, 0]) cube([9, 9, 9]);
                }
            }
            translate([19.5, 4, 0]) {
                difference() {
                    cylinder(d = 8, h = 8);
                    translate([0, 5, 0]) cube([9, 9, 9]);
                }
            }
        }
        translate([3.5, 4, -0.5]) {
            cylinder(d = 5, h = 9);
            cylinder(d = 6, h = 1.5);
            translate([0, 0, 7.1]) cylinder(d = 6, h = 1.5);
        }
        translate([19.5, 4, -0.5]) {
            cylinder(d = 5, h = 9);
            cylinder(d = 6, h = 1.5);
            translate([0, 0, 7.1]) cylinder(d = 6, h = 1.5);
        }
    }
    translate([9, 0, 0]) {
        difference() {
            cube([6, 100, 8]);
            rotate([-5, 0, 0]) translate([-1, 0, 10]) cube([8, 100, 8]);
        }
    }
    
}