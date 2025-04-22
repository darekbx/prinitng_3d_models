include <threads.scad>
$fn = $preview ? 16 :90;

wall_thickness = 3;
outer_diameter_top = 61;
outer_diameter_bottom = 46;
height = 30;

translate([0, 0, height]) difference() {
    metric_thread(diameter = 56, pitch = 5, length = 10, thread_size = 4.5, internal = true, angle = 65);
    translate([0, 0, -1]) cylinder(h = height + 10, d = outer_diameter_top - wall_thickness * 2 - 3.5);
}

difference() {
    cylinder(h = height, d1 = outer_diameter_bottom, d2 = outer_diameter_top);
    translate([0, 0, 3]) 
        cylinder(h = height - 2, d1 = outer_diameter_bottom - wall_thickness * 2, d2 = outer_diameter_top - wall_thickness * 2 - 3);
}