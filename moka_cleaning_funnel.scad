$fn = 90;

difference(){
    difference() {
        translate([0,0,-1]) {
            cylinder(d1 = 9.6 + 6, d2 = 24.2 + 6, h = 15);
            translate([0,0,15]) cylinder(d1 = 24.2 + 6, d2 = 24.2 + 6, h = 10);
        }
        translate([0,0,9.01]) cylinder(d1 = 9.6,d2 = 24.2, h = 6);
        translate([0,0,-2]) cylinder(d = 9.6, h = 30);
        translate([0,0,15]) cylinder(d = 24.2, h = 10);
    }
         
  //  translate([0,-16,-2]) cube([40,40,40]);
}   
translate([0,0,8]) {
    difference(){
        difference() {
            cylinder(d1 = 10, d2 = 10, h = 1);
            translate([0,0,-2]) cylinder(d1 = 8, d2 = 10, h = 4);
        
        }
   // translate([0,-16,-2]) cube([40,40,40]);
    }
}