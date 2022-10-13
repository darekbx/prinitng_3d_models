$fn = 60;

mount_to_tube_position = 100;

bolt_collar = 11;
bolt_collar_height = 3;
hole_diameter = 5;
hole_outer_diameter = 11; 
hole_outer_depth = 1.4;
bolts_distance = 11 + hole_diameter; // Distance between two bolts

mount_angle = 25;
mount_height = 32;
mount_width = 17;
mount_thickness = 4.5;
frame_tube_diameter = 32.5;

difference() {
    translate([0, 0, 0]) {
        mountBase();
        guideHandle();
    }
    tube();
}

module guideHandle() {
    rotate([90, 90, 0]) {
        translate([
            -mount_to_tube_position - mount_height / 4, 
            mount_width - 8, 
            mount_to_tube_position - 90
        ]) {
            minkowski() {
                cube([5, 35, 4]);
                sphere(r = 1);
            }
        }
    }
}

module mountBase_() {
    rotate([90 - mount_angle, 90, 0]) {
        translate([
            -mount_to_tube_position - mount_height / 4, 
            -mount_width / 2, 
            mount_to_tube_position - 86
        ]) {
            minkowski() {
                cube([mount_height, mount_width, mount_thickness]);
                sphere(r = 1);
            }
        }
    }
}

module mountBase() {
    rotate([90 - mount_angle, 90, 0]) {
        translate([
            -mount_to_tube_position - mount_height / 4 + 6, 
            -mount_width / 2 + 6, 
            mount_to_tube_position - 86
        ]) {
            minkowski() {
                cube([mount_height - 12, mount_width - 12, mount_thickness - 1]);
                {
                    cylinder(d = 12);
                    sphere(r = 1);
                }
            }
        }
    }
}

module tube() {
    cylinder(d = 32, h = 200);
    
    rotate([90 - mount_angle, 90, 0]) {
        translate([-mount_to_tube_position, 0, -85]) {
            mountCollar();
            translate([bolts_distance, 0, 0]) mountCollar();
            
            collarHole();
            translate([bolts_distance, 0, 0]) collarHole();
            
            diameterCollar();
            translate([bolts_distance, 0, 0]) diameterCollar();
        }
    }
    
    module mountCollar() {
        translate([0, 0, mount_to_tube_position]) {
            cylinder(d = hole_outer_diameter, h = hole_outer_depth * 2);
        }
    }
    module collarHole() {
        translate([0, 0, mount_to_tube_position]) {
            cylinder(d = hole_outer_diameter / 2, h = 10);
        }
    }
    module diameterCollar() {
        translate([0, 0, mount_to_tube_position + 2]) {
            cylinder(d1 = hole_diameter, d2 = bolt_collar, h = bolt_collar_height);
        }
    }
}
