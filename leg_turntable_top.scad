$fn = $preview ? 180 : 360;

d = 165; // Diameter
fd = 144; // Flange diameter
pd = 5; // Pin diameter
t = 4;  // Thickness

difference() {
    plate();
    
    // center
    pin_hole();
    
    // flange
    translate([0, fd / 2, 0]) pin_hole();
    translate([0, -fd / 2, 0]) pin_hole();
    translate([fd / 2, 0, 0]) pin_hole();
    translate([-fd / 2, 0,  0]) pin_hole();
}

module pin_hole() {
    translate([0, 0, 1]) cylinder(h = 10, d = pd);
}

module plate() {
    cylinder(h = t, d = d);
}