include <libs\threads.scad>
include <libs\cyl_head_bolt.scad>

$fn = $preview ? 15 : 60;

diameter = 9.5;
thickness = 1.5;
bolt_diameter = 4.7;
bolt_height = 7;

//cone(6);
//plug();
fork_screw();

module plug() {
    cylinder(d1 = diameter - 1, d2 = diameter, h = thickness);
    translate([0, 0, thickness]) metric_thread(diameter=bolt_diameter, pitch=1, length=bolt_height);
}

module cone(height) {
    translate([0, 0, -1]) cylinder(d1 = 4, d2 = diameter, h = height);
    translate([0, 0, height - 1]) cylinder(d1 = diameter, d2 = diameter, h = 1);
    translate([0, 0, height]) metric_thread(diameter=bolt_diameter, pitch=1, length=bolt_height);
}

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
            thread(orad, (tlength+lead)*0.75, lead);
            translate([0, 0, -2]) { 
                cylinder(d = 5.2, h = 6);
                translate([0, 0, 0]) cylinder(d = 9, h = 3);
            }
        }
        
        df = _get_screw_fam("M3x16");
        key_width = df[_NB_F_KEY];
        key_depth = df[_NB_F_KEY_DEPTH];
        translate([0, 0, 0]) key_slot(k=key_width, l=key_depth*3+e);
    }
}
