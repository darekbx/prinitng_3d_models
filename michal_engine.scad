parts = 8;

outer_diameter = 90;
outer_height = 22;
outer_padding = 5.5;
outer_bottom_thicnkess = 8;
outer_axle_diameter = 10.2;

inner_diameter = 51;
inner_height = outer_height - outer_bottom_thicnkess;

magnet_diameter = 10;
magnet_height = 4;

bearing_spacer = 0.2;

difference() {
    translate([0, 0, 0]) {
        outer();
        translate([0, 0, outer_bottom_thicnkess + 0.2]) rotate([0, 0, 0]) inner();
    }
    translate([-10, -10, -1]) {
        //cube([70, 70, 40]);
    }
    translate([-0, -0, -1]) {
        //cube([70, 70, 40]);
    }
    
    translate([-80, 4, -1]) {
        //#cube([170, 70, 40]);
    }
    translate([4, -80, -1]) {
        //#cube([70, 170, 40]);
    }
}

module outer() {
    difference() {
        cylinder(d = outer_diameter, h = outer_height, $fn = 180);
        translate([0, 0, outer_bottom_thicnkess]) 
            cylinder(d = outer_diameter - outer_padding, h = outer_height, $fn = parts);
        translate([0, 0, -1]) 
            cylinder(d = outer_axle_diameter, h = outer_height, $fn = 360);
        outer_holders(true);
    }
    difference() {
        outer_holders();
        translate([0, 0, -1]) difference() {
            cylinder(d = outer_diameter * 2, h = outer_height + 2, $fn = 180);
            translate([0, 0, -1]) cylinder(d = outer_diameter, h = outer_height + 4, $fn = 180);
        }
    }
}

module outer_holders(for_diff = false) {
    diameter = 0.0;
    angle = -2;
    
    for(i = [0:parts])
       rotate(i * 360 / parts)
            translate([32, diameter / 2, 0]) {
                rotate([0, 0, angle]) 
                    magnet_holder_outer(for_diff);
            }
}

module inner() {
    difference() {
        rotate([0, 0, -6]) cylinder(d = inner_diameter, h = inner_height, $fn = parts);
        // axle hole
        //translate([0, 0, -1]) 
        //    cylinder(d = outer_axle_diameter, h = outer_height, $fn = 360);
        inner_holders(true);
    }
    inner_holders();
    
    // bearing axle
    translate([0, 0, -8]) 
        cylinder(d = 5.1, h = outer_bottom_thicnkess, $fn = 360);
        
    // bearing spacer
    translate([0, 0, -bearing_spacer]) 
        cylinder(d = 8, h = bearing_spacer, $fn = 360);
}

module inner_holders(for_diff = false) {
    diameter = -2.0;
    angle = -2;
    
    for(i = [0:parts])
       rotate(i * 360 / parts)
            translate([18, diameter / 2, 0]) {
                rotate([0, 0, angle]) 
                    magnet_holder_inner(for_diff);
            }
}

module magnet_holder_outer(for_diff = false) {
    width = 22.8;
    y_pos = outer_bottom_thicnkess - 4;
    if (for_diff) {
        translate([-0.1, width / 2, outer_height / 2 + y_pos]) 
            rotate([0, 90, 0]) 
                cylinder(d = magnet_diameter + 0.3, h = magnet_height, $fn = 180);
    } else {
        difference() {
            cube([11, width, outer_height]);
            translate([-0.1, width / 2, outer_height / 2 + y_pos]) 
                rotate([0, 90, 0]) 
                    cylinder(d = magnet_diameter + 0.3, h = magnet_height, $fn = 180);
        }
    }
}

module magnet_holder_inner(for_diff = false) {
    width = 17.2;
    y_pos = -bearing_spacer;
    x_pos = 2; 
    if (for_diff) {
        translate([6 - magnet_height + 0.1, width / 2 + x_pos, inner_height / 2 + y_pos]) 
            rotate([0, 90, 0]) 
                cylinder(d = magnet_diameter + 0.3, h = magnet_height, $fn = 180);
    } else {
        difference() {
            cube([6, width, inner_height]);
            translate([6 - magnet_height + 0.1, width / 2 + x_pos, inner_height / 2 + y_pos]) 
                rotate([0, 90, 0]) 
                    cylinder(d = magnet_diameter + 0.3, h = magnet_height, $fn = 180);
        }
    }
}