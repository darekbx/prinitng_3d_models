$fn = 180;

bolt_diameter = 2;
bolts_mount = 61;

mount_diameter = 71.6;
mount_offset = 0.6;

terminal_angle = 40;


hole_depth = 60;
difference() {
    translate([0, 0, 0]) {
        base();
        
        translate([-28, 0, -(hole_depth - 2)]) cube([56, 2, hole_depth]);
    }
    translate([0, 0, -7]) difference() {
        cylinder(d = 56, h = hole_depth);
        translate([-28, 0, -1]) cube([56, 40, 100]);
    }
}

translate([0, 0, -(hole_depth - 2)]) {
    difference() {
        difference() {
            cylinder(d = 56, h = hole_depth);
            translate([-28, 0, -1]) cube([56, 40, 100]);
        }
        translate([0, 0, 3]) scale([0.95, 0.95, 1.1]) difference() {
            cylinder(d = 56, h = hole_depth);
            //translate([-28, 0, 0]) cube([56, 40, 100]);
        }
    }
}


/*
Uncomment for terminal holder

difference() {
    base();
    translate([0, 05, 28]) rotate([terminal_angle, 0, 0]) terminal();
    translate([0, -30, -6]) rotate([-terminal_angle, 0, 0]) cylinder(d = 12, h = 20);
    translate([0, 0, -3.99]) cylinder(d = 80, h = 4);
    translate([0, 0, 24.5]) cylinder(d = 80, h = 4);
}*/

module terminal() {
    cube([72, 57, 12], true);
    translate([(72 / 2) - 5, 0, -7.5]) cylinder(h = 10, d = 2);
    translate([(72 / 2) - 5, 0, -11]) cylinder(h = 4, d = 3.5);
    translate([-(72 / 2) + 5, 0, -7.5]) cylinder(h = 10, d = 2);
    translate([-(72 / 2) + 5, 0, -11]) cylinder(h = 4, d = 3.5);
}

module base() {
    difference() {
        translate([0, 0, 0]) {
            cylinder(h = 2, d = mount_diameter);
            cylinder(h = 0.6, d = mount_diameter + mount_offset);
        }
        translate([0, 35, -10]) cylinder(h = 20, d = 20);
    }
   // Uncomment for terminal holder
    //translate([(72 / 2) - 5, 2, -1]) rotate([-15, 0, 0]) cylinder(h = 28, d1 = 8, d2 = 5);
    //translate([-(72 / 2) + 5, 2, -1]) rotate([-15, 0, 0]) cylinder(h = 28, d1 = 8, d2 = 5);
}

/*
difference() {
    translate([-67 / 2, -10 / 2, 0]) translate([]) cube([67, 10, 2]);
    translate([bolts_mount / 2, 0, 0]) #cylinder(h = 10, d = bolt_diameter);
    translate([-bolts_mount / 2, 0, 0]) #cylinder(h = 10, d = bolt_diameter);
}*/