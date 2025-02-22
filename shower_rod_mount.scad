$fn = 90;

hook_width = 19.8;

// distance from wall: 35mm
// rod external diameter: 22mm

if ($preview) {
    #translate([0, 19/2, 5]) cube([1, 35, 1]);
}

//#translate([0, 45, 0]) _hook();
translate([0, 45, 0]) hook();

module hook() {
    difference() {
        translate([0, 0, 0]){
            translate([0, -45.1, 0.5]) cylinder(d = hook_width, h = 26.5);
            translate([0, -45.1, 0.5]) cylinder(d = 22.6, h = 2);
            difference() {
                translate([0, -27.5 + 4.5, 3]) cube([22.5, 45, 5], true);
                translate([0, -45.1, 2.5]) cylinder(d = 22.6, h = 6);
            }

            translate([0, -27.5 + 6, -9]) cube([16.8, 42, 20], true);
            translate([0, -42.1, -19]) cylinder(d = 16.8, h = 20);
        }
        
        rotate([90, 0, 0]) {
            translate([0, 0, 1.5]) cylinder(d1 = 4, d2 = 7, h = 4);
            translate([0, 0, -1.5]) cylinder(d = 4, h = 4);
            translate([0, 0, 5]) cylinder(d = 8, h = 60);
        }
        
        translate([6, -2.1 - 2.4, -29.5]) cube([4, 1.3, 30]);
        translate([-10, -2.1 - 2.4, -29.5]) cube([4, 1.3, 30]);
    }
}

module _hook() {
    difference() {
        translate([0, 0, 0]){
            translate([0, -45.1, -20.5]) cylinder(d = hook_width, h = 46.5);
            difference() {
                translate([0, -27.5 + 4.5, -7.5]) cube([hook_width, 45, 26], true);
                translate([0, -45.1, 5.5]) cube([23, 23, 4], true);
            }
        }
        
        rotate([90, 0, 0]) {
        
            translate([0, 0, 1.5]) cylinder(d1 = 4, d2 = 7, h = 4);
            translate([0, 0, -1.5]) cylinder(d = 4, h = 4);
            translate([0, 0, 5]) cylinder(d = 8, h = 60);
        }
    }
}
