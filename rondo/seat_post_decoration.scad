$fn = $preview ? 50 : 120; 

//#cylinder(h = 170, d = 27.2);
support();

module support() {
    parts = 14;
    diameter = 2.0;
    for(i = [0:parts])
       rotate(i * 360 / parts)
            translate([15, diameter / 2, 0]) {
                rotate([10, -17.4, 0]) cylinder(d1 = 8, d2 = 4, h = 170);
            }
}