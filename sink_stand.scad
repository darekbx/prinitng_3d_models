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
    scale([1.05, 1, 1.05]) stand();
}

module brushMount() {
    difference() {
        translate([0, 0, 0]) {
            cylinder(d = 36, h = 60);
            translate([0, -18, 0]) cube([28, 36, 22]);
        }
        translate([0, 0, -1]) cylinder(d = 30, h = 70);
    }
}