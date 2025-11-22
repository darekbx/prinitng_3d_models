$fn = 180;


spacer_t = 2.5;
nut_d = 34.8;
mount_t = 11;
mount_external_diameter = 42.4;
outer_diameter = 88;

parts = 6;
arm_t = 5;
arm_l = 22;
thickness=2;

cog(16, 65);

module cog(teeth, base_d) {

    difference() {
        cylinder(d = base_d, h = 2);
        translate([0, 0, -1]) cylinder(d = nut_d, h = 4);
        for (a = [0: (teeth - 1)]) {
            rotate(a * 360 / teeth) {
                translate([0, base_d / 2, -1]) {
                    cylinder(d = 8, h = 10);
                }
            }
        }
    }
    
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