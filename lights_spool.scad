$fn = 60;

module c() {
    cylinder(d = 42, h = 20);
    cylinder(d = 120, h = 3);
}

difference() {
    c();
    translate([0, 0, -1]) cylinder(d = 35,h =22);
    
    translate([-40, 0, -1]) cylinder(d = 24,h =10);
    translate([40, 0, -1]) cylinder(d = 24,h =10);
    translate([0, 40, -1]) cylinder(d = 24,h =10);
    translate([0, -40, -1]) cylinder(d = 24,h =10);
    
    translate([28, -28, -1]) cylinder(d = 24,h =10);
    translate([-28, -28, -1]) cylinder(d = 24,h =10);
    translate([-28, 28, -1]) cylinder(d = 24,h =10);
    translate([28, 28, -1]) cylinder(d = 24,h =10);
}