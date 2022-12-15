use <../libs/bend.scad>

$fn = 45;

holesDistance = 64;

width = 170;   // width of rectangle
height = 1;   // height of rectangle
r = 50;       // radius of the curve
a = 40;       // angle of the curve

//base3();
/*
module base3() {
    difference() {
        cylinder(h = 170, d = 40);
        translate([-5, -20, -1]) cube([50, 50, 172]);
        translate([-20, 0, -1]) #cube([50, 50, 172]);
    }
}*/


minkowski() {
    curve();
    cylinder(h = 1, d = 5);
}

module curve() {
    
    translate([0, -40, -50]) rotate(-90, [0,0,1])
      parabolic_bend([20, 150, 2], 0.007)
        translate([20, 0, 0]) rotate(90, [0,0,1])
        cube([width - 5 * 2, a - 5 * 2, 1]);
}


module base() {
    translate([0, 0, r]) rotate([0, 90, 0])
        rotate_extrude(angle = a) 
            translate([r, 0, 0]) 
                square(size = [height, width], center = true);
}