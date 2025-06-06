$fn = 50;

difference() {
    base(false);
}

difference() {
    translate([-14-2, 6, -6.5]) cube([8, 24, 18], true);
    translate([-16, -1.5, -11.5]) cube([10, 22, 18], true);
}

module base(e) {
    difference() {
        translate([0, 1.5, 0]) cube([24, 15, 5], true);
        
        rotate([-90, 0, 0]) #translate([-6.25, 0, 0]) {
            translate([-1, 0, 0]) cylinder(d = 1.9, h = 10);
            translate([13.5, 0, 0]) cylinder(d = 1.9, h = 10);
        }
        #translate([-6, -2, -3]) {
            translate([-3.5, 0, 0]) cylinder(d = 1.9, h = 10);
            translate([15.5, 0, 0]) cylinder(d = 1.9, h = 10);
        }
        //translate([-13, 8, 0]) rotate([0, 0, -10]) cube([5, 20, 10], true);
        translate([13, 8, 0]) rotate([0, 0, 10]) cube([5, 20, 10], true);
    }
}
//translate([4, 4, 4]) #cube([12.5, 1, 1]);
//translate([0, -6, 4]) #cube([17, 1, 1],true);
//translate([-14, 13.5, 4]) #cube([1, 9, 10],true);