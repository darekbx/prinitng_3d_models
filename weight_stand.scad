$fn = 180;

d = 94;


difference() {
    cube([74, 25, 17], true);
    translate([0, 3, 40]) 
        rotate([90, 0, 0]) 
            cylinder(h = 20, d = d, center = true);
}

translate([0, -137, 0]) difference() {
    cube([74, 25, 17], true);
    translate([0, -3, 40]) 
        rotate([90, 0, 0]) 
            cylinder(h = 20, d = d, center = true);
}
translate([0, -68.5, 0]) cube([30, 123, 17], center = true);