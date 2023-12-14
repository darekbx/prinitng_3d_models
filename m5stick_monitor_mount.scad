$fn = 90;

d = 34;

// mount
difference() {
    translate([0, 0, 0]) {
        cylinder(d = d + 6, h = 20);
        translate([-10, -30, 0]) cube([20, 15, 20]);
    }
    translate([0, 0, -1]) cylinder(d = d, h = 22);
    translate([-16, 0, -1]) cube([32, 24, 30]); 
}

// clamp
translate([-24, -32, 2]) rotate([90, 0, 0]) difference() {
    translate([14, -2, -2]) cube([20, 28, 18]);
    cube([48.2, 24.4, 14.5]);
    translate([0, 1, 4]) cube([48.2, 21.5, 13.7]);  
}