$fn = $preview ? 60 : 120;

h_distance = 60;
v_distance = 60;
height = 40;

/*
difference() {
    all();
    #translate([25, -30, -8]) cube([140, 170, 70]);
    #translate([-25, 25, -8]) cube([140, 170, 70]);
}*/
all();

module all() {
    // PRINT SEPARATELY!
    translate([0, 0, -3]) bottom_legs();
    !translate([0, 0, 3]) top_legs();
    support(); // x4
    //supports();
}

//#translate([-9.5, 0, 44]) cube([123, 1, 1]);

module supports() {
    translate([0, 0, 6]) support();
    translate([44 + h_distance, 0, 6]) support();
    translate([0, 44 + v_distance, 6]) support();
    translate([44 + h_distance, 44 + v_distance, 6]) support();
}

module support() {
    difference() {
        cylinder(d1 = 24, d2 = 15, h = height - 6);
        translate([5, 5, -0.1]) cylinder(d = 2.9, h = 12);
        translate([-5, -5, -0.1]) cylinder(d = 2.9, h = 12);
        translate([0, 0, height - 6 - 12 + 0.1]) cylinder(d = 2.9, h = 12);
    }
}

module top_legs(forDiff = false) {
    difference() {
        translate([0, 0, height]) {
            translate([0, 0, 0]) top_leg(forDiff);
            translate([44 + h_distance, 0, 0]) rotate([0, 0, 180]) top_leg(forDiff);
            translate([0, 44 + v_distance, 0]) top_leg(forDiff);
            translate([44 + h_distance, 44 + v_distance, 0]) rotate([0, 0, 180]) top_leg(forDiff);
            
            // h beams
            translate([6, -2.5, 0]) cube([92, 5, 6]);
            translate([6, -2.5 + 44 + v_distance, 0]) cube([92, 5, 6]);
            
            // v beams
            translate([-2.5, 6, 0]) cube([5, 92, 6]);
            translate([-2.5 + 44 + h_distance, 6, 0]) cube([5, 92, 6]);
        }
        translate([12, -40, height + 3.5]) {
            cube([80, 180, 4]);
        }
    }
}

module bottom_legs(forDiff = false) {
    translate([0, 0, 0]) bottom_leg(forDiff);
    translate([44 + h_distance, 0, 0]) bottom_leg(forDiff);
    translate([0, 44 + v_distance, 0]) bottom_leg(forDiff);
    translate([44 + h_distance, 44 + v_distance, 0]) bottom_leg(forDiff);
    
    // h beams
    translate([20, -2.5, 0]) cube([64, 5, 8]);
    translate([20, -2.5 + 44 + v_distance, 0]) cube([64, 5, 8]);
    
    // v beams
    translate([-2.5, 20, 0]) cube([5, 64, 8]);
    translate([-2.5 + 44 + h_distance, 20, 0]) cube([5, 64, 8]);
}

module bottom_leg(forDiff = false) {
    if (forDiff) {
        translate([0, 0, -0.1]) cylinder(d = 40, h = 4.1);
    } else {
        difference() {
            cylinder(d = 44, h = 8);
            translate([0, 0, -0.1]) cylinder(d = 40, h = 3.1);
            
            // screw
            translate([5, 5, 2.9]) {
                cylinder(d = 7, h = 3.3);
                cylinder(d = 3.5, h = 10);
            }
            
            // screw
            translate([-5, -5, 2.9]) {
                cylinder(d = 7, h = 3.3);
                cylinder(d = 3.5, h = 10);
            }
        }
    }
}

module top_leg(forDiff = false) {
    if (forDiff) {
        translate([0, 0, 3.4]) cylinder(d = 11, h = 2.7);
    } else {
        difference() {
            cylinder(d = 24.75, h = 6);
            translate([0, 0, 5.4]) cylinder(d = 11, h = 0.7);
        
            // screw
            translate([0, 0, 2.2]) {
                cylinder(d = 7, h = 3.3);
                translate([0, 0, -9]) cylinder(d = 3.5, h = 10);
            }
        }
        translate([-14, -3, 0]) cube([4, 6, 10]);
    }
}