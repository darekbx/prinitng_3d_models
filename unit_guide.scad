include <libs/cyl_head_bolt.scad>

$fn = 90;

bb_d = 39;
bb_d_2 = 44.6;
cog_d = 136;
chain_w = 9;
clamp_w = 11;
offset = 12;

rotate([0, 0, 90]) {
    //translate([0, 0, -15]) rotate([0, 0, -90]) #frame();
    clamp();
    translate([0, 25, 2]) arm();
}

translate([-70, 25, -6]) guide_plate_back();
translate([-70, 25, -25]) guide_plate_front();


module arm() {

    difference() {
        minkowski() {
            linear_extrude(height=6)
            polygon(points=[
                [-3, 15], [-13, -8], [14, -8], [5, 15], [13, 50], [11, 50]
            ]);
            {
                cylinder(d = 10);
                sphere(r = 2);
            }
        }
        translate([0, -50/2, -4]) {
            cylinder(d = bb_d_2 + 8, h = 14);
        }
        translate([1.5, 13, 0]) scale([0.45, 0.52, 1.5]) minkowski() {
            linear_extrude(height=5)
            polygon(points=[
                [-3, 15], [-13, -8], [11, -8], [5, 8], [17, 50], [14, 50]
            ]);
            {
                cylinder(d = 10);
                sphere(r = 2);
            }
        }
        translate([12, 50, -15]) cylinder(d = 5.3, h = 30);
        translate([12, 50, 9]) nutcatch_parallel("M5", clh=0.1);
    }
    
    if (false) {
        color("Violet") translate([-3, 15, 0]) cube([1, 1, 20]);
        color("Blue") translate([-13, -8, 0]) cube([1, 1, 20]);
        color("Green") translate([14, -8, 0]) cube([1, 1, 20]);
        color("Black") translate([5, 15, 0]) cube([1, 1, 20]);
        color("Yellow") translate([13, 50, 0]) cube([1, 1, 20]);
        color("Red") translate([11, 50, 0]) cube([1, 1, 20]);
    }
}

module clamp() {
    intersection() {
        difference() {
            cylinder(d = bb_d + 21, h = clamp_w);
            translate([0, 0, -1]) cylinder(d = bb_d, h = clamp_w + 2);
            translate([0, 0, -0.1]) cylinder(d = bb_d_2 + 0.8, h = 4);
            translate([-50, -0.2, -1]) cube([100, 0.4, 12]);
            
            translate([bb_d / 2 + 6, -9, 5.5]) clampScrew();
            translate([-bb_d / 2 - 6, -9, 5.5]) mirror([1, 0, 0]) clampScrew();
            
        }
        translate([0, 0, 5.5]) 
            rotate_extrude(convexity = 20, $fn = 90)
                translate([24, 0, 0])
                    circle(r = 7, $fn = 100);
    }
}

module clampScrew() {
    rotate([0, 90, 90]) {
        cylinder(d = 5.2, h = 30);
        translate([0, 0, -15]) cylinder(d = 9, h = 20);
        translate([0, 0, 13]) cylinder(d = 9, h = 20, $fn = 6);
        //translate([0, -4.5, 13]) rotate([0, 0, 45]) cylinder(d = 12.7, h = 20, $fn = 4);
        //translate([0, -4.5, -15]) rotate([0, 0, 45]) cylinder(d = 12.7, h = 20, $fn = 4);
    }
}

module frame() {
    difference() {
        cylinder(d = bb_d, h = 80);
        translate([0, 0, -3]) cylinder(d = bb_d + 2, h = 8);
    }
    translate([0, 0, chain_w]) cylinder(d = bb_d + 4, h = offset);
    difference() {
        cylinder(d = cog_d, h = chain_w);
        // Cut off
        parts = 10;
        translate([0, 0, -1]) 
            for(i = [0 : parts])
               rotate(-1 + i * 360 / parts)
                    translate([55 / 2 - 3, -5, 0]) {
                        cube([32, 12, 11]);
                    }
        translate([0, 0, -3]) cylinder(d = cog_d - 20, h = 6);
        translate([0, 0, 6]) cylinder(d = cog_d - 20, h = 6);
    }
    
    translate([-cog_d / 2, 0, 0]) cube([chain_w, 100, chain_w]);
}




/**
* Chain guide
*/

gpoints = [
    [-5, 15], // violet
    [-5, -15],   // blue
    [5, -5],  // green
    [17, 25], // black
    [17, 35]  // yellow
];

module guide_plate_back() {
    
    difference() {
        scale([1, 1, 0.8]) minkowski() {
            linear_extrude(height=0.1)
            polygon(points=gpoints);
            {
                cylinder(d = 10);
                sphere(r = 2);
            }
        }
        translate([-4, 15, -2]) rotate([0, 0, -48]) scale([1.1, 1.0, 2]) cut();
        translate([-4, 2, -2]) rotate([0, 0, -48]) scale([1.1, 1.0, 2]) cut();
        
        translate([-5, -13, -15]) cylinder(d = 5.3, h = 30);
        translate([17, 35, 4]) nutcatch_parallel("M5", clh=0.1);
        translate([17, 35, -15]) cylinder(d = 5.3, h = 30);
    }
    
    translate([-5, -13, -12.5]) { 
        difference() {
            cylinder(d = 9, h = 11);
            translate([0, 0, -1])cylinder(d = 5.3, h = 30);
        }
    }
    
    translate([17, 35, -12.5]) { 
        difference() {
            cylinder(d = 9, h = 11);
            translate([0, 0, -1])cylinder(d = 5.3, h = 30);
        }
    }

    if (false) {
        color("Violet") translate([gpoints[0][0], gpoints[0][1], -10]) cube([1, 1, 20]);
        color("Blue") translate([gpoints[1][0], gpoints[1][1], -10]) cube([1, 1, 20]);
        color("Green") translate([gpoints[2][0], gpoints[2][1], -10]) cube([1, 1, 20]);
        color("Black") translate([gpoints[3][0], gpoints[3][1], -10]) cube([1, 1, 20]);
        color("Yellow") translate([gpoints[4][0], gpoints[4][1], -10]) cube([1, 1, 20]);
        //color("Red") translate([points[5][0], points[5][1], -10]) cube([1, 1, 20]);
    }
}


module guide_plate_front() {
    
    difference() {
        scale([1, 1, 0.8]) minkowski() {
            linear_extrude(height=0.1)
            polygon(points=gpoints);
            {
                cylinder(d = 10);
                sphere(r = 2);
            }
        }
        translate([-4, 15, -2]) rotate([0, 0, -48]) scale([1.1, 1.0, 2]) cut();
        translate([-4, 2, -2]) rotate([0, 0, -48]) scale([1.1, 1.0, 2]) cut();
        
        translate([-5, -13, -15]) cylinder(d = 5.3, h = 30);
        translate([17, 35, -15]) cylinder(d = 5.3, h = 30);
        
        translate([-5, -13, -3.4]) cylinder(d = 9, h = 5);
        translate([17, 35, -3.4]) cylinder(d = 9, h = 5);
    }
   
}

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
    difference() {
        translate([0, 0, 0]) {
            basePlate();
        }
        translate([30.5, 23, 1.5]) scale([1.05, 1.05, 1]) spacer();
        translate([34, 26.5, 8]) bolt();
        //translate([30.5 + 0.1, 23 + 0.1, -10.5]) spacer();
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
