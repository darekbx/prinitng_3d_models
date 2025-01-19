$fn = 90;
difference() {
    translate([0, 0, 0]) {
        difference() {
            import("C:/Users/darek/development/prinitng_3d_models/skadis/skadisHook.stl");
            translate([3, 20, 0]) {
                cube([6, 5, 5], true);
            }
        }
        translate([0, 0, -14]) {
            difference() {
                import("C:/Users/darek/development/prinitng_3d_models/skadis/skadisHook.stl");
                translate([3, 20, 0]) {
                    cube([10, 5, 5], true);
                }
            }
        }
    }
    translate([8.5, 0, 0]) {
        cube([12, 45, 5], true);
    }
}


translate([0, 0, -10]) {
    difference() {
        import("C:/Users/darek/development/prinitng_3d_models/skadis/skadisHook.stl");
        translate([3, 20, 0]) {
            cube([10, 5, 5], true);
        }
        translate([8.5, 0, 0]) {
            cube([12, 45, 5], true);
        }
    }
}
translate([0, 0, -6]) {
    difference() {
        import("C:/Users/darek/development/prinitng_3d_models/skadis/skadisHook.stl");
        translate([3, 20, 0]) {
            cube([10, 5, 5], true);
        }
        translate([8.5, 0, 0]) {
            cube([12, 45, 5], true);
        }
    }
}
translate([0, 0, -2]) {
    difference() {
        import("C:/Users/darek/development/prinitng_3d_models/skadis/skadisHook.stl");
        translate([3, 20, 0]) {
            cube([10, 5, 5], true);
        }
        translate([8.5, 0, 0]) {
            cube([12, 45, 5], true);
        }
    }
}