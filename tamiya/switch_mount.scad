$fn = 50;

difference() {
    translate([0, 3.5, 0]) cube([24, 17, 4], true);
    #translate([-6.25, 7, -3]) {
        translate([-1, 0, 0]) cylinder(d = 1.9, h = 10);
        translate([13.5, 0, 0]) cylinder(d = 1.9, h = 10);
    }
    #translate([-6, -2, -3]) {
        translate([-3.5, 0, 0]) cylinder(d = 1.9, h = 10);
        translate([15.5, 0, 0]) cylinder(d = 1.9, h = 10);
    }
    translate([-12, 8, 0]) rotate([0, 0, -14]) cube([5, 20, 10], true);
    translate([12, 8, 0]) rotate([0, 0, 14]) cube([5, 20, 10], true);
}
//translate([4, 4, 4]) #cube([12.5, 1, 1]);
//translate([0, -6, 4]) #cube([17, 1, 1],true);