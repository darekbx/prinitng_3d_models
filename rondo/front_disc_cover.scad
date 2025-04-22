$fn = $preview ? 22 : 360;

front = true;

disc_diameter = 160;
cover_offset = 4;
cover_height = 8;
cover_thickness = 2;

spacer_diameter = 19.3;
colar_height = front ? 3 : 2.5;

difference() {
    cover();
    translate([0, 0, -1]) cylinder(d = spacer_diameter, h = 20);
    pattern();
    translate([0, 0, 3])  {
        if (front) {
            front_brake_caliper();
        } else {
            rear_brake_caliper();
        }
    }
}

module front_brake_caliper() {

    rotate([0, 0, 16]) translate([28.5, -10.5, -5]) cube([80, 110, 20]);
    rotate([0, 0, 16]) translate([28.5, -14.5, -5]) cube([30, 30, 20]);
    rotate([0, 0, 20]) translate([34, -17, -5]) cube([60, 70, 20]);
    translate([55, 12, -5]) cylinder(d = 40, h = 10);
}

module rear_brake_caliper() {
    rotate([0, 0, 10]) translate([28.5, -2, -5]) cube([80, 110, 20]);
    rotate([0, 0, 16]) translate([30.5, -11, -5]) cube([60, 30, 20]);
    rotate([0, 0, 16]) translate([28, -11, -5]) cube([60, 6, 20]);
    rotate([0, 0, 16]) translate([28, -11, -5]) cube([60, 6, 20]);
}

module pattern() {
    diameter = 30.0;
    rotate(60)
    for(i = [/*10, 11, 12*/ 13, 14, 15, 16, 17, 18, 19, 20, /*21*/]) {
       rotate(i * 30)
            translate([24, diameter / 2, -1]) {
                minkowski() {
                    cube([46, 0.1, 10]);
                    cylinder(d = 8, h = 10);
                }
            }
    }
            
    diameter2 = 30.0;
    rotate(45)
    for(i = [/*10, 11, 12*/ 13, 14, 15, 16, 17, 18, 19, 20, 21])
       rotate(i * 30)
            translate([50, diameter2 / 2, -1]) {
                minkowski() {
                    cube([20, 0.1, 1]);
                    cylinder(d = 8, h = 10);
                }
            }
}

module cover() {
    cylinder(d = disc_diameter + cover_offset, h = cover_thickness);
    cylinder(d = spacer_diameter + 10, h = colar_height);
    translate([0, 0, cover_thickness]) ring();
}

module ring() {
    difference() {
        cylinder(d = disc_diameter + cover_offset, h = cover_height);
        translate([0, 0, -1]) 
            cylinder(d = disc_diameter + cover_offset - 2, h = 10 + cover_height);
    }
}


/*             
difference() {
    cover();
    
    translate([-8, -8, -10]) cube([100, 100, 50]);
    
    diameter = 50.0;
    rotate(60)
    for(i = [10 : 20]) 
       rotate(i * 30)
            translate([26, diameter / 2, -1]) {
                
                minkowski() {
                    cube([48, 0.1, 10]);
                    cylinder(d = 8, h = 10);
                }
            }
}


*/