include <threads.scad>

$fn = $preview ? 16 :90;

if (false&&$preview) {
    cylinder(d=4.9, h=6);
} else {
    metric_thread(diameter = 4.9, length = 6, internal = true);
}

translate([0, 0, 6]) { 
    //#cylinder(d1=15, d2=14, h=15);
    minkowski() {
        cylinder(d1=17 - 4, d2=16 - 4, h=10-4);
        difference() {
            sphere(r=2);
            translate([-2, -2, -4]) cube(4);
        }
    }
}

        