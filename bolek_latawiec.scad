$fn = 30;
b = 20;
t = 22;

difference() {
    kite();
    translate([0, 0, -1]) cube([120,200, 2], true);
}

module kite() {
    linear_extrude(0.4) {
        polygon(points=[
            [0, 0],
            [0, t],
            [b, 0],
            [0, -40],
            [-b, 0],
            [0, t],
        ]);
    }

    p = 1;
    w = 50;
    translate([-w/2, 0, 0.4]) rotate([0, 90, 0]) cylinder(d = p, h = w);

    h = 72;
    translate([0, h/2 - 9, 0.4]) rotate([90, 0, 0]) cylinder(d = p, h = h);

    d = 1.5;
    translate([0, h/2 - 9, 0.4]) sphere(d = d);
    translate([0, -h/2 - 9, 0.4]) sphere(d = d);

    translate([-w/2, 0, 0.4]) sphere(d = d);
    translate([w/2, 0, 0.4]) sphere(d = d);
}

//#translate([-8,-15,0]) rotate([0,0,26]) cube([10, 45, 10], true);