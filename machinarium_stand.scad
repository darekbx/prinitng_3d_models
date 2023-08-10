
$fn = 12;
difference() {
    translate([0, 0, 0]) {
        cylinder(d1 = 40, d2 = 30, h = 5);
        cylinder(d1 = 40, d2 = 40, h = 1);
    }
    
    translate([0, 6, -0.1]) {
        cylinder(d = 6, h = 2);
        cylinder(d = 3, h = 10);
    }
    translate([0, -6, -0.1]) {
        cylinder(d = 6, h = 2);
        cylinder(d = 3, h = 10);
    }
}