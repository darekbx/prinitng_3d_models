$fn = 180;

minkowski() {
difference() {
    cube([10, 20, 30], true);
    cylinder(d1 = 15, d2 = 5, h = 40, center = true);
}
sphere(r = 2);
}