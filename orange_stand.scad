$fn = $preview ? 30 : 90;

height = 45;

difference() {
    support();
    translate([0, 0, 45]) #sphere(d = 62);
}

module support() {
    parts = 4;
    diameter = 6.0;
    for(i = [0:parts])
       rotate(i * 360 / parts)
            translate([28, diameter / 2, 0]) {
                rotate([0, -17.4, 0]) cylinder(d1 = 4, d2 = 10, h = height + 7);
            }
}
 
difference() {
    translate([0, 0, 0]) {
        cylinder(d1 = 68, d2 = 60, h = 2);
        translate([0, 0, -1]) cylinder(d1 = 68, d2 = 68, h = 1);
    }
    translate([0, 0, -2]) cylinder(h = 10, d = 52.5);
}
