$fn = 90;

hs = 5; // hole size w, h, d
cs = 4.9; // connector size, w, h
ct = 0.8; // connector tape thickness

noHandle = true;

!translate([-hs * 2, hs * 2, 0]) connector();
#waffels();

module connector() {
    // Cubes
    translate([0, 0, 0]) cube([cs, cs, cs]);
    translate([0, hs * 2, 0]) cube([cs, cs, cs]);
    translate([hs * 4, 0, 0]) {
        translate([0, 0, 0]) cube([cs, cs, cs]);
        translate([0, hs * 2, 0]) cube([cs, cs, cs]);
    }
    
    // Tapes
    translate([0, 0, cs - 0.1]) cube([hs * 5 - 0.1, cs, ct]);
    translate([0, hs * 2, cs - 0.1]) cube([hs * 5 - 0.1, cs, ct]);
    
    translate([0, 0, cs - 0.1]) cube([cs, hs * 2 + 0.1, ct]);
    translate([hs * 4, 0, cs - 0.1]) cube([cs, hs * 2 + 0.1, ct]);
    
    if (!noHandle) {
        // Handle
        translate([-hs, hs, cs + 0.1]) handle();
        translate([hs * 6, hs * 2, cs + 0.1]) rotate([0, 0, 180]) handle();
        
    }
    
    module handle() {
        difference() {
            cube([hs, cs, ct - 0.3]);
            {
                rotate([90, 0, 0]) {
                    for (a = [0:4]) {
                        translate([a, -0.1, -7]) cylinder(h = 10, r = 0.25);
                        translate([a, 0.65, -7]) cylinder(h = 10, r = 0.25);
                    }
                }
            }
        }
    }
}

module waffels() {
    translate([0, 0, 0]) waffel();
    translate([hs - 0.1, 0, 0]) rotate([0, 0, 90]) waffel();
}

module waffel() {

    a = [
        [0, 1, 0, 1, 0, 1, 0],
        [0, 1, 1, 1, 1, 1, 0],
        [1, 1, 0, 1, 0, 1, 1],
        [0, 1, 1, 1, 1, 1, 0],
        [1, 1, 0, 1, 0, 1, 1],
        [0, 1, 1, 1, 1, 1, 0],
        [0, 1, 0, 1, 0, 1, 0]
    ];
    
    for (y = [0:7]) {        
        for (x = [0:7]) {
            if (a[y][x] == 1) {
              translate([hs * x, hs * y, 0]) cube([hs, hs, hs]);  
            }
        }
    }
}