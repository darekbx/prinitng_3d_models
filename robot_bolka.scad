$fn = 90;
thickness = 10;

!hat();

translate([0, 25, 2.5]) head();

body();

translate([2, 46, 5]) rotate([0, 0, 40]) arm();
translate([2, 4, 5]) rotate([0, 0, -40]) arm();

translate([40, 0, 0]) pants();

translate([80, 0, 0]) shoe();
translate([80, 40 - 10, 0]) shoe();

module hat() {
    difference() {
        translate([0, 0, 0]) {
            cylinder(d = 40, h = 5);
            translate([0, 0, 5]) cylinder(d = 20, h = 10);
        }
        #translate([0, 0, -1]) cylinder(d = 16, h = 15);
    }
}

module head() {
    difference() {
        cylinder(d = 30, h = thickness / 2);
        translate([0, -20, -1]) cube([20, 40, 20]);
    }
    
    translate([-8, -5, 2]) minkowski() {
        cube([2, 10, 1]);
        cylinder(d = 4, h = 4);
    }
    
    translate([-22, 0, 2]) {
        rotate([0, 90, 25]) cylinder(d = 3, h = 14);
        rotate([0, 90, -25]) cylinder(d = 3, h = 14);
        translate([0, 0, 0]) sphere(d = 3);
    } 
}

module body() {
    difference() {
        cube([40, 50, thickness]);
        translate([-7.5, 25, 9]) rotate([0, 0, -45]) cube([10, 10, 3]);
        translate([-7.5, 25, 8]) rotate([0, 0, -45]) cube([8, 8, 3]);
    }
}

module arm() {
    rotate([0, 90, 0]) cylinder(d = 5, h = 35);
    translate([35, 0, 0]) sphere(d = 7);
} 

module pants() {
    difference() {
        cube([40, 50, thickness]);
        translate([10, 25, -1]) cylinder(d = 10, h = 30);  
        translate([10, 20, -1]) cube([100, 10, 20]);
    }
    translate([0, 25, 10]) cylinder(d = 5, h = 2);  
}

module shoe() {
    cube([10, 20, 20]);
    translate([5, 0, 20]) rotate([0, 90, 90]) cylinder(d = 10, h = 20);
}
