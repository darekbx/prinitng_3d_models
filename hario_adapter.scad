
difference() {
    cylinder(d = 14, h = 12, $fn = 6);
    translate([0, 0, -0.1]) cylinder(d = 8.2, h = 6, $fn = 6);
}

translate([0, 0, 14]) {
    cube([2, 5.2, 8], true);
    cube([5.2, 2, 8], true);
}