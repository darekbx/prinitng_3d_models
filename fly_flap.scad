$fn = 90;

difference() {
    flap();
    mount();
}
mount(filled = true);

module flap() {
    scale([17, 17, 2.4]) linear_extrude(1) polygon([
        [1, 5],
        [2, 6.75],
        [8, 6.75],
        [9, 5],
        [5, -1]
    ]);
}

module mount(filled = false) {
    translate([85, -11, 3.5]) rotate([0, 0, 180]) difference() {
        cube([16, 19, 7], true);
        if (filled) translate([0, 1, 0]) cube([13.2, 17.2, 3.5], true);
        if (filled) translate([0, 7 - 6, -10]) cylinder(d = 5, h = 20);
    }
    translate([85, 5, 3.9]) {
        rotate([-13, 0, 0]) cube([16, 15, 3], true);
        translate([0, -4, 0]) rotate([0, 0, 0]) cube([16, 8, 3], true);
    }
}