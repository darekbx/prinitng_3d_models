$fn = 90;

cut_off = false;
screw_check = false;

!design();

if (true&&$preview) {
    difference() {
        design();
        if (cut_off) translate([-5, 0, 0]) cube([10, 200, 100]);
    }
} else {
    difference() {
        placement();
        if (screw_check) {
            #translate([8, -11, -20]) cube([59, 59, 100]);
        }
    }
}

size = 10;
p = 0;
d = 5;
bolt = 2.5;
bolt_head = 6.5;

module placement() {
    translate([size, size * 3, size * 6]) rotate([0, 180, -90]) logo_top();
    translate([0, 0, size]) logo_bottom();
    bolt_cap();
    translate([size, 0, 0]) bolt_cap();
}

module design() {
    logo_top();
    logo_bottom();
    //bolt_cap();
    //translate([size, 0, 0]) bolt_cap();
    
    if (false) {
        translate([size/2, (size + p) * 5 - size/2, (size + p)-14.1])
            #screw();
        translate([size/2, (size + p) * 5 - size/2, (size + p)-20])
            #bolt_cap();
    }
}

module screw() {
   cylinder(d = 5.2, h = 2);
   translate([0, 0, 2]) cylinder(d = 2.6, h = 8); 
}

module logo_top() {
    difference() {
        top();
        /*translate([0, 0, -0.1]) {
            translate([size/2, (size + p) * 5 - size/2, (size + p)]) {
                cylinder(d = d, h = 2.4);
                cylinder(d = bolt, h = 8);
            }
            translate([(size + p) * 4 - size/2, (size + p)+size/2, (size + p)]){
                cylinder(d = d, h = 2.4);
                cylinder(d = bolt, h = 8);
            }
        }*/
    }
}

module logo_bottom() {
    translate([0, 0, -0]) base_with_bolts(d - 0.2, offset = 1);
}

module bolt_cap() {
    cylinder(d = bolt_head - 0.1, h = 5);
}

module top() {
    translate([0, 0, (size + p) * 5]) base();
    translate([0, (size + p) * 4, 0]) wall();
    translate([(size + p) * 3, (size + p), 0]) wall();
    center();
}

module base_with_bolts(d, offset) {
    difference() {
        base(); 
        /*translate([size/2, (size + p) * 5 - size / 2, (size + p) - offset - 9.1]) {
            cylinder(d = bolt_head, h = 8);
            cylinder(d = bolt + 0.5, h = 20);
        }*/
        /*translate([(size + p) * 4 - size/2, (size + p)+size/2, (size + p) - offset - 9.1]) {
            cylinder(d = bolt_head, h = 8);
            cylinder(d = bolt + 0.5, h = 20);
        }*/
        napis();
    }
    translate([size/2, (size + p) * 5 - size/2, (size + p)]) {
        difference() {
            cylinder(d = d, h = 2);
            translate([0, 0, -0.1]) cylinder(d = bolt+ 0.5, h = 20);
        }
    }
    translate([(size + p) * 4 - size/2, (size + p)+size/2, (size + p)]){
        difference() {
            cylinder(d = d, h = 2);
            translate([0, 0, -0.1]) cylinder(d = bolt+ 0.5, h = 20);
        }
    }
}

module napis() {
    translate([2.15, 38, size - 0.9]) 
        rotate([0, 0, -90]) 
            linear_extrude(height = 1) 
                text("MBox", font = "Liberation Sans:style=Bold", size = 6);
    translate([9, 12.15, size - 0.9]) 
        linear_extrude(height = 1) 
            text("team", font = "Liberation Sans:style=Bold", size = 6);
}

module bolt() {
    cylinder(d = 6, h = 10);
}

module center() {
    for (i = [3:5]) translate([0, (size + p), (size + p) * i]) cube(size);
}

module base() {
    for (i = [1:4]) translate([0, (size + p) * i, 0]) cube(size);
    for (i = [1:3]) translate([(size + p) * i, size + p, 0]) cube(size);
}

module wall() {
    for (i = [1:4]) translate([0, 0, (size + p) * i]) cube(size);
}