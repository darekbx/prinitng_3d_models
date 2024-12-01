$fn = $preview ? 40 : 90;

speaker_diameter = 71;
width = 90;
height = 150;
depth = 60;

difference() {
    translate([0, 0, 0]) {
        //translate([0, 0, 77.1]) mirror([0, 0, 1]) front_case();
        back_case();
    }
    //translate([-51, 100, -5]) cube([100, 100, 100]);
    //translate([-5, -30, -5]) cube([100, 140, 100]);
}

//board();

module back_case() {
    difference() {
        minkowski() {
            translate([4, 4, 0]) 
                cube([width - 8, height - 8, depth - 1]);
            cylinder(d = 8);
        }
        
        translate([3, 3, 3])  minkowski() {
            translate([4, 4, 0]) 
                cube([width - 8 - 6, height - 8 - 6, depth - 1]);
            cylinder(d = 8);
        }
    
        translate([0, 0, depth - 1]) difference() {
            minkowski() {
                translate([4, 4, 0]) 
                    cube([width - 8, height - 8, 1.5]);
                cylinder(d = 8);
            }
            
            translate([2.3, 2.3, -0.5])  minkowski() {
                translate([4, 4, 0]) 
                    cube([width - 8 - 4.6, height - 8 - 4.6, 3]);
                cylinder(d = 8);
            }
        }
        
        translate([width / 2, height - 40, -1]) 
            cylinder(d = 40, h = 10);
        
        translate([width / 2, height - 8, -1]) 
            cylinder(d = 4, h = 10);
    }
    
    translate([width / 2, height - 40, 0]) {
        difference() {
            cylinder(d1 = 42, d2 = 28, h = 30);
            translate([0, 0, -1])
                cylinder(d1 = 32, d2 = 22, h = 32);
        }
    }
    
    translate([7, 7, 1]) back_mount ();
    translate([width - 7, height -7, 1]) back_mount();
    translate([7, height - 7, 1]) back_mount();
    translate([width - 7, 7, 1]) back_mount();
}

module front_case() {
    difference() {
        minkowski() {
            translate([4, 4, 0]) 
                cube([width - 8, height - 8, 8 - 1]);
            cylinder(d = 8);
        }
        
        translate([3, 3, 4])  minkowski() {
            translate([4, 4, 0]) 
                cube([width - 8 - 6, height - 8 - 6, 6 - 1]);
            cylinder(d = 8);
        }
        
        translate([2, 2, 6])  minkowski() {
            translate([4, 4, 0]) 
                cube([width - 8 - 4, height - 8 - 4, 6 - 1]);
            cylinder(d = 8);
        }
        
        translate([width / 2, width / 2, 3]) 
            cylinder(d = speaker_diameter + 6.5, h = 10);
        translate([width / 2, width / 2, -1]) 
            cylinder(d = speaker_diameter, h = 10);
        translate([width / 2, width / 2, -38]) 
            sphere(d = speaker_diameter * 1.5);
    
        translate([7, 7, -1]) case_hole();
        translate([width - 7, height -7, -1]) case_hole();
        translate([7, height - 7, -1]) case_hole();
        translate([width - 7, 7, -1]) case_hole();
    }
    
    translate([15, 15, 3]) screw_mount();
    translate([speaker_diameter + 4, speaker_diameter + 4, 3]) screw_mount();
    
    translate([speaker_diameter + 4, 15, 3]) screw_mount();
    translate([15, speaker_diameter + 4, 3]) screw_mount();
}

module screw_mount() {
    difference() {
        cylinder(d = 7, h = 11);
        translate([0, 0, 4]) cylinder(d = 3, h = 8);
    }
}

module case_hole() {
    cylinder(d = 3, h = 10);
    translate([0, 0, 0.9]) cylinder(d = 6.5, h = 2);
}

module back_mount() {
    difference() {
        cylinder(d = 8, h = 59);
        translate([0, 0, 43]) cylinder(d = 2.8, h = 18);
    }
}

module board() {
    translate([40/2, width, 8]) #cube([52, 52, 10]);
}