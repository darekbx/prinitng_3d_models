include <libs/cyl_head_bolt.scad>

$fn = 90;

cylinder(d = 8.5, h = 20);
cylinder(d = 9.5, h = 1);

translate([0, 0, 20 + 3.8]) key_slot(name = "M8", k = 5.2, l = 3.8);