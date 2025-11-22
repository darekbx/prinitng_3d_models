$fn = 90;

//translate([160, 100, 40]) hand_handle();
//rotate([0, 0, 90]) arm_handle();

difference() {
    minkowski() {
        sword_handle();
        sphere(r = 1);
    }
    translate([0, 0, -1]) cube([45, 15, 30 + 4], true);
    
    translate([-19.5, 13, 0]) translate([-1, 0, 0]) cube([20, 3, 26], true);
    
    translate([19.5, 13, 0]) translate([-1, 0, 0]) cube([20, 3, 26], true);
}

module sword_handle() {
    cube([45 + 8, 15 + 6, 30], true);
    translate([-19.5, 13, 0]) cube([14, 6, 30], true);
    translate([19.5, 13, 0]) cube([14, 6, 30], true);
}

module hand_handle() {
    rotate([90, 0, 0]) cylinder(d = 20, h = 100);

    translate([-10, -10, -40]) cube([20, 10, 40]);
    translate([-10, -100, -40]) cube([20, 10, 40]);

    translate([-50, -10, -40]) cube([100, 22, 6]);
    translate([-50, -112, -40]) cube([100, 22, 6]);
}

module arm_handle() {
    cube([70, 22, 6]);
    translate([0, 40, 0]) cube([70, 22, 6]);
    cube([10, 62, 65]);
    
    translate([28, 62, 35]) rotate([90, 0, 0]) difference() {
        cylinder(d = 82, h = 62);
        translate([0, 0, -1]) cylinder(d = 70, h = 68);
        translate([-45, -70, -30]) cube([100, 100, 100]);
        translate([-5, -50, -30]) cube([100, 100, 100]);
    }
    
    translate([23, 0, 69.67]) cube([30, 62, 6]);
}