$fn = 90;

cut_off = false;
screw_check = false;
screw_thread_d = 2.8;
screw_collar_d = 3.6;
t_scale = 0.96;

//!design();
//!scale([t_scale, t_scale, t_scale]) text_letters();
trophy();

// Logo parts
//!translate([size, size * 3, size * 6]) rotate([0, 180, -90]) logo_top();
//translate([0, 0, 0]) logo_bottom();

module trophy() {
    translate([0, 0, 10]) difference() {
        translate([-28, -20, -60]) {
            base_mirror();
        }
        translate([-8, 10, -67]) cylinder(d = 28, h = 30);
        #translate([-8, 10, -61.8]) cylinder(d = 37, h = 7);
        translate([-8, 10, -55]) screw_weight();
        translate([-8 - 7, 10, -40]) cylinder(d = screw_collar_d, h = 10);
        translate([-8 + 7, 10, -40]) cylinder(d = screw_collar_d, h = 10);
    }
    
    color([0.3,0.3,0.3]) difference() {
        translate([-8, 10, -24]) {
            cylinder(d1 = 22, d2 = 12, h = 36);
        }
        
        translate([-8, 10, -29.5]) cylinder(d1 = 6, d2 = 5, h = 30);
        translate([-8, 10, -29]) cylinder(d = screw_thread_d, h = 40);
        
        translate([-8 - 7, 10, -26]) cylinder(d = screw_thread_d, h = 10);
        translate([-8 + 7, 10, -26]) cylinder(d = screw_thread_d, h = 10);
        
        // Logo cut-off
        translate([-0.75, -1, 1]) rotate([10, -10, 45]) difference() {
            design();
            if (cut_off) translate([-5, 0, 0]) cube([10, 200, 100]);
        }
        
        translate([-8, 10, 9.5]) cylinder(d = 20, h = 10);
    }
   
    translate([-0.5, -1, 0]) difference() {
        rotate([10, -10, 45]) difference() {
            color([1,1,1]) design();
            if (cut_off) translate([-5, 0, 0]) cube([10, 200, 100]);
        }
        translate([-7.5, 11, -28]) cylinder(d = screw_collar_d - 0.8, h = 40);
    }
}

module screw_weight() {
    cylinder(d = 36.3, h = 18, $fn = 6);
}

module base_mirror() {
    difference() {
        import("C:/Users/darek/Downloads/trophybase2.stl");
        translate([-10, -10, -2]) cube([60, 40, 50]);
    }
    translate([0, 60, 0]) mirror([0, 1, 0]) difference() {
        import("C:/Users/darek/Downloads/trophybase2.stl");
        translate([-10, -10, -2]) cube([60, 40, 50]);
    }
}

module logo() {
    if ($preview) {
        rotate([10, -10, 45]) difference() {
            design();
            if (cut_off) translate([-5, 0, 0]) cube([10, 200, 100]);
        }
    } else {
        difference() {
            placement();
            if (screw_check) {
                translate([8, -11, -20]) cube([59, 59, 100]);
            }
        }
    }
}

size = 10;
sHeight = 10;
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
    translate([0, 0, (sHeight + p) * 4]) base();
    translate([0, (size + p) * 4, 0]) wall();
    translate([(size + p) * 3, (size + p), 0]) wall();
    center();
}

module base_with_bolts(d, offset) {

    //translate([0, 0, 10]) base_with_bolts_and_text(d, offset);
    difference() {
        base_with_bolts_bottom(d, offset);
        
        translate([0, 0, 0]) {
            #napis();
        }
    }
}

module base_with_bolts_bottom(d, offset) {
    difference() {
        base(); 
        /*translate([size/2, (size + p) * 5 - size / 2, (size + p) - offset - 10.1]) {
            cylinder(d = bolt_head, h = 8);
            cylinder(d = bolt + 0.5, h = 20);
        }
        translate([(size + p) * 4 - size/2, (size + p)+size/2, (size + p) - offset - 10.1]) {
            cylinder(d = bolt_head, h = 8);
            cylinder(d = bolt + 0.5, h = 20);
        }*/
    }
}

module base_with_bolts_and_text(d, offset) {
    difference() {
        scale([1, 1, 0.5]) base(); 
        translate([size/2, (size + p) * 5 - size / 2, (size + p) - offset - 14]) {
            cylinder(d = bolt_head, h = 8);
            cylinder(d = bolt + 0.5, h = 20);
        }
        translate([(size + p) * 4 - size/2, (size + p)+size/2, (size + p) - offset - 14]) {
            cylinder(d = bolt_head, h = 8);
            cylinder(d = bolt + 0.5, h = 20);
        }
        //translate([0, 0, -5]) napis();
        
        translate([2, 41, size - 0.9 - 12.99]) 
            rotate([0, 0, -90]) {
                cube([25, 6, 8]);
            }
        translate([8, 12.15, size - 0.9]) {
        
        }
    }
}

module napis() {
    translate([2.75, 38.5, size - 0.9]) 
        rotate([0, 0, -90]) 
            linear_extrude(height = 1) 
                text("MBOX", font = "Liberation Sans:style=Bold", size = 5);
    translate([8, 12.75, size - 0.9]) 
        linear_extrude(height = 1) 
            text("HERO", font = "Liberation Sans:style=Bold", size = 5);
}

module text_letters() {
    translate([2.15, 41, size - 0.9]) 
        rotate([0, 0, -90]) 
            linear_extrude(height = 1) 
                text("MBOX", font = "Liberation Sans:style=Bold", size = 6);
    translate([8, 12.15, size - 0.9]) 
        linear_extrude(height = 1) 
            text("HERO", font = "Liberation Sans:style=Bold", size = 6);
}

module bolt() {
    cylinder(d = 6, h = 10);
}

module center() {
    for (i = [3:4]) translate([0, (size + p), (sHeight + p) * i]) cube([size, size, sHeight]);
    for (i = [3:4]) translate([0, (size + p), (sHeight + p) * i - 5]) cube([size, size, sHeight * 1.5]);
}

module base() {
    for (i = [1:4]) translate([0, (size + p) * i, 0]) cube([size, size, sHeight]);
    for (i = [1:3]) translate([(size + p) * i, size + p, 0]) cube([size, size, sHeight]);
}

module wall() {
    for (i = [1:3]) translate([0, 0, (sHeight + p) * i]) cube([size, size, sHeight]);
}