$fn = $preview ? 45 : 90;

height = 44;
bottom_diameter = 83.6;
leg_diameter = 10.5;
top_diameter = 62;
mug_out_diameter = 59;
mug_in_diameter = 49;

bottom_plate();
translate([0, 0, height - 1.5]) top_plate();

difference() { 
    support();
    //translate([0, 0, -4]) cylinder(d = bottom_diameter, h = 5);
    translate([0, 0, height + -1.25]) cylinder(d = mug_out_diameter, h = 5);
    translate([0, 0, height + 0]) cylinder(d = top_diameter * 2, h = 5);
    translate([0, 0, height - 45]) cylinder(d = mug_in_diameter, h = 50);
}

module bottom_plate() {
    difference() {
        minkowski() {
            cylinder(d = bottom_diameter - 2);
            sphere(r = 1);
        }
        translate([0, 0, -5]) cylinder(d = bottom_diameter + 10, h = 5);
        translate([0, 0, -5]) cylinder(d = bottom_diameter / 1.5, h = 15);
        
        leg_pos = (bottom_diameter - leg_diameter * 1.35) / 2;
        translate([leg_pos, 0, -1]) cylinder(d = leg_diameter, h = 2);
        #translate([0, leg_pos, -1]) cylinder(d = leg_diameter, h = 2);
        #translate([-leg_pos, 0, -1]) cylinder(d = leg_diameter, h = 2);
        #translate([0, -leg_pos, -1]) cylinder(d = leg_diameter, h = 2);
    }
}

module top_plate() {
    difference() {
        cylinder(d = top_diameter, h = 2);
        translate([0, 0, -1]) cylinder(d = mug_in_diameter, h = 3);
        translate([0, 0, 1.1]) cylinder(d = mug_out_diameter, h = 2);
    }
}

module support() {
    parts = 20;
    diameter = 10.0;
    for(i = [0:parts])
       rotate(i * 360 / parts)
            translate([37, diameter / 2, 0]) {
                rotate([30, -17.4, 0]) cylinder(d1 = 4, d2 = 4, h = height + 7);
            }
}