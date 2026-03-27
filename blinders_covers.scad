$fn = 90;

translate([0, 0, 0]) a();
translate([20, 0, 0]) b();

module a() {
    difference() {
        cube([9, 2, 140]);
        translate([2, 0, -1]) cylinder(d = 2, h = 150); 
        translate([7, 0, -1]) cylinder(d = 2, h = 150); 
        
        translate([4.5, 4, 20]) rotate([90, 0, 0]) cylinder(d = 3, h = 10); 
        translate([4.5, 4, 70]) rotate([90, 0, 0]) cylinder(d = 3, h = 10); 
        translate([4.5, 4, 120]) rotate([90, 0, 0]) cylinder(d = 3, h = 10); 
    }
}

module b() {
    difference() {
        cube([9, 2, 140]);
        translate([2, 0, -1]) cylinder(d = 2, h = 150); 
        translate([7, 0, -1]) cylinder(d = 2, h = 150); 
         
    }
    translate([4.5, 2, 20]) rotate([90, 0, 0]) cylinder(d = 3.2, h = 4); 
    translate([4.5, 2, 70]) rotate([90, 0, 0]) cylinder(d = 3, h = 4);
    translate([4.5, 2, 120]) rotate([90, 0, 0]) cylinder(d = 3, h = 4);
}