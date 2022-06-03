$fn = 90;

tubeDiameter = 27;

// Base plate
cube([28, 25, 2]);

// Mounting
translate([0, -2, 0]) {
    difference() {
        translate([0, 0, 0]) {
            translate([5, 2, 2]) {
                cube([18, 8, 6]);
            }
            translate([14, 10, 7 + tubeDiameter / 2]) {
                rotate([90, 0, 0]) {
                    cylinder(d = tubeDiameter + 4, h = 8);
                }
            } 
            
            // Left support
            rotate([0, -13, 0]) {
                translate([2.7, 5, 0]) {
                    cube([8, 2, 17]);
                }
            }
            
            // Right support
            rotate([0, 13, 0]) {
                translate([16.5, 5, 6]) {
                    cube([8, 2, 17]);
                }
            }
        } 
        {
            // Tube
            translate([14, 30, 7 + tubeDiameter / 2]) {
                rotate([90, 0, 0]) {
                    cylinder(d = tubeDiameter, h = 60);
                }
            }
            translate([14, 15, 7 + tubeDiameter / 2 + 20]) {
                rotate([90, 0, 0]) {
                    cylinder(d = tubeDiameter + 5, h = 30);
                }
            } 
        }
    }
}
