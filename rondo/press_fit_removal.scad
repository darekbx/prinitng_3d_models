$fn = 90;
diameter = 13;
s = 15;

rotate([0, 90, 0])
    scale([s, s, s])
        import("Bearing_drift_press_for_SRAM_Dub_Bottom_Bracket_v1.stl", 1);

//#cylinder(d = 18, h = 70);
/*
cylinder(d = diameter, h = 110);
translate([0, 0, 4]) cylinder(d2 = diameter, d1 = 16, h = 10);
cylinder(d = 16, h = 4);
translate([0, 0, 110]) sphere(d = diameter);
*/