$fn = 90;

difference() {
    translate([0, 0, 0]) {
        collar();
        translate([0, 0, 4]) body();
    }
    //translate([0, 0, -1]) cube([50, 50, 64], false);
    
    // Rear mount
    translate([-15, 11.5, 51]) 
        rotate([0, 90, 0]) 
            scale([1.4, 1, 1]) 
                cylinder(d = 4, h = 30);
    translate([-15, 12, 50.1]) 
        rotate([0, 90, 0]) 
            scale([1, 1, 1]) 
                cylinder(d = 4, h = 30);
    translate([0, 14, 54]) rotate([30, 0, 0]) cube([30, 6, 2], true);
    translate([0, 16, 54]) cube([30, 4, 2], true);
}

module body() {
    difference() {
        cylinder(d = 33, h = 48);
        translate([0, 0, -1]) cylinder(d = 28, h = 60);
        translate([-30, 25, 23]) rotate([0, 90, 0]) cylinder(d = 33, h = 60);
    }
    
    // Cut off
    translate([0, 1, 3]) difference() {
        intersection() {
            cylinder(d = 31, h = 48);
            translate([-30, 22, 20]) rotate([0, 90, 0]) cylinder(d = 33, h = 60);
        }
        translate([-30, 24, 20]) rotate([0, 90, 0]) cylinder(d = 33, h = 60);
        translate([0, 0.7, 10]) rotate([0, 0, 0]) cube([30, 10, 40], true);
    }
    
    // Rails
    translate([12, 1, 14]) {
        cube([2, 1, 33]);
        translate([0, 2.1, 0]) cube([2, 1, 33]);
    }
    translate([-14, 1, 14]) {
        cube([2, 1, 33]);
        translate([0, 2.1, 0]) cube([2, 1, 33]);
    }
    
    // Bottom
    translate([0, 0, 47]) {
        difference() {
            cylinder(d = 33, h = 1);
            translate([0, 0, -0.1]) cylinder(d = 11, h = 2);
            translate([0, -7, -1.1]) cylinder(d = 2.5, h = 5);
            translate([0, -5.7, 0.1]) cube([0.8, 4, 2], true);
            translate([0, 4, 0.1]) cube([9, 4, 2], true);
        }
    }
    
    // Bottom sphere
    bottom_sphere();

    // Screw mounts
    difference() {
        translate([0, 0, 0]) {
            translate([0, 10, 4]) screw_mount(l = 16, d = 4.5);
            translate([-4.5, -11, 7]) screw_mount(l = 41);
            translate([4.5, -11, 7]) screw_mount(l = 41);
            translate([-1, 12, 4]) cube([2, 2, 7]); 
        }
        
        translate([-30, 23, 23]) rotate([0, 90, 0]) cylinder(d = 32, h = 60);
    }
    
    // Inner fill
    translate([0, 0, 42]) difference() {
        cylinder(d = 28, h = 5);
        translate([0, -2.7, 10]) cube([30, 22, 22], true);
    }
}

module bottom_sphere() {
    translate([0, 0, 48]) difference() {
        scale([1, 1, 0.65]) sphere(d = 33);
        translate([0, 0, -20]) cylinder(d = 34, h = 20);
        translate([0, 0, -1.1]) cylinder(d = 16.6, h = 9);
        translate([0, 0, 7.5]) cylinder(d = 34, h = 20);
        
        translate([0, 0, 6.5]) rotate([-45, 0, 0]) cylinder(d = 14, h = 20);
    }
}

// offset 4mm
module screw_mount(d = 5, l = 8) {
    difference() {
        cylinder(d = d, h = l);
        translate([0, 0, -0.1]) cylinder(d = 2.5, h = 12);
    }
}

module collar() {
    difference() {
        cylinder(d = 31, h = 4);
        translate([0, 0, -1]) cylinder(d = 28, h = 6);
    }
}