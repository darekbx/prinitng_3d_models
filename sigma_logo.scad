$fn = 90;

linear_extrude(2) logo();

translate([-14.25, -15.75, 0]) rotate([0, 0, 45]) cube([42, 2, 2]);

module logo() {
    scale([1, 0.33, 1]) ring();
    scale([0.33, 1, 1]) ring();
}

module ring() {
    difference() {
        circle(d = 100);
        circle(d = 94);
    }
}