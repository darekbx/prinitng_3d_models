$fn = 60;

w = 24;
h = 40;

cube([w, h, 3]);
cube([w, 3, h]);

difference() {
    cube([w, 11, 11]);
    rotate([0, 90, 0]) translate([-5.5, 5.5, -1]) cylinder(h = 50, d = 5);
}

translate([w/2 - 2.5, 8, 8]) { 
    difference() {
        cube([5, 28, 28]);
        rotate([45, 0, 0]) translate([-0.5, 22, -18]) cube([6, 37, 37]);
        rotate([45, 0, 0]) translate([-0.5, -19, -15]) cube([6, 37, 37]);
    }
}

translate([0, 3 + 5, 3 + 5]) {
    cube([w, h - 8, 3]);
    cube([w, 3, h - 8]);
    
    rotate([0, 90, 0]) {        
        for (i = [1 : 9]) {
            translate([-32 + i * 3, 0.5, 0]) {
                cylinder(d = 2, h = w);
            }
        }
    }
    
    rotate([-90, 0, -90]) {        
        for (i = [1 : 9]) {
            translate([-32 + i * 3, -0.5, 0]) {
                cylinder(d = 2, h = w);
            }
        }
    }
}


translate([w/2 - 2.5, 0, -3]) {
    cube([5, h, 4]);
}

translate([w/2 - 2.5, -4, -3]) {
    cube([5, 4, h + 3]);
}