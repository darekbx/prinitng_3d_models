$fn = 90;

d = 19.5;
wall_thickness = 2.5;

mount();
handle();

module mount() {
    translate([0, 0, -3]) difference() {
        cylinder(d = d + 2 * wall_thickness, h = 40 + 5);
        translate([0, 0, -0.1]) cylinder(d = d, h = 40);
        
        translate([0, -11, 7]) rotate([90, 0, 0]) cylinder(d1 = 2.5, d2 = 8, h = 2);
        translate([0, -9.1, 7]) rotate([90, 0, 0]) cylinder(d = 2.5, h = 2);
    }
}

module handle() {
    translate([0, 50, 100]) rotate([90, 0, 0]) cylinder(d = d + 2 * wall_thickness, h = 100);
    translate([-12.25, 44, 90]) cube([d + 2 * wall_thickness, 6, 10]);
    translate([-12.25, -50, 90]) cube([d + 2 * wall_thickness, 6, 10]);
    
    translate([-12.25, 0, 90]) rotate([90, 0, 90]) difference() {
        cylinder(d = 100, h = d + 2 * wall_thickness, true);
        translate([0, 0, -2]) cylinder(d = 88, h = 30, true);
        translate([-60, 0, -2]) cube([120, 80, 30]);
    }
}