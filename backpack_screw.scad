
$fn = 90;

!cap();
stick();

module stick() {
    cylinder(d = 5.2, h = 220);
}

module cap() {
    difference() {
        sphere(d = 13);
        translate([-14, 0, 0]) cube([20, 20, 20], true);
        translate([-5, 0, 0]) rotate([0, 90, 0]) cylinder(d = 5.4, h = 8);
        translate([0, 0, 0]) cylinder(d = 2, h = 8);
        translate([0, 0, 4]) cylinder(d = 4, h = 3);
        
    }
}