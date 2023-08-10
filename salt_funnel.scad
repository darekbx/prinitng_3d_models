$fn = $preview ? 90 : 180;

difference(){ 
    funnel();
    //translate([0, 0, 10]) #cube([100, 100, 100], true);
}

module funnel() {
    angle = 15;
    scale([0.97, 1, 1]) difference() {
        translate([10.8, 10.5, 0]) {
            rotate([0, angle, 0]) tube(30, 70);
            rotate([0, angle, 0]) translate([0, 0, -50]) tube(50, 50.5);
        }
        translate([0, 0, -60]) cube([100, 100, 40], true);
    }

    difference() {
        translate([0, 10.5, -70]) tube(30);
        translate([14, -10, -95]) cube(40);
    }
}

module tube(h, d2 = 50) {
    d1 = 50;
    difference() {
        cylinder(d1 = d1, d2 = d2, h = h);
        translate([0, 0, -1]) cylinder(d1 = d1 - 2, d2 = d2 - 2, h = h + 2);
    }
}