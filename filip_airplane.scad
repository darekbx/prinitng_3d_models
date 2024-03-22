$fn = 20;

r = 32;
l = 60;
t = 0.4;

scale([1.8, 2.2, 1.5]) difference() {
    all();
    translate([0, 0, -1]) cube([200, 200, 2], true);
    
}
translate([0, 0, 3.5]) difference() {
    translate([0, 124, 0]) 
        rotate([90, 0, 0]) 
            cylinder(d = 7, h = 5);
    
    translate([0, 130, 0]) 
        rotate([90, 0, 0]) 
            cylinder(d = 5, h = 15);
}

module all() {
    wing();
    mirror([1, 0, 0]) wing();

    body();
    mirror([1, 0, 0]) body();
    
    translate([-0.1, 57, 0]) 
        rotate([0, 0, -27]) 
            scale([0.8, 1, 1]) 
                cylinder(d = 6, h = t, $fn = 3);
    
}

module wing() {
    linear_extrude(t) polygon([
        [0, 60],
        [-3, 0],
        [-r, 0]
    ]);
}

module body() {
    translate([0.2, 0, 8.8]) 
        rotate([0, -70, -3.15]) 
            linear_extrude(0.6) 
                polygon([
                    [-10, 0],
                    [-10, 62],
                    [0, 0],
                ]);
}