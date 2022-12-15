$fn = 90;

angle = 21;

nikon_mount();
translate([0.35, 0, 9]) rotate([0, angle, 0]) lighter_mount();

difference() {
    modules_support();
    translate([0.35, 0, 9]) rotate([0, angle, 0]) cube([20, 16.5, 6], true);
}
    
module modules_support() {
    translate([0, 0, 4]) cube([14, 12.4, 9], true);
    translate([5.9, 0, 4]) rotate([0, angle, 0]) cube([6, 12.4, 6], true);
    translate([-5.8, 0, 5.5]) rotate([0, -angle, 0]) cube([6, 12.4, 10], true);
}

module nikon_mount() {
    minkowski() {
        cube([15, 16, 0.1], true);
        sphere(r = 0.9);
    }
    translate([0, 0, 2]) cube([14, 12.4, 2], true);
}

module lighter_mount() {
    difference() {
        cube([20, 18.5, 7], true);
        translate([-1, 0, 0.7]) cube([20, 15.4, 2.8], true);
        translate([-1, 0, 4]) cube([20, 10, 8], true);
        
        translate([0, 10, -2.6]) rotate([45, 0, 0]) cube([22, 8.4, 4], true);
        translate([0, -10, -2.6]) rotate([-45, 0, 0]) cube([22, 8.4, 4], true);
    }
}