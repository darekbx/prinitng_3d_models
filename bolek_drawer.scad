$fn = 90;

difference() {
    cube([22, 34, 26]);
    translate([-0.1, 1.7, 1.7]) cube([20, 30.6, 10.6]);
    translate([-0.1, 1.7, 13.7]) cube([20, 30.6, 10.6]);
}

//translate([0, 2, 14]) drawer();

module drawer() {
    difference() {
        cube([20, 30, 10]);
        translate([1.5, 1.5, 1.5]) cube([17, 27, 10]);
    }
    translate([-1, 15, 5]) sphere(d = 4);
}

translate([10, 17, 26]) rotate([0, -90, 0]) {
    width = 3;   // width of rectangle
    height = 3;   // height of rectang
    curve(width, height, 10, 5);
}

module curve(width, height, length, dh) {
    r = (pow(length/2, 2) + pow(dh, 2))/(2*dh);
    a = 2*asin((length/2)/r);
    translate([-(r -dh), 0, -width/2]) rotate([0, 0, -a/2])         rotate_extrude(angle = a) translate([r, 0, 0]) square(size = [height, width], center = true);
}