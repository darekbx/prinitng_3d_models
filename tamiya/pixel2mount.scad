$fn = 90;

difference() {
    translate([0, 107, 1]) rotate([90, 0, 0]) import("Pixel2XL_Case_Rigid_Materials.stl");
    translate([0, 162, 13]) cube([80, 60, 10], true);
    translate([0, 107, -1]) cube([50, 140, 10], true);
}

translate([0, -6, 0]) mount();
translate([0, 218, 0]) mount();

translate([-6, 186, 0]) cube([12, 28, 7]);
translate([-6.5, -0.5, 0]) cube([13, 28.5, 7]);

mirror([0, 0, 0]) arm();
mirror([1, 0, 0]) arm();
translate([0, 214, 0]) {
    mirror([0, 0, 0]) rotate([0, 0, 180]) arm();
    mirror([1, 0, 0]) rotate([0, 0, 180]) arm();
}

module arm() {
    translate([-2, 215, 0]) rotate([0, 0, 132.5]) cube([1.25, 48, 7]);
}

module mount() {
    difference() {
        cylinder(d = 12, h = 7);
        translate([0, 0, -1]) cylinder(d = 6.6, h = 14);
    }
}