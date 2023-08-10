$fn = 41;
rotate([0, 90, 0]) {
    scale([1.25, 1, 1]) difference() {
        cylinder(h = 141, d = 7);
        translate([1.5, 0, 74]) cube([6, 3, 150], true);
        
        for (a = [1 : 12]) {
            translate([4, 2.5, a * 12 - 1]) rotate([0, -90, 0]) cylinder(h = 10, d = 3);
            translate([4, -2.5, a * 12 - 7]) rotate([0, -90, 0]) cylinder(h = 10, d = 3);
        }
    }
}