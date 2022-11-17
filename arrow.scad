$fn = 180;

difference() {
    arrow();
    translate([-5, -0.5, 228]) cube([10, 1, 10]);
}

module arrow() {
    cylinder(h = 230, d = 7);
    translate([0, 0, -10]) cylinder(h = 10, d1 = 2, d2 = 7);
}