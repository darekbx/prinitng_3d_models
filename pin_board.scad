$fn= 60;
/*
difference() {
    import("tray.stl");
    translate([-4, -21, -4]) cube([100, 60, 60]);
    translate([7.5, 21, -4]) cube([75, 60, 60]);
    translate([-71.7, 21, -4]) cube([75, 60, 60]);
    translate([86.7, 21, -4]) cube([75, 60, 60]);
}

difference() {
    translate([5, 35, 2]) { 
        minkowski() {
            cube([90 - 10, 2, 60 - 10]);
            rotate([90, 0, 0]) cylinder(d = 10, h = 0.01);
        }
    }
    translate([15, 0, 5]) { 
        for (y = [0 : 5]) {
            for (x = [0 : 5]) {
                translate([x * 12, 40, y * 9]) 
                    #rotate([90, 0, 0]) 
                        cylinder(d = 1.5, h = 10);
            }
        }
    }
}

translate([3.3, 36, -0.25]) {
    cube([4.2, 4, 55.25]);
}

translate([82.5, 36, -0.25]) {
    cube([4.2, 4, 55.25]);
} 
*/

translate([-5.05, -35, -2.03]) difference() {
    translate([5, 35, 2]) { 
        minkowski() {
            cube([10.1 - 10, 3, 125 - 10]);
            rotate([90, 0, 0]) cylinder(d = 12, h = 0.01);
        }
    }
    translate([5, 0, 14]) { 
        for (y = [0 : 18]) {
            translate([0 * 12, 40, y * 5]) 
                #rotate([90, 0, 0]) 
                    cylinder(d = 1.5, h = 10);
        }
    }
}

rotate([90,0,0]) difference() {
    cylinder(d = 12.1, h = 7);
    translate([0, 0, 3.2]) cylinder(d = 10.1, h = 8);
}

translate([0, 0, 115]) rotate([90,0,0]) difference() {
    cylinder(d = 12.1, h = 7);
    translate([0, 0, 3.2]) cylinder(d = 10.1, h = 8);
}