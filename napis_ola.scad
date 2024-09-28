$fn = 90;

rotate([90, 0, 0]) linear_extrude(5) text("Ola");
translate([0, -6, -2]) cube([23, 7, 2]);

translate([(23-2)/2, -6, -20]) cube([2, 7, 20]);

translate([0, -6, -20]) cube([2, 7, 20]);
translate([21, -6, -20]) cube([2, 7, 20]);

translate([0, -6, -20]) cube([23, 7, 2]);