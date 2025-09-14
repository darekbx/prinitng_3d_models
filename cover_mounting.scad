$fn = 90;

tubeDiameter = 27;

// Base plate
cube([28, 25.1, 2]);

// Mounting
translate([0, 1, 0]) {
    difference() {
        translate([0, 0, 0]) {
            translate([7, 2, 2]) {
                cube([14, 12, 6]);
            }
            translate([14, 14, 7 + tubeDiameter / 2]) {
                rotate([90, 0, 0]) {
                    cylinder(d = tubeDiameter + 7, h = 12);
                }
            } 
            
            // Left support
            rotate([0, -13, 0]) {
                translate([2.7, 7, 0]) {
                    cube([8, 2, 17]);
                }
            }
            
            // Right support
            rotate([0, 13, 0]) {
                translate([16.5, 7, 6]) {
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
