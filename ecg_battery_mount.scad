$fn = 60;

interface_handle = true;

// 31mm

difference() {
    mount();
    translate([-1.7, 4, -2]) rotate([0, 0, 50]) cube([14, 10, 10]);
}

//#translate([0, 8.5, -5]) cube([100, 1, 20]);

module mount() {

    translate([-2, 0, 0]) mountHole();
    
    translate([28 + 2, 0, 0]) mountHole();
    
    difference() {
        translate([-0.3, -1, 0]) cube([28 + 0.6, interface_handle ? 9.5 : 6.6, 3.8]);
        translate([8, -2, -0.1]) cube([12, 4, 4]);
        translate([4, 1, 2.4]) cube([25, interface_handle ? 9 : 4, 2]);
        if (!interface_handle) {
            translate([4, 1, 2]) rotate([-25, 0, 0]) cube([25, 4, 2]);
        } else {
            translate([6, 4.5, -0.5]) cube([21.5, 5, 4]);
        }
    }
    
    // left mount of interface
    translate([-0.3, 1, 1.5]) cube([4.3, 3.6, 3.5]);
    translate([25.75, 3.5, 0]) cube([3.5, 5, 2.4]);
    
    // right mount of the interface
    translate([-0.3, 1, 4.2]) cube([7, 7.5, 0.8]);
    translate([-0.3, 4, 3.5]) cube([4.3, 4.5, 1]);
    
    // Edges
    difference() {
        translate([-1.5, -0.4, 0]) rotate([0, 0, 50]) cube([6.2, 3, 5]);
        translate([-2, 0, -0.5]) cylinder(d = 5, h = 6);
    }
    difference() {
        translate([28, 0, 0]) {
            translate([-2, 2.4, 0]) rotate([0, 0, -40]) cube([4.2, 3, 2.4]);
            translate([-1.52, 7.35, 0]) rotate([0, 0, -68.1]) cube([8, 3, 2.4]);
        }
        
        translate([28 + 2, 0, -0.5]) cylinder(d = 5, h = 6);
        if (!interface_handle) {
            translate([8, 1, 2]) rotate([-25, 0, 0]) cube([25, 5, 10]);
            translate([28 - 3, 0, 2.4]) cube([10, 4, 4]);
        } else {
            translate([28 - 3, 1, 2.4]) cube([3, 4, 4]);
        }
    }
}

module mountHole() {
    difference() {
        cylinder(d = 5, h = 6);
        translate([0, 0, -0.5]) cylinder(d = 2.4, h = 7);
        translate([0, 0, -0.5]) cylinder(d = 3.6, h = 3.5);
    }
}