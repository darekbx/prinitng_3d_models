$fn = 45;

difference() {
    minkowski() {
        cube([146, 78, 10]);
        cylinder(d = 10, h = 1);
    }

    translate([4, 4, 1.5]) minkowski() {
        cube([138, 70, 10]);
        cylinder(d = 10, h = 1);
    }
}

translate([0, 0, -6]) minkowski() {
    cube([146, 65, 5]);
    cylinder(d = 10, h = 1);
}