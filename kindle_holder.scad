$fn = 90;

height = 170;
thickness = 5.5;

difference() {
    translate([0, 0, 0]) {
        //translate([0, 4, 0]) mount(true);
        //translate([0, 90, 0]) mount(true);
        
        translate([0, 14, 0]) mount(false);
    }
    translate([40, 0, -20]) cube([167, 116, 30]);
    //translate([-30, 0, 0]) cube([167, 116, 30]);
}

//#cube([167, 116, 8.3]);

module mount(base = true) {
    difference() {
        translate([0, 0, 0]) {
            if (!base) {
                translate([3, 7, 4]) 
                    rotate([90, 0, 0]) 
                        cylinder(d = 19, h = 5);
            }
            
            if (base) {
                translate([3, 2, -thickness]) cube([height, 5, thickness]);
                translate([height + 3, 7, -7.5]) 
                    rotate([90, 0, 0]) 
                        cylinder(d = 15, h = 5);
            } else {
                translate([3, 2, -thickness]) cube([19.8, 5, thickness]);
            }
            
            if (!base) {
                translate([3, 2, 8]) cube([20, 5, thickness]);
            }
            
        }
        
        translate([3, 0, 0]) cube([167, 116, 8.3]);
        translate([height - 16, 0, -10.5]) cube([20, 120, 5]);
        
        if (base) {
            translate([2.9, 0, -7.4]) cube([20, 10, 5]);
        } else {
            translate([2.9, 0, -2.5]) cube([20, 10, 5]);
        }
        
        translate([7, 4.5, -8]) cylinder(d = 1.5, h = 10);
        translate([18, 4.5, -8]) cylinder(d = 1.5, h = 10);
        
        if (!base) {
            translate([7, 4.5, -8]) cylinder(d = 1.7, h = 10);
            translate([18, 4.5, -8]) cylinder(d = 1.7, h = 10);
            translate([7, 4.5, -5.6]) cylinder(d = 3.5, h = 1.6);
            translate([18, 4.5, -5.6]) cylinder(d = 3.5, h = 1.6);
        }
        
        //#translate([18, 3.5, -3.6]) cylinder(d = 1.4, h = 3.5);
    }
}


//translate([26, 7, -thickness]) cube([5, 90, thickness]);
//translate([118, 7, -thickness]) cube([5, 90, thickness]);

//translate([33, 7, -thickness]) rotate([0, 0, 45]) cube([122, 5, thickness]);
//translate([30, 93, -thickness]) rotate([0, 0, -45]) cube([122, 5, thickness]);
