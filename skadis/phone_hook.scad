
difference() {
    import("SkadisStrongHook_20mm.stl");
    translate([21, -2, -1]) cube([13, 60, 20]);
}

translate([-6, 0, 0]) difference() {
    import("SkadisStrongHook_20mm.stl");
    translate([-10, -2, -1]) cube([36, 60, 20]);
}

translate([-6, 8, 0]) difference() {
    import("SkadisStrongHook_20mm.stl");
    translate([-10, -2, -1]) cube([36, 60, 20]);
    translate([0, -2, -1]) cube([36, 10, 20]);
}
translate([-6, 14, 0]) difference() {
    import("SkadisStrongHook_20mm.stl");
    translate([-10, -2, -1]) cube([36, 60, 20]);
    translate([0, -2, -1]) cube([36, 10, 20]);
}

//translate([7, 7, 0]) #cube([13, 60, 10]);