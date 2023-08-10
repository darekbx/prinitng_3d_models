$fn = 60;

module part() { scale([25.45, 25.75, 25]) import("Knex_Yellow_Half_Circle.stl"); }
    
difference() {
    
    translate([0, 0, 0]) {
        part();
        translate([0, 34 + 6, 0]) mirror([0, 1, 0]) part();

        translate([-13.5, 16, 0]) cube([1, 8, 6]);
        translate([-32.5, 16, 0]) cube([1, 8, 6]);

        translate([-22.5, 20, 0]) 
            difference() {
                cylinder(d = 9, h = 6);
                translate([0, 0, -1]) cylinder(d = 6, h = 8);
            }
            
        translate([-9.3, 23.93, 0]) cylinder(d = 3.5, h = 6);
        translate([-9.3, 23.93 - 8, 0]) cylinder(d = 3.5, h = 6);
            
        translate([-35.5, 23.93, 0]) cylinder(d = 3.5, h = 6);
        translate([-35.5, 23.93 - 8, 0]) cylinder(d = 3.5, h = 6);
            
    }
    
    
    translate([-8, 20, 3]) rotate([0, 90, 0]) cylinder(d = 6.6, h = 8);
    translate([-45, 20, 3]) rotate([0, 90, 0]) cylinder(d = 6.6, h = 8);
}