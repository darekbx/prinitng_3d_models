$fn = 90;

width = 88;
depth = 143;
height = 230;

//#speaker();
translate([0, 0, -120]) stand();

module speaker() {
    cube([width, depth, height], true);
}

module stand() {
    cube([width, depth, 6], true);
    translate([-width/2 +5, 0, -25]) cube([10, depth, 50], true);
    
    difference(){
        translate([0, 0, -25]) {
            translate([0, -66.5, 0]) cube([width, 10, 50], true);
            translate([0, 66.5, 0]) cube([width, 10, 50], true);
        }
        rotate([0, -30, 0]) translate([-10, 0, -50]) cube([width+10, depth+10, 50], true);
    }
}