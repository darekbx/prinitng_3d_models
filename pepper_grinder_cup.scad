include <threads.scad>
$fn = $preview ? 16 :90;

wall_thickness = 3;
outer_diameter_top = 61;
outer_diameter_bottom = 46;
height = 36;


translate([0, 0, height]) difference() {
    metric_thread(diameter = 56, pitch = 5, length = 11, thread_size = 4.5, internal = true, angle = 60);
    translate([0, 0, -1]) cylinder(h = height + 10, d = outer_diameter_top - wall_thickness * 2 - 4.2);
}

difference() {
    translate([0,0,0]) {
        translate([0,0,height-2]) cylinder(h = 2, d = outer_diameter_top+1, $fn=90);
        translate([0,0,-2]) cylinder(h = height, d1 = outer_diameter_bottom, d2 = outer_diameter_top+1.1, $fn=16);
    }
    translate([0, 0, 3]) 
        cylinder(h = height - 2, d1 = outer_diameter_bottom - wall_thickness * 2, d2 = outer_diameter_top - wall_thickness * 2 - 3);
}

!top_cap();
module top_cap() {
    translate([0,0,9]) cylinder(d = 57, h = 2);
    difference() {
        cylinder(d = 49, h = 9);
        translate([0,0,-1]) cylinder(d = 44, h = 11);
    }
}