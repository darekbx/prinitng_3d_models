$fn = 90;

scale([0.9, 0.85, 1]) difference() {
    import("Mudguard_v2.stl");
    translate([45, -20, -1]) cube([80, 70, 5]);
    translate([-125, -20, -1]) cube([80, 70, 5]);
    translate([0, 55, -1]) cube([180, 70, 5], true);
    translate([0, 2, -1]) cylinder(d = 6.5, h = 10);
}

!difference() {
    scale([1.2, 1.1, 1])
        rotate([0, 0, 180])
            translate([-110, -240, -10])
                import("Mudguard_back_2.STL");
    
    translate([0, 210, -1]) cube([290, 370, 25], true);
    translate([0, -80, -13.1091]) cube([39, 70, 25], true);
    
    translate([32, -20, -1]) cube([80, 70, 5]);
    translate([-112, -20, -1]) cube([80, 70, 5]);
    
    translate([0, 8, -1]) cylinder(d = 5.2, h = 10);
}