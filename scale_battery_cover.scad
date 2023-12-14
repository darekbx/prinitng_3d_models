$fn = 90;

difference() {
    intersection() {
        translate([-25, 0, -9]) rotate([0, 90, 0]) cylinder(d = 29, h = 50);
        cylinder(d = 24, h = 6);
    }
    translate([-25, 0, -7]) rotate([0, 90, 0]) cylinder(d = 23, h = 50);
    translate([-25, 0, -9]) rotate([0, 90, 0]) cylinder(d = 26.8, h = 50);
}

translate([9.9, -1.75, 2.5]) {
    cube([4, 3.5, 1]);
    translate([0, 0, 1]) cube([2, 3.5, 1]);
}

translate([-13, -3, -1]) {
    cube([6, 6, 6]);
    
    translate([-0.75, 1, 3]) {
        rotate([0, 45, 0]) cube([1, 4, 1]);
    }
    
    translate([-2, 0, 5]) {
        cube([4, 6, 1]);
    }
}