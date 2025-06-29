$fn = 90;

difference() {
    handle();

    #translate([-10, 46, 28]) rotate([180, 0, 180]) h();
    #translate([30, 46, 28]) rotate([180, 0, 180]) h();
}


module h() {
    translate([0,4,24]) {
        difference() {
            //rotate([-90,0,0]) import("Hook_single.stl");
            translate([0,11,-0.9]) cylinder(d = 2.5, h = 9);
            /*translate([0,0,-2]) {
                translate([0,11,-0.9]) cylinder(d = 3, h = 9);
                translate([0,11,8]) cylinder(d = 4.6, h = 10);
            }*/
        }
    }
}

module handle() {
    difference() {
        translate([0,0.6,0]) {
            cube([18, 84.4, 4]);
        }
        // Cut
        translate([-1,67,4]) rotate([-8,0,0]) cube([20, 24, 6]);
    }
    translate([-(36-12)/2, 55, 0]) cube([46.5, 12, 4]);
    
    difference() {
        translate([-(36-12)/2, 23.12, 0]) cube([39.3, 12, 4]);
        translate([23.61,18,-1]) rotate([0,0,-22]) cube([10, 10, 6]);
    }

    // Wide end
    translate([-15,55,0]) side(true);
    translate([34.5,55,0]) rotate([0,0,2]) side(false);
    
    // Short end
    translate([-15,23.12,0]) side(true);
    translate([22.8,24,0]) rotate([0,0,-22]) side(false);
    
    // Ending
    translate([0,-2.4,0]) cube([18, 3, 12]);
    
    //#translate([-(36-12)/2, 10, 10]) cube([32, 2, 2]);
}

module side(left = false) {
    cube([3, 12, 16]);
    difference() {
        translate([left ? 0.3 : 0.6, 0, left ? 15 : 13]) {
            rotate([0, left ? 45 : -45,0]) {
                cube([3, 12, 3]);
            }
        }
                
        translate([-2,-1,16]) cube([6, 14, 3]);
    }
}


module hole() {
    rotate([0, 0, 0]) {
        translate([0, 0, 3]) cylinder(d = 9.6, h = 5);
        translate([0, 0, -10]) cylinder(d = 5.2, h = 30);
        translate([0, 0, -4]) cylinder(d = 9.6, h = 5);
    }
}