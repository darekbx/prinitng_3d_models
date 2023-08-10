$fn = 360;

d = 5.3;

rotate([90, 0, 0]){

difference() {
    cylinder(d = d + 2, h = 30);
    translate([0, 0, -0.5]) cylinder(d = d, h = 14.5);
    translate([0, 0, -0.5]) cylinder(d1 = d + 0.5, d2 = d, h = 2);
    translate([0, 0, 16]) cylinder(d = d, h = 14.5);
    translate([0, 0, 28.1]) cylinder(d1 = d, d2 = d + 0.5, h = 2);
    cylinder(d = 2.2, h = 40);
    
    //translate([0, 0, -0.5]) cube([10, 10, 40]);
}

}
