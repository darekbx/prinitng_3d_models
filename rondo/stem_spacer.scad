$fn = 24;
height = 23;
tube_diameter = 31.8;
part_diameter = 3;
thickness = 3;

difference() {
    spacer();
    
    translate([0, 0, -1]) cylinder(d = tube_diameter + 0.4, h = 24, $fn = 90);
    translate([0, 0, -1.99]) cylinder(d = tube_diameter + thickness * 2 + 4, h = 2);
    translate([0, 0, height - 0.01]) cylinder(d = tube_diameter + thickness * 2+ 4, h = 2);
    outer();
    translate([0, 0, height -2]) outer();
}

module spacer() {
    translate([0, 0, -1]) {
        support(r = 25);
        mirror([1, 0, 0]) rotate([0, 0, 20]) support(r = 18);
        //mirror([0, 0, 0]) rotate([0, 0, 20]) support(r = 25);
        //mirror([1, 0, 0]) rotate([0, 0, 40]) support(r = 25);
    }
    ring();
    translate([0, 0, height - 2]) ring();
}


module outer() {
    difference() {
       cylinder(d = tube_diameter + thickness * 4, h = 2, $fn = 90); 
       translate([0, 0, -1]) cylinder(d = tube_diameter +thickness*2, h = 4, $fn = 90); 
    }
}

module ring() {
    difference() {
       cylinder(d = tube_diameter + thickness * 2, h = 2, $fn = 90); 
       translate([0, 0, -1]) cylinder(d = tube_diameter, h = 4, $fn = 90); 
    }
}

module support(r = 30) {
    parts = 10;
    diameter = 4.0;
    for(i = [0:parts])
       rotate(i * 360 / parts)
            translate([
                tube_diameter / 2 + 1.8, 
                diameter / 2, 
                0
            ]) {
                rotate([r, -6, 0]) 
                    cylinder(d1 = part_diameter, d2 = part_diameter, h = height + 2);
            }
}