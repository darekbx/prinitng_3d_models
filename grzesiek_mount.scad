$fn = 90;

// Base
bw = 54.4;
bh = 19.5;
by = 5.0;

// Top element
tw = 22.0;
ty = 39.5;

// Holes
sh = 3.1;
mh = 5.5;

//translate([-1,-1,-1]) #f1();
f2();

module f2() {
    difference() {
        translate([0, 0, 0]) {
            // Base
            minkowski() { 
                sphere(r = 1);
                cube([bw - 2, bh - 2, by - 2]);
            }

            // Top
            translate([16.2, 0, 0]) 
                minkowski() { 
                    sphere(r = 1);
                    cube([tw - 2, bh - 2, ty - 2]);
                }
        }

        // Top hole
        translate([bw / 2 - 1, bh / 2 - 1, -10]) cylinder(d = sh, h = 100);
        translate([bw / 2 - 1, bh / 2 - 1, 37]) cylinder(d = 5, h = 3);
        
        // Left hole
        translate([11.3 - 1, bh / 2 - 1, -10]) {
            cylinder(d = mh, h = 100);
            translate([0, 0, 12.5]) cylinder(d1 = mh, d2 = 10, h = 2);
        }
        
        // Right hole
        translate([bw - 11.3 - 1, bh / 2 - 1, -10]) {
            cylinder(d = mh, h = 100);
            translate([0, 0, 12.5]) cylinder(d1 = mh, d2 = 10, h = 2);
        }
    }
}

module f1() {
    difference() {
        translate([0, 0, 0]) {
            // Base
            cube([bw, bh, by]);

            // Top
            translate([16.2, 0, 0]) cube([tw, bh, ty]);
        }

        // Top hole
        translate([bw / 2, bh / 2, -10]) cylinder(d = sh, h = 100);
        translate([bw / 2, bh / 2, 38]) cylinder(d = 4, h = 2);
        
        // Left hole
        translate([11.3, bh / 2, -10]) {
            cylinder(d = mh, h = 100);
            translate([0, 0, 13.1]) cylinder(d1 = mh, d2 = 7.3, h = 2);
        }
        
        // Right hole
        translate([bw - 11.3, bh / 2, -10]) {
            cylinder(d = mh, h = 100);
            translate([0, 0, 13.1]) cylinder(d1 = mh, d2 = 7.3, h = 2);
        }
    }
}