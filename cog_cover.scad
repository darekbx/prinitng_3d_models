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
mount_t = 12;
mount_external_diameter = 42.4;
outer_diameter = 70;
collar_d = 37.5;
collar_bottom_d = 39;

parts = 6;
arm_t = 8;
arm_l = 22;

//translate([0, 10, 0])#cylinder(d=30,h=7);

difference() {
    intersection() {
        translate([0, 0, 0]) {
            mount(mount_t);
            cover();
        }
        mask();
    }

    translate([0, 0, -1]) difference() {
        cylinder(d = 100, h = 10);
        translate([0, 0, -1]) cylinder(d = 70, h = 12);
    }
}

teeth(7);


module teeth(thickness) {
    // Teeth
    teeth_t = 5;
    parts = 9;
    difference() {
        for(i = [0 : parts])
            rotate(i * 360 / parts)
                translate([nut_d / 2 - 3, -teeth_t / 2, 0]) 
                    cube([4, teeth_t, thickness]);

        translate([0, 0, -1]) cylinder(d = nut_d - 2, h = thickness + 2);
        //translate([0, 0, -1]) cylinder(d = collar_d, h = 6);
        //translate([0, 0, -0.1]) cylinder(d = collar_bottom_d, h = 1);
    }
}

module mount(thickness) {
    difference() {
        cylinder(d = mount_external_diameter, h = thickness);
        //translate([0, 0, -1]) cylinder(d = collar_d, h = 6);
        //translate([0, 0, -0.1]) cylinder(d = collar_bottom_d, h = 1);
    }
    
}

module cover() {
    angle_offset = -2;
    difference() {
        translate([0,0,0]){
        for(i = [0 : parts])
            rotate(angle_offset + i * 360 / parts)
                    translate([
                        mount_external_diameter / 2 - 8, 
                        arm_t, 
                        0
                    ]) {
                        cube([arm_l, arm_t, mount_t]);
                    }
        }
        translate([0, 0, -1]) cylinder(d = nut_d + 4.5, h = 10);
    }
}

module mask() {
    difference() {
        translate([0,0,0]) {
            cylinder(d = outer_diameter, h = 1);
            translate([0, 0, 1]) 
                cylinder(d1 = outer_diameter - 0, d2 = mount_t + mount_t + 18, h = mount_t/2);
        }
        translate([0, 0, -1]) cylinder(d = nut_d, h = 10);
    }
}