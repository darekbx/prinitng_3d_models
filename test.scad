translate([51,51,0]) cylinder(d = 1, h = 115);
translate([0,0,100])difference() {
    
    sphere(d = 150);
    translate([0,0,-10])sphere(d = 140);
    translate([0,0,-20])cube([200, 200, 60],true);
}