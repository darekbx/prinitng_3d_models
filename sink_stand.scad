$fn = $preview ? 45 : 90;

//stand()

module stand() {
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
}

difference() {
    translate([-25, 30, -6]) brushMount();
    scale([1.02, 1, 1.05]) stand();
}

module brushMount() {
    difference() {
        translate([0, 0, 0]) {
            cylinder(d = 30, h = 60);
            translate([0, -15, 0]) cube([28, 30, 22]);
        }
        translate([0, 0, 3]) cylinder(d = 26, h = 70);
    }
}