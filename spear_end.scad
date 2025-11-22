$fn = 50;

include <libs/threads.scad>

difference() {
    cylinder(d1 = 25 + 4, d2 = 20 + 3.4, h = 20 + 0);
    translate([0, 0, -0.5]) metric_thread(diameter = 25, pitch = 2, length = 21, internal = true, taper = 1/4);
}

//#cylinder(d1 = 23.4, d2 = 18.4, h = 21);

difference() {
    rotate([-3.3, -0, 00]) translate([-9.4, -29.6, 155]) 
        rotate([0, 90, 0]) 
            scale([0.4, 0.75, 0.75]) 
                import("C:/Users/darek/Downloads/SpartanSpear.STL");
    translate([-2, -2, 166]) cylinder(d = 10, h = 10);
}

