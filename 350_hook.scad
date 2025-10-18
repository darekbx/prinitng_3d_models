$fn = 180;


difference() {
    small_hook();
    translate([-16.5, -51, -1]) cube([60, 30, 17]);
}

module small_hook() {
    difference() {
        translate([-132, -100, 4]) {
            import("C:/Users/darek/Downloads/Skadis - Hook.stl");
        }
        translate([-56.5, -30, 2]) cube([80, 70, 8]);
    }

    translate([20, -24.5, 4]) cube([4, 24.5, 4.5]);
    translate([2, -21, 4]) cube([18, 5, 4.5]);
    translate([0, -0, 4])difference() {
        cylinder(d = 42, h = 6.5);
        translate([-36.5, 0, -1]) cube([60, 30, 17]);
        translate([0, 0, -3]) { 
            cylinder(d = 57, h = 2);
            translate([0, 0, 2]) cylinder(d = 32, h = 15);
        }
    }
}

module standard_hook() {
    difference() {
        translate([-132, -100, 4]) {
            import("C:/Users/darek/Downloads/Skadis - Hook.stl");
        }
        translate([-56.5, -30, 2]) cube([80, 70, 8]);
    }

    translate([18, -24.5, 4]) cube([6, 14, 4.5]);
    translate([10, -24.5, 4]) cube([10, 6, 4.5]);
    translate([0, -0, 4])difference() {
        cylinder(d = 53, h = 4.5);
        translate([-36.5, 0, -1]) cube([60, 30, 7]);
        translate([0, 0, -3]) { 
            cylinder(d = 57, h = 2);
            translate([0, 0, 2]) cylinder(d = 39, h = 10);
        }
    }
}