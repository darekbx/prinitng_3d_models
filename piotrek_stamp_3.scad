
twentyfive();

module twenty() {
    cylinder(d = 20, h = 2, $fn = 90);

    translate([0, 0, -2]) difference() {
        cylinder(d = 20, h = 2, $fn = 90);
        translate([0, 0, -1]) cylinder(d = 18, h = 5, $fn = 90);
    }

    translate([-18, -18, -2]) scale(0.21) 
        linear_extrude(10) 
            import("C:/Users/darek/Downloads/3.svg");
    
    translate([0, 0, 2]) {
        cylinder(d1 = 20, d2 = 12, h = 30, $fn = 8);
        translate([0, 0, 30]) sphere(d = 30, $fn = 8);
    }
}

module twentyfive() {
    cylinder(d = 25, h = 2, $fn = 90);

    translate([0, 0, -2]) difference() {
        cylinder(d = 25, h = 2, $fn = 90);
        translate([0, 0, -1]) cylinder(d = 23, h = 5, $fn = 90);
    }

    translate([-22, -22, -2]) scale(0.26) 
        linear_extrude(10) 
            import("C:/Users/darek/Downloads/3.svg");
    
    translate([0, 0, 2]) {
        cylinder(d1 = 25, d2 = 12, h = 30, $fn = 8);
        translate([0, 0, 30]) sphere(d = 30, $fn = 8);
    }
}