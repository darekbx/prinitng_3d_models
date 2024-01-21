$fn = 90;

scale([1.25, 1.25, 1.35]) difference() {
    translate([0, 0, 10]) body();
    translate([0, 0, -25]) cube([50, 50, 50], true); 
    translate([0, 0, 84]) cube([50, 50, 50], true); 
}
translate([0, 0, 77]) cylinder(d = 4, h = 8);

//translate([0, 0, 0]) cube([1, 1, 80]); 

!translate([0, 0, 78]) hat();
//translate([0, 10, 89]) cube([19, 19, 19], true); 

module body() {
    sphere(d = 38);
    translate([0, 0, 23]) sphere(d = 30);
    translate([0, 0, 40]) sphere(d = 20);
    translate([0, 0, 47]) cylinder(d = 4, h = 8);
    
    //translate([12.5, 0, 33]) rotate([0, 90, 0]) cylinder(d = 2, h = 2);
    //translate([13.5, 0, 30]) rotate([0, 90, 0]) cylinder(d = 2, h = 2);
    translate([13.5, 0, 26]) rotate([0, 90, 0]) cylinder(d = 2, h = 2);
    translate([13.5, 0, 23]) rotate([0, 90, 0]) cylinder(d = 2, h = 2);
    translate([13.5, 0, 20]) rotate([0, 90, 0]) cylinder(d = 2, h = 2);
    
    translate([8, 0, 42]) face();
    
    translate([0, 10, 28]) rotate([-65, 0, 0]) cylinder(d = 3, h = 20);
    translate([0, -10, 28]) rotate([65, 0, 0]) cylinder(d = 3, h = 20);
}

module face() {
    minkowski() {
        cube([3, 4, 1], true);
        rotate([0, 90, 0]) cylinder(d = 6, h = 1);
    }
}

module hat() {
    difference() {
        translate([0, 0, 0]) {
            cylinder(d = 21, h = 14);
            cylinder(d = 18, h = 6);
        }
        translate([0, 0, -0.1]) cylinder(d = 16, h = 3);
        translate([0, 0, -0.1]) cylinder(d = 4.1, h = 9);
    }
    
    translate([0, -12, 2]) ucho();
    translate([0, 12, 2]) ucho();
}

module ucho() {
    difference() {
        cylinder(d = 6, h = 2);
        translate([0, 0, -0.1]) cylinder(d = 3.5, h = 3);
    }
}