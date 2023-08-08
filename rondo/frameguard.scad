$fn = $preview ? 180 : 130; 

width = 190;


translate([-100, 0, 0]) difference() {
    cylinder(h = width, d = 200);
    translate([-52, 0, -2]) cylinder(h = width + 10, d = 300);
    translate([88, -37, -2]) #cube([10, 10, width + 10]);
    translate([88, 26, -2]) #cube([10, 10, width + 10]);
    
}