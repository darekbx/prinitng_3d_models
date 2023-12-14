$fn = 90;

cube([15, 35, 10]);

// nose
translate([7.5, 10, 10]) cylinder(d = 5, h = 2);

// eyes
translate([3, 4, 10]) cylinder(d = 2.5, h = 1);
translate([12, 4, 10]) cylinder(d = 2.5, h = 1);

// mouth
translate([7.5, 13, 11]) rotate([0, 0, 90]) {

    width = 1;   // width of rectangle
    height = 1;   // height of rectangle
    r = 20;       // radius of the curve
    a = 30;       // angle of the curve

    curve(width, height, 10, 4);
}

module curve(width, height, length, dh) {
    r = (pow(length/2, 2) + pow(dh, 2))/(2*dh);
    a = 2*asin((length/2)/r);
    translate([-(r -dh), 0, -width/2]) rotate([0, 0, -a/2])         rotate_extrude(angle = a) translate([r, 0, 0]) square(size = [height, width], center = true);
}