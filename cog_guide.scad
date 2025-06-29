$fn = $preview ? 180 : 360;

// d = diameter
// t = thickness
// l = length
//
// cog width: 1.6mm
// chain width: ~6mm
// spacer?: 2.5mm

spacer_t = 2.5;
nut_d = 34.8;
mount_t = 11;
mount_external_diameter = 42.4;
outer_diameter = 88;

parts = 6;
arm_t = 5;
arm_l = 22;

//!translate([0, 10, -spacer_t])#cylinder(d=30,h=10);
    
intersection() {
    translate([0, 0, 0]) {
        mount(mount_t);
        cover();
    }
    mask();
}

//!translate([0, 0, -spacer_t]) spacer();

module spacer() {
    mount(10);
}

module mount(thickness) {
    difference() {
        cylinder(d = mount_external_diameter, h = thickness);
        translate([0, 0, -1]) cylinder(d = nut_d, h = thickness + 2);
    }
    
    // Teeth
    teeth_t = 5;
    parts = 9;
    difference() {
        for(i = [0 : parts])
            rotate(i * 360 / parts)
                translate([nut_d / 2 - 3, -teeth_t / 2, 0]) 
                    cube([4, teeth_t, thickness]);
        translate([0, 0, -1]) cylinder(d = nut_d - 2, h = thickness + 2);
    }
}

module cover() {
    angle_offset = -2;
    for(i = [0 : parts])
       rotate(angle_offset + i * 360 / parts)
            translate([
                mount_external_diameter / 2 - 3, 
                arm_t, 
                0
            ]) {
                cube([arm_l, arm_t, mount_t]);
            }
       
    difference() {
        cylinder(d = outer_diameter, h = mount_t);
        translate([0, 0, -1]) cylinder(d = outer_diameter - 11, h = mount_t + 2);
    }
}

module mask() {
    difference() {
        translate([0,0,0]) {
            cylinder(d = outer_diameter, h = 2);
            translate([0, 0, 2]) 
                cylinder(d1 = outer_diameter, d2 = mount_t + mount_t + 20.4, h = mount_t/2);
        }
        translate([0, 0, -1]) cylinder(d = nut_d - 2, h = 10);
    }
}
