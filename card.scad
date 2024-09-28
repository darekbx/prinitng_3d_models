$fn = 90;
difference() {
minkowski() {
    cube([50, 40, 0.2]);
    cylinder(d = 8, h = 0.5);
}
}
