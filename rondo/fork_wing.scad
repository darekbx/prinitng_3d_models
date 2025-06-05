include <libs\threads.scad>
include <libs\cyl_head_bolt.scad>

$fn = 60;

height = 2;
radius = 10;
screws = 64;
screw_diameter = 5.8;
support_height = 10;

difference() {
    translate([-1, 0, 0]) {
        translate([1, 11, 0]) minkowski() {
            cube([12 - radius, 140 - radius, height]);
            cylinder(d = radius, h = 1);
        }
        translate([2, 12, 0]) {
            translate([0, 0, 0]) cylinder(d = 10, h = 7);
            translate([0, screws, 0]) cylinder(d = 10, h = 7);
            translate([0, screws * 2, 0]) cylinder(d = 10, h = 7);
        }
    }
    translate([1, 12, 1.9]) {
        translate([0, 0, 0]) scale([1.1, 1.1, 1.1]) fork_screw();
        translate([0, screws, 0]) scale([1.1, 1.1, 1.1]) fork_screw();
        translate([0, screws * 2, 0]) scale([1.1, 1.1, 1.1]) fork_screw();
    }
    
    
    translate([0, 22, -2]) {
        translate([0, 0, 0]) minkowski() {
            cube([2, 44, 10]);
            cylinder(d = 4, h = 1);
        }
        translate([0, 20 + 44, 0]) minkowski() {
            cube([2, 44, 10]);
            cylinder(d = 4, h = 1);
        }
    }
}

!fork_screw();
module fork_screw() {
	ds = _get_screw("M5x16");
	df = _get_screw_fam("M5x16");
	length      = ds[_NB_S_LENGTH];
	nlength		= ds[_NB_S_NOTHREAD_LENGTH];
	tlength     = length-nlength;
	lead		    = df[_NB_F_LEAD];
	orad        = df[_NB_F_OUTER_DIA]/2;
    
    difference() {
        translate([0, 0, 0]) {
            thread(orad, (tlength+lead)*0.75+4, lead);
            translate([0, 0, -2]) { 
                cylinder(d = 5.2, h = 10);
                translate([0, 0, 0]) cylinder(d = 8, h = 5);
            }
        }
        
        df = _get_screw_fam("M3x16");
        key_width = df[_NB_F_KEY];
        key_depth = df[_NB_F_KEY_DEPTH];
        translate([0, 0, 0]) key_slot(k=key_width, l=key_depth*3+e);
    }
}