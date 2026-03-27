$fn = $preview ? 90 : 180;
dm = 30;
hole_diameter = 40;

difference(){ 
    funnel();
    //translate([0, 0, 10]) #cube([100, 100, 100], true);
}

module funnel() {
    angle = 15;
    scale([0.97, 1, 1]) difference() {
        translate([10.8, 10.5, 0]) {
            rotate([0, angle, 0]) translate([0,0,0]) tube(20, 70);
            rotate([0, angle, 0]) 
                translate([0, 0, -1]) 
                    tube(2, hole_diameter + 1.6, hole_diameter + 1.6);
            rotate([0, angle, 0]) 
                translate([0, 0, -hole_diameter]) 
                    tube(hole_diameter, hole_diameter + 1.7);
        }
        translate([0, 0, -54.2]) cube([100, 100, hole_diameter], true);
    }

    difference() {
        translate([1.7, 10.5, -53]) tube(20, hole_diameter + 0.2);
        //translate([14, -10, -95]) cube(40);
    }
}

module tube(h, d2 = hole_diameter, d1 = hole_diameter) {
    difference() {
        cylinder(d1 = d1, d2 = d2, h = h);
        translate([0, 0, -1]) cylinder(d1 = d1 - 3, d2 = d2 - 3, h = h + 2);
    }
}