$fn = 90;

stand_diameter = 75;
stand_heigth = 170;
pole_diameter = 10;
/*
difference() {
    translate([0, 0, 0]) {
        translate([0, 0, 3]) cylinder(d1 = stand_diameter, d2 = pole_diameter, h = pole_diameter);
        cylinder(d = stand_diameter, h = 3);
    }
    cube([10.1, 10.1, 50], true);
    translate([0, 0, 14]) cube([40, 40, 10], true);
}
*/

translate([50, -stand_heigth/2, 0]) cube([10, stand_heigth, 10]);

translate([-18, -stand_heigth/2, 0]) 
    difference() {
        cube([70, 10, 10]);
        translate([2, -1, -5]) cube([6, 6, 20]);
    }