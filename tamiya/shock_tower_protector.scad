$fn = 90;

rotate([90, 0, 0]) {
    difference() {
        cylinder(d = 12, h = 9);
        translate([0, 1, -6]) cylinder(d = 10, h = 10);
        translate([0, 5, -1]) cube([20, 10, 10], true);
        translate([0, 0, -10]) cylinder(d = 7.1, h = 30);
        
        //#translate([0, 0, 4]) cylinder(d = 5,h=5);
    }
}