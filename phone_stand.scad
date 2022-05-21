$fn = 150;
size = 5;

difference() {
    
    translate([0, 0, 0]) {
        translate([-0.4, -1, 0]) {
            rotate([0, 0, 25]) {
                arm();
            }
        }
        rotate([0, 0, -25]) {
            translate([0,-5, 0]) {
                arm();
            }
        }
    }
    
    translate([0, 0, 0])  {
        
        // phone 1
        rotate([110, 0, 90]) {
            translate([-78, 12,  0]) {
                phone();
            }
        }
        
        // phone 2
        rotate([120, 0, 90]) {
            translate([-78, 22, 15]) {
                phone();
            }
        }
        
        // phone 3
        rotate([130, 0, 90]) {
            translate([-78, 38, 27]) {
                phone();
            }
        }
        
        // surface
        translate([0, 0, -5]) {
            cube([200, 200, 10], true);
        }
    }
}

module arm() {
    minkowski() {
        cube([90, size, size]);
        cylinder(12, 7, 0);
    }
}

module phone() {
    #cube([155, 79, 12]);
}