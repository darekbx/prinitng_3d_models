$fn = 80;
s = 14.3;

/*
cylinder(d = 60,h = 3);
difference() {
    cylinder(d = 32, h = 30);
}
*/

translate([7, 7, -10]) cylinder(d = 11, h = 10);
translate([7, 7, -12]) cylinder(d1 = 10, d2= 11, h = 2);

cylinder(d = 36, h = 5);
translate([0, 0, 2.5]) cube([70, 10, 5], true);
translate([0, 0, 2.5]) cube([10, 70, 5], true);

difference() {
    cylinder(d = 32, h = 20);
}

translate([-1.5, -1.5, 0]) rotate([0, 90, 0]) mount();


module mount() {
    cube(s);
    translate([s, 0, 0]) minkowski() {
        cube([2, s, s]);
        sphere(d = 1, $fn =20);
    }
}