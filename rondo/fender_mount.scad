$fn = 90;
frame_tube_diameter = 31.7;
width = 25;

difference() {
    import("SKS_AL46_bridge.stl", convexity=3);
    translate([-19, -27, -1]) cube([27, 35, 18]);
}

translate([-5.75, -(width - 0.5), -1]) {
    difference() {
        translate([0, 0, 0]) {
            rotate([-14, 0, 0]) 
                translate([0, 0, 5.54]) 
                    cylinder(d = frame_tube_diameter + 6.5, h = 17);
            translate([(-18.25 + 5.75), 14.5, 1]) cube([25, width, 18]);
            translate([11, 11, 5]) rotate([0, 0, 9]) cube([5, 20, 5]);
            translate([-16, 11, 5]) rotate([0, 0, -9]) cube([5, 20, 5]);
        }
        translate([0, 0, 0]) rotate([-14, 0, 0]) {
            translate([0, 0, 3]) 
                cylinder(d = frame_tube_diameter, h = 24);
            translate([-13.8, -36, 3]) 
                cube([frame_tube_diameter - 4, 30, 30]);
        }
    }
}