$fn = 90;

diameter = 70;
width = 220;
thickness = 2;

/*!difference() {
    cap();
    translate([30, 0, 170]) cube([50, 60, 100], true);
}*/

//#translate([33.5, 0, 20]) cube([3, 45, 1], true);
//#translate([26, 0, width/2]) cube([1, 1, 220], true);

difference() {
    guard();
    translate([30, 0, 12]) cube([50, 60, 164], true);
    #translate([30, 0, 184]) cube([50, 60, 100], true);
    
    translate([14.5, 0, 114]) rotate([0, 90, 0]) cylinder(d = 26, h = 17.5);
    translate([13, 0, 114]) rotate([0, 90, 0]) cylinder(d = 32, h = 17.5);
    translate([10, 0, 114]) rotate([0, 90, 0]) cylinder(d = 34.2, h = 17.5);
}

module guard() {
    intersection() {
        base();
        cutoff();
    }

    intersection() {
        capmount(); 
        cylinder(d = diameter, h = width);
    }

    intersection() {
        translate([0, 0, 0]) {
            translate([21, -21.9, width/2]) cube([10, 3, 240], true);
            translate([21, 21.9, width/2]) cube([10, 3, 240], true);
        }
        cutoff();
    }
}

module cap() {
    translate([22.2, 0, 114]) 
        rotate([0, 90, 0]) 
            difference() {
                cylinder(d = 34, h = 5.8);
                translate([0, 0, 1.6]) cylinder(d = 32, h = 7.5);
        
                //cap cutoff
                //translate([0, -20, -1.6]) cube([20, 50, 10]);
            }
}

module capmount() {
    translate([22.2, 0, 114]) 
        rotate([0, 90, 0]) 
            difference() {
                cylinder(d = 42, h = 11);
                translate([0, 0, -1.6]) cylinder(d = 34.2, h = 10);
        
                //cap cutoff
                //translate([0, -20, -1.6]) cube([20, 50, 10]);
            }
}

module airtag() {
    translate([33, 30.75, 245]) 
        rotate([0, 90 + 180, 0]) 
            import("Apple_AirTag_V2.stl");
}

module cutoff() {
    translate([30, 0, width / 2]) minkowski() {
        cube([20, 0.0001, width - 50], true);
        rotate([0, 90, 0]) cylinder(d = 50, h = 1);
    }
}

module hole() {
    rotate([0, 90, 0]) cylinder(d = 4.6, h = 10);
    translate([-8, 0, 0]) rotate([0, 90, 0]) cylinder(d = 9.6, h = 30);
}

module tube() {
    difference() {
        rotate([0, 90, 0]) cylinder(d = 14, h = 10);
        translate([2, 0, 0]) rotate([0, 90, 0]) cylinder(d = 10, h = 10);
        translate([-3.5, 0, 0]) rotate([0, 90, 0]) cylinder(d = 4.6, h = 31);
    }
}

module base() {
    difference() {
        translate([0, 0, 0]) {
            cylinder(d = diameter, h = width);
        }
        translate([-0.5, 0, -0.5]) cylinder(d = diameter - thickness * 2, h = width + 1);
        
        translate([-24, 0, width / 2]) cube([100, diameter + 2, width + 2], true);
        
        translate([30, 0, 18]) hole();
        translate([30, 0, 18 + 64]) hole();
        translate([30, 0, 18 + 64 + 64]) hole();
    }
    
    translate([24, 0, 18]) tube();
    translate([24, 0, 18 + 64]) tube();
    translate([24, 0, 18 + 64 + 64]) tube();
}