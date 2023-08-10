$fn = 90;

width = 70;
depth_correctness = -1;

external_diameter = 16.5;
entry_diameter = 14.4;
inside_diameter = 13.5;
end_diameter = 9.1;
back_depth = 29.2 - depth_correctness;
back_depth_full = 42 - depth_correctness;
entry_deepth = 7;
thin_inner_diameter = 3;
front_diameter = 13.4;

milk_tube_inner_diameter = 7;
milk_tube_diameter = 9.8;
milk_tube_position = 38.5 + depth_correctness;


rotate([0, 90, 0]) {
    difference() {
        frother();
        //translate([-20, -20, 29]) cube([50, 40, 80]);
        //translate([-53, -20, -2]) cube([50, 40, 80]);
        //translate([3, -20, -4]) cube([50, 40, 80]);
    }
    
    //translate([0, 0, 9]) machinePart();
}

module machinePart() {
    cylinder(h = 14, d = 12.5);
    translate([0, 0, 13]) cylinder(h = 13, d = 9);
}

module frother() {
    difference() {
        cylinder(d = external_diameter, h = width);
        
        // Entry cut
        translate([-10, -5.5, -1]) cube([20, 11, entry_deepth + 1]);
        
        // Entry 
        translate([0, 0, -1]) cylinder(d = entry_diameter, h = entry_deepth + 1);
        translate([0, 0, entry_deepth - 0.1]) cylinder(d1 = entry_diameter, d2 = inside_diameter, h = 2);
        
        // Inside
        translate([0, 0, -1]) cylinder(d = inside_diameter, h = back_depth + 1);
        translate([0, 0, back_depth - 0.1]) cylinder(d1 = inside_diameter, d2 = end_diameter, h = 3);
        
        translate([0, 0, -1]) cylinder(d = end_diameter, h = back_depth_full + 1);        
        translate([0, 0, -1]) cylinder(d = thin_inner_diameter, h = 100);    
        translate([0, 0, 41.5 - depth_correctness]) cylinder(d2 = thin_inner_diameter, d1 = thin_inner_diameter + 2, h = 2);
        
        // Milk tube hole
        translate([21, 0, milk_tube_position]) { 
            rotate([0, -90, 0]) translate([0, 0, -1]) cylinder(d = milk_tube_inner_diameter, h = 22);
        }
        
        // Milk tube
        translate([21, 0, milk_tube_position]) milkTubeHole();
        
        // Front
        translate([0, 0, 50 - depth_correctness]) cylinder(d = front_diameter, h = back_depth_full + 2);
        translate([0, 0, 45.5 - depth_correctness]) cylinder(d1 = thin_inner_diameter, d2 = thin_inner_diameter + 2, h = 2); 
        translate([0, 0, 47.1 - depth_correctness]) cylinder(d2 = front_diameter, d1 = end_diameter, h = 3);
    }
    
    // Milk tube
    translate([15.5, 0, milk_tube_position]) milkTube();
    
    // Exit tube
    //translate([40, 13, 70]) exitTube();
    
    translate([-12.5, -2, 4]) switchClicker();
}

module switchClicker() {
    intersection() {
        difference() {
            cube([5, 4, 12]);
            translate([-4, -0.5, 0]) rotate([0, 50, 0]) cube([5, 5, 5]);
            translate([-5, -0.5, 7]) rotate([0, 50, 0]) cube([5, 5, 5]);
            translate([-3, -0.5, 5.25]) cube([5, 5, 3]);
        }
        translate([1.5, 2, 0]) { 
            translate([0.5, 0, 0]) difference() {
                cylinder(r = 2, h = 20);
                translate([0, -2.5, -5]) cube([2, 5, 110]);
            }
            translate([0, -2.5, 3]) cube([3, 5, 110]);
            intersection() {
                translate([0, -2.5, -2]) cube([3, 5, 110]);
                translate([0.5, 0, -2]) cylinder(r = 2, h = 5);
            }
        }
    }
}

module exitTube() {
    rotate([0, -90, 30]) {
        difference() {
            cube([10, external_diameter, 50]);
            rotate([0, 90, 00]) translate([-41.2, 8.72, -0.8]) cylinder(d = milk_tube_diameter, h = 10);
            translate([5, 8.75, -57.5]) cylinder(d = milk_tube_diameter, h = 100);
            
            //translate([9.2, -6, -24]) cube([20, 30, 80]);
        }
    }
}

module milkTubeHole() {
    rotate([0, -90, 0]) {
        difference() {
            cylinder(d = milk_tube_inner_diameter, h = 20);
            translate([0, 0, -1]) cylinder(d = milk_tube_inner_diameter - 2, h = 22);
        }
    }
}

module milkTube() {
    rotate([0, -90, 0]) {
        difference() {
            translate([0, 0, 0]) {
                translate([0, 0, 0]) cylinder(d = milk_tube_inner_diameter + 2, h = 10);
                translate([0, 0, -13]) cylinder(d = milk_tube_diameter + 2, h = 17);
            }
            translate([0, 0, 1]) cylinder(d = milk_tube_inner_diameter - 0.1, h = 13);
            
            translate([0, 0, 2.85]) cylinder(d1 = milk_tube_diameter, d2 = milk_tube_inner_diameter - 0.1, h = 2);
            translate([0, 0, -13.1]) cylinder(d = milk_tube_diameter - 0.1, h = 16);
        }
    }
}