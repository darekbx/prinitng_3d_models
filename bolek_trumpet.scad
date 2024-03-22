$fn = 60;

difference() {
    translate([0, 0, 0]) {
        cylinder(d = 20, h = 140);
        cylinder(d1 = 24, d2 = 20, h = 10);
        translate([0, 0, 140]) cylinder(d1 = 20, d2 = 100, h = 40);
        
        translate([0, 0, 50]) t_cylinder();
        translate([0, 0, 50 + 16]) t_cylinder();
        translate([0, 0, 50 + 16 + 16]) t_cylinder();
        
        translate([0, 26, 67]) scale([1, 0.6, 1]) torus();  
    }
    translate([0, 0, -1]) cylinder(d = 16, h = 182);
    translate([0, 0, -1]) cylinder(d1 = 21, d2 = 16, h = 10);
    translate([0, 0, 141]) cylinder(d1 = 16, d2 = 86, h = 40);
    
    /*translate([0, 0, 50]) t_cylinder_hole();
    translate([0, 0, 50 + 16]) t_cylinder_hole();
    translate([0, 0, 50 + 16 + 16]) t_cylinder_hole();*/
}


module t_cylinder() {
    rotate([90, 0, 0]) {
        difference() {
            cylinder(d = 7, h = 20);
            translate([0, 0, -2]) cylinder(d = 6, h = 24);
        }
        translate([0, 0, 16]) cylinder(d = 14, h = 5);
    }
}

module t_cylinder_hole() {
    rotate([90, 0, 0]) {
        translate([0, 0, -2]) cylinder(d = 8, h = 24);
    }
}

module torus() {
    /*minkowski() {
        difference() {
            cylinder(d = 80, h = 10, $fn = 30);
            translate([0, 0, -1]) cylinder(d = 70, h = 12);
        }
        sphere(r = 5);
    }*/
    rotate([90, 0, 90]) {
        rotate_extrude(convexity = 10)
        translate([40, 0, 0])
        circle(r = 8, $fn = 100);
    }
}