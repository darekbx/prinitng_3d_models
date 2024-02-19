$fn = 60;

difference() {
    guard();
    body();
}

module body() {
    cube([43.5, 100, 59], true);
    translate([24, 0, 0]) cube([12, 26, 34], true);
}

module guard() {
    translate([0.5, 0, 0]) difference() {
        cube([43.5 + 2, 35, 59 + 2], true);
        translate([2, 0, 0]) cube([43.5 + 1, 38, 50], true);
    }
    
    guard_part();
    translate([0, 30, 0]) guard_part();
    
    translate([34, 15, -15.5]) 
        rotate([90, 0, 0]) cylinder(d = 5, h = 30);
    
    translate([34, 15, 14.5]) 
        rotate([90, 0, 0]) cylinder(d = 5, h = 30);
    
}

module guard_part() {
    translate([34, -15, 14.5]) 
        rotate([0, -45, 0]) cylinder(d = 5, h = 18);
    
    translate([21.5, -15, -28]) 
        rotate([0, 45, 0]) cylinder(d = 5, h = 18);
    
    translate([34, -15, -15.5]) cylinder(d = 5, h = 30);
    translate([34, -15, -15.5]) sphere(d = 5);
    translate([34, -15, 14.5]) sphere(d = 5);
    
}
