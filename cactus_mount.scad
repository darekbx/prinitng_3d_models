$fn = 90;

minkowski() {
    cube([8-2, 5.3-2, 1.9 - 1], true);
    cylinder(d = 2);
}
translate([-27, 0, -0.45]) difference() {
    cylinder(d = 48, h = 1.9);
    translate([0, 0, -0.5]) cylinder(d = 40, h = 3);
    translate([-47, 0, -0.5])cube([80, 80, 6], true);
}

//translate([0, 0, 0.5]) #cube([7, 5.5, 2.1], true);