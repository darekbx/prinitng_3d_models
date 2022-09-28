include <threads.scad>

$fn = 90;
diameter = 9.5;
thickness = 1.5;
bolt_diameter = 4.3;
bolt_height = 7;


cone(8);

module plug() {
    cylinder(d1 = diameter - 1, d2 = diameter, h = thickness);
    translate([0, 0, thickness]) metric_thread(diameter=bolt_diameter, pitch=1, length=bolt_height);
}

module cone(height) {
    translate([0, 0, -1])cylinder(d1 = 0, d2 = diameter, h = height);
    translate([0, 0, height - 1]) cylinder(d1 = diameter, d2 = diameter, h = 1);
    translate([0, 0, height]) metric_thread(diameter=bolt_diameter, pitch=1, length=bolt_height);
}