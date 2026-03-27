$fn = 80;

difference() {
    holder();
    translate([0, 0, -1]) rods();
    translate([-20, 1.5, -1]) cube([100, 10, 30]);
}

translate([-48, -92.75, 0]) shelf();

supports();

module supports() {
    difference() {
        translate([-4.5, -92.75, 0]) cube([9, 93, 28]);
        translate([0, 0, -1]) rods();
        translate([-7, -7, 16]) cube([20, 3, 6]); 
    }
    difference() {
        translate([40 + 1, -92.75, 0]) cube([9, 93, 28]);
        translate([0, 0, -1]) rods();
        translate([40 + -7, -7, 16]) cube([20, 3, 6]); 
    }
}

module shelf() {
    cube([140, 90, 8]);
}

module holder() {
    cylinder(d = 9, h = 28);
    translate([40 + 5.5, 0, 0]) cylinder(d = 9, h = 28);
}

module rods() {
    cylinder(d = 5.5, h = 30);
    translate([40 + 5.5, 0, 0]) cylinder(d = 5.5, h = 30);
}
//translate([2.75,0,0]) #cube([40,1,1]);