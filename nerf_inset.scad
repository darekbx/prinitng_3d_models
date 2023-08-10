$fn = 40;

difference() {
    translate([0, 0, 0]) {
        cylinder(d = 6, h = 70);
        for (i = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55]) {
            translate([0, 0, 10 + i]) sphere(d = 6.3);
        }
    }
    
    translate([0, 0, -0.5]) cylinder(d = 3, h = 78);
}
    translate([0, 0, -0.5]) cylinder(d = 14, h = 3);
