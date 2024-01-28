include <libs/cyl_head_bolt.scad>

$fn = 60;

/*
-1 - show all
 0 - frame mount
 1 - back plate
 2 - front plate
*/
show_part = 0; 

mount_to_tube_position = 100;

bolt_collar = 11;
bolt_collar_height = 3;
hole_diameter = 5;
hole_outer_diameter = 11; 
hole_outer_depth = 1.4;
bolts_distance = 11 + hole_diameter; // Distance between two bolts

mount_angle = 28;
mount_height = 32;
mount_width = 17;
mount_thickness = 5;
frame_tube_diameter = 32.5;

    !difference() {
        translate([0, 0, 0]) {
            mountBase();
            //guideHandle();
        }
        tube();
    }

if (show_part == -1 || show_part == 0) {
    difference() {
        translate([0, 0, 0]) {
            mountBase();
            guideHandle();
        }
        tube();
    }
}

translate([60, 22.09, 139.6]) {
    rotate([270, 0, -90]) {
        if (show_part == -1 || show_part == 2) plateFront();
        if (show_part == -1 || show_part == 1) translate([0, 0, -18]) plateBack(); 
        if (show_part == -1 || show_part == 0) translate([0, 0, -30]) frameMount();
    }
}

module guideHandle() {
    rotate([90, 90, 0]) {
        translate([
            -mount_to_tube_position - mount_height / 4, 
            mount_width - 8, 
            mount_to_tube_position - 92
        ]) {
            minkowski() {
                cube([5, 28, 6]);
                sphere(r = 1);
            }
        }
        
        translate([
            -mount_to_tube_position + 17.3, 
            mount_width - 8.2, 
            mount_to_tube_position - 92
        ]) {
            rotate([0, 0, 44]) {
                minkowski() {
                    cube([5, 34, 6]);
                    sphere(r = 1);
                }
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
        translate([0, 0, mount_to_tube_position - 0.5]) {
            cylinder(d = hole_outer_diameter, h = hole_outer_depth * 2 + 1);
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

/**
* Chain guide
*/

module frameMount() {
    difference() {
        translate([30.5 + 0.1, 23 + 0.1, 0]) {
            minkowski() {
                cube([7, 7, 8]);
                cylinder(d = 3);
            }
        }
        translate([34, 26.5, 4]) nutcatch_parallel("M5", clh=0.1);
        translate([34, 26.5, 14]) bolt();
    }
}

module plateFront() {
    difference() {
        translate([0, 0, 0]) {
            basePlate();
            translate([30.5 + 0.1, 23 + 0.1, -12]) spacer(w = 12);
        }
        translate([34, 26.5, -2]) bolt();
    }
}

module plateBack() {
    !difference() {
        translate([0, 0, 0]) {
            basePlate();
        }
        translate([30.5, 23, 1.5]) scale([1.05, 1.05, 1]) spacer();
        translate([34, 26.5, 8]) bolt();
        translate([30.5 + 0.1, 23 + 0.1, -10.5]) spacer();
    } 
}

module basePlate() {
    scale([0.5, 0.5, 0.5]) difference() {
        base();
        translate([5, 3.4, -2]) rotate([0, 0, -27]) scale([1.2, 1.3, 2]) cut();
        translate([25, 4.1, -2]) rotate([0, 0, -27]) scale([1.2, 1.6, 2]) cut();
        translate([45, 4.1, -2]) rotate([0, 0, -27]) scale([1.2, 1.6, 2]) cut();
    }
}

module bolt() {
    cylinder(d = 9, h = 5);
    translate([0, 0, -18]) cylinder(d = 5.3, h = 20);
}

module spacer(w = 10) {
    minkowski() {
        cube([7, 7, w]);
        cylinder(d = 3);
    }
}

module cut() {
    minkowski() {
        cube([0.1, 20, 5]);
        cylinder(d = 6);
    }
}

module base() {
    minkowski() {
        linear_extrude(height=3)
        polygon(points=[[-5, 20], [0, 0], [50, 0], [80, 60],[60, 60]]);
        {
            cylinder(d = 15);
            sphere(r = 2);
        }
    }
}
