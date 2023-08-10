$fn = 360;
height = 2.9;

difference() {
    cylinder(d = 42, h = height);
    translate([0, 0, -0.5]) cylinder(d = 35.6, h = height + 1);
}