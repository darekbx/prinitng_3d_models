$fn = $preview ? 50 : 90;
//scale([2.5, 2.5, 1]) import("button.stl", convexity=3);

translate([0, 0, 0]){
    difference() {
        cylinder(d = 41.05, h = 2);
        translate([-12, 13.5, 3])
            rotate([0, 90, 0]) 
                cylinder(d = 4.5, h = 20 + 4);
    }
}

translate([0, 0, 21.8]) rotate([180, 0, 0]) top();

module top(){
    difference() {
        sphere(d = 60);
        translate([-50, -50, -78.2]) cube(100);
    }
}

translate([0, 0, -3.2]) {
    //cylinder(d = 24, h = 2.2);
}


//translate([0, 0, 6]) cube([1, 27, 1], true);

translate([-10, 13.5, 1.1]) Mount();
//translate([4, 13.5, 1.5]) Mount();

module Lock() {
    cube([3.8, 38, 2]);
    translate([-1.1, 0, 0]) cube([6, 3, 2]);
}

module Mount() {
    hh = 20;
    rotate([0, 90, 0]) difference() {
        cylinder(d = 7, h = hh);
        translate([0, 0, -0.5]) cylinder(d = 4.5, h = hh + 1);
    }
}


/*
translate([0, 0, -3.2]){
    difference() {
        cylinder(d = 22, h = 3.2);
        translate([0, 0, 1.1]) cylinder(d = 17.5, h = 2.5);
        translate([-(17.3)/2, 0, 1.1]) cube([17.3, 12, 5]);
        translate([0, 0, -0.1]) cylinder(d = 8, h = 3);
        translate([-4, 0, -0.1]) cube([8, 20, 3]);
    }
}
*/
//translate([0, -7, -6]) cube([1, 14.7, 1]);

/*
dd = 2.4;
angle = 6;

translate([0, 0, 1.5]) difference() {
    translate([0, 0, -6]) {
        translate([0, 8.75, 0]) cylinder(d = 9, h = 5);
        translate([0, -8.75, 0]) cylinder(d = 9, h = 5);
    }
    translate([-10, -9.5, -4.5]) {
        rotate([0, 90, angle]) cylinder(d = dd, h = 20);
        translate([0, 19.5, 0]) rotate([0, 90, -angle]) cylinder(d = dd, h = 20);
    }
    translate([-10, -9.5, -5.5]) {
        rotate([0, 90, angle]) cylinder(d = dd, h = 20);
        translate([0, 19.5, 0]) rotate([0, 90, -angle]) cylinder(d = dd, h = 20);
    }
}
*/