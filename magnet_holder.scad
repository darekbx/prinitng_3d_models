include <rondo/libs/cyl_head_bolt.scad>

$fn = 90;

//walls();

difference() {
    all();
    //translate([0, -30, 10]) cube([200, 140, 80], true);
}

module all() {
    base();
    support();


    difference() {
        adjust();
        translate([0, 0, -3.5]) cube([200, 200, 3], true);
    }
}

module walls() {
    translate([0, 50, 20]) rotate([70, 0, 0]) wall();
    translate([0, -50, 20]) rotate([-70, 0, 0]) wall();

    translate([63, 0, 20]) 
        rotate([0, 0, 90]) 
            rotate([-70, 0, 0]) 
                wall();

    translate([-63, 0, 20]) 
        rotate([0, 0, 90]) 
            rotate([70, 0, 0]) 
                wall();
}

module adjust(){
    
    translate([0, 50, 10]) moving_mount();
    translate([0, -50, 10]) mirror([0, 1, 0]) moving_mount();

    translate([63, 0, 10]) rotate([0, 0, -90]) moving_mount();
    translate([-63, 0, 10]) 
        rotate([0, 0, -90]) 
            mirror([0, 1, 0]) moving_mount();
}
            
module support() {
    cube([140, 20, 4], true);
    cube([20, 115, 4], true);
}

module moving_mount() {
    translate([0, 9, 10]) rotate([70, 0, 0]) {
        difference() {
            cube([16, 48, 12], true);
            translate([0, -6, 2]) cube([10.5, 53, 14], true);
            translate([0, 25, 1.5]) 
                rotate([90, 0, 0]) 
                    cylinder(d = 3.4, h = 40);
            /*translate([0, 20, 4])
                rotate([90, 0, 0]) 
                    cube([6, 12, 2.3], true);*/
        }
    }
}
            
module base() {
    difference() {
        cube([90, 65, 4], true);
        top = -1.5;
        
        translate([90 / 2 - 5 - 2, 65 / 2 - 5 - 2, top]) 
            cylinder(d = 10.1, h = 4);
        translate([90 / 2 - 5 - 2, -62 / 2 + 5 + 2, top]) 
            cylinder(d = 10.1, h = 4);
        
        translate([-90 / 2 + 5 + 2, 65 / 2 - 5 - 2, top]) 
            cylinder(d = 10.1, h = 4);
        translate([-90 / 2 + 5 + 2, -62 / 2 + 5 + 2, top]) 
            cylinder(d = 10.1, h = 4);
    }
}

module wall() {
    difference() {
        cube([40, 20, 4], true);
        top = -1.5;
        
        translate([-8, 0, top]) 
            cylinder(d = 10.1, h = 4);
        translate([8, 0, top]) 
            cylinder(d = 10.1, h = 4);
    }
    difference() {
        translate([0, 0, -7]) cube([10, 10, 10], true);
        translate([0, 6, -7]) 
            rotate([90, 0, 0]) 
                cylinder(d = 3.4, h = 12);
        translate([0, 0, -8])
            rotate([90, 0, 0]) 
                cube([6, 12, 2.5], true);
    }
}
