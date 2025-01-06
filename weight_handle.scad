include <threads.scad>
$fn = $preview ? 16 :90;

if ($preview) {
    cylinder(d=15.5, h=36);
} else {
    metric_thread(diameter = 15.5, pitch = 2, length = 36, internal = true);
}

translate([0, 0, 3]) {
    difference() {
        translate([0, 0, -20]) cube([98, 15.5, 36], true);
        translate([0, 0, -26]) cube([90, 20, 35], true);
    }

    translate([-49, 0, -38]) rotate([0, 90, 0]) cylinder(d=15.5, h=98);
}
