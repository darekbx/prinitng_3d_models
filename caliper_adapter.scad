
translate([-34.9, 0, -7]) cube([30, 4.3, 4], true);

difference() {
    scale([1, 1.4, 1.2]) difference() {
        cube([40, 3, 15], true);
        translate([-4, 0, 9.5]) rotate([0, -15, 0]) cube([40, 4, 15], true);
    }
 
    #translate([0.1, 0, -1.501]) caliper();   
}

module caliper() {
    difference() {
        cube([40, 3, 15], true);
        translate([-4, 0, 9.5]) rotate([0, -15, 0]) cube([40, 4, 15], true);
    }
}