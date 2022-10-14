include <threads.scad>

$fn = 90;
diameter = 9;
thickness = 1.5;
bolt_diameter = 4;
bolt_height = 6;

cylinder(d1 = diameter - 1, d2 = diameter, h = thickness);
translate([0, 0, thickness]) metric_thread(diameter=bolt_diameter, pitch=1, length=bolt_height);