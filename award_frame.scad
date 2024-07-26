$fn = 180;

thickness = 6;
width = 98 + 1;
height = 148 + 1;

two();

module two() {
    difference() {
        translate([0, 0, 0]) {
            d = 8;
            h = 9;
            /*translate([0, 0, -(h - thickness) / 2]) {
                cube([width, 1, 2]);
                cube([1, height, 2]);
                translate([0, height, 0]) cube([width, 1, 2]);
                translate([width, 0, 0]) cube([1, height, 2]);
                
                rotate([0, 0, 56]) 
                    cube([width + width * 0.8, 1, 2]);
                translate([0, height, 0]) 
                    rotate([0, 0, -56.5]) 
                        cube([width + width * 0.8, 1, 2]);
            }*/
            difference() {
                translate([0, 0, -2.1]) minkowski() {
                    cube([width, height + 0.9, thickness + 3]);
                    cylinder(d = 5);
                }
                translate([0, 0, -5.1]) cube([width, height, thickness + 1.5]);
                translate([1.7, 1.7, 2.1]) 
                    cube([width - 3, height - 3, thickness + 0.5]);
                    translate([0, 0, 0.25]) 
                        cube([width, height + 5, thickness + 0]);
            }
        }
        translate([0, 0, -0.1]) cube([width, height + 10, thickness]);
    }
    
    h = 9;
    translate([-1, 0, -(h - thickness) / 2 - 0.6]) {
        translate([9, 8, 0]) cylinder(d = 20, h = 2);
        translate([width - 8, 8, 0]) cylinder(d = 20, h = 2);
        translate([9, height - 7, 0]) cylinder(d = 20, h = 2);
        translate([width - 8, height - 7, 0]) cylinder(d = 20, h = 2);
        
        
        for ( i = [0 : 3] ){
            hf = height / 3;
            translate([0, hf * i, 0]) cube([width, 2, 2]);
        }
        
        for ( i = [0 : 3] ){
            wf = width / 3;
            translate([wf *i, 0, 0]) cube([2, height, 2]);
        }
        
        rotate([0, 0, 56]) 
            cube([width + width * 0.82, 2, 2]);
        translate([0, height, 0]) 
            rotate([0, 0, -56.5]) 
                cube([width + width * 0.8, 2, 2]);
    }

}