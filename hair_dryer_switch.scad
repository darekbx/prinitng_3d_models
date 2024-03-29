$fn = $preview ? 60 : 240;

radius = 26;
thickness = 1.3;
height = 51;

//left();
translate([20, -3, 0]) rotate([0, 0, -18]) right();

module right() {
    mirror([1,0,0]) left();
}

module left() {
    if ($preview) {
        translate([0, 26.5, 0]) color("#FF0000") cube([14.5, 5, 1]);
        translate([2, 29.5, -4]) color("#00FF00") cube([1, 1, 17]);
        translate([2, 30.5, -4]) color("#0000FF") cube([1, 1, 24]);
        translate([2, 30.5, -4 + 26]) color("#0000FF") cube([1, 1, 24]);
    }

    //translate([0, 0, -4]) base(height);

    translate([0, 4, 0]) rounded_base();

    translate([1, 26, 13]) switch_holder();
    translate([5.5, 31, 23]) handle();
}

module handle() {
    rotate([0, 0, -9]) { 
        minkowski() {
            cube([6, 2.5, 2]);
            difference() {
                rotate([90, 0, 0]) sphere(r = 2);
                translate([-2, -4, -2]) cube([4, 4, 4]);
            }
        }
    }
}

module switch_holder() {
    rotate([0, 0, -9]) { 
        wall_thickness = 1.5;
        cube([7, 5, wall_thickness]);
        translate([0, 0, 6.1 + wall_thickness]) cube([7, 5, wall_thickness]);
        translate([5.5, 3.5, 1]) cube([wall_thickness, 2.5, 7]);
    }
}

module rounded_base() {
    difference() {
        minkowski() {
            translate([4, 0, 0]) base(height - 8);
            difference() {
                rotate([90, 0, 0]) cylinder(d = 8, h = 0.001);
                translate([0, -2, -10]) cube([10, 10, 20]);
            }
        }
        translate([3.5, 0.3, -6]) cylinder(r = radius, h = height + 10);
        translate([-2, 0.7, -6]) cylinder(r = radius, h = height + 10);
        translate([15 - 14.5, -48.5, -5]) rotate([0, 0, -10]) cube([100, 100, height + 2]);
    }
}

module base(height) {
    difference() {
        cylinder(r = radius + thickness, h = height);
        translate([0, 0, -1]) cylinder(r = radius, h = height + 2);
        
        translate([15.5 - 14.5, -50, -1]) rotate([0, 0, -10]) cube([100, 100, height + 2]);
        translate([-71 - 14.5 * 2, -50, -1]) cube([100, 100, height + 2]);
        translate([-50, -80, -1]) cube([100, 100, height + 2]);
    }
}