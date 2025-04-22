include <threads.scad>
$fn = $preview ? 16 :90;

if ($preview) {
    cylinder(d=15.5, h=36);
} else {
    metric_thread(diameter = 15.5, pitch = 2, length = 36, internal = true);
}

translate([0, 0, 3]) {
    difference() {
        translate([0, 0, -20]) cube([100, 20, 48], true);
        translate([0, 0, -24]) cube([90, 22, 40], true);
    }

    translate([-50, 0, -44]) rotate([0, 90, 0]) cylinder(d=20, h=100);
}
