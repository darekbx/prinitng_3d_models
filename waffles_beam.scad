$fn = 20;

s = 14.3;

beam_up();
//beam_stright();

module beam_up() {
    translate([s, 0, -s*3]) 
        mirror([1, 0, 0]) 
            rotate([180, 0, 180]) {
                mount();
                translate([-2, 0, -s*3+2.5]) 
                    cube([2, s, s * 3-2]); 
            }
    
    translate([164 + s*2, 0, 0]) mount();

    translate([s, 0, -s]) cube([164+s, s, 1.5]);
    translate([s, 0, -4]) cube([164+s, s, 1.5]);
 
    beams();
    translate([204.4, 0, 0]) mirror([1, 0, 0]) beams();
}

module beam_stright() {
    translate([s, 0, 0]) mirror([1, 0, 0]) mount();
    translate([164 + s, 0, 0]) mount();

    translate([s, 0, -s]) cube([164, s, 1.5]);
    translate([s, 0, -4]) cube([164, s, 1.5]);

    beams();
    translate([192.5, 0, 0])mirror([1, 0, 0]) beams();
}

module beams() {
    for (i = [1:7]) {
        translate([13.5 * i, 0, -4]) 
            rotate([0, 90, 0]) 
                cube([s - 4, s, 1.3]);
    }
}

module mount() {
    cube(s);
    translate([-2, 0, -s]) cube([2, s, s * 2]); 
}