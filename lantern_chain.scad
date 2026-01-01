$fn = 180;
!handle();

module handle() {
    difference() {
        cylinder(d = 36.8, h = 8);
        translate([0, 0, -1]) cylinder(d = 33, h = 10);
        translate([0, 0, 3.5]) cylinder(d = 35, h = 1.5);
        translate([0, 0, 3]) cube([40, 1, 12], true);
    }
}

module hook() {
    difference() {
        cube([28, 10, 18]);
        translate([5, -1, 3]) cube([30, 12, 12]);
    }
    difference() {
        translate([-20, 0, 0]) cube([20, 10, 10]);
        translate([-16, -1, 6]) cube([12, 12, 10]);
    }
}

difference() {
    import("C:/Users/darek/Downloads/FLYANDI-BLOCK-LATERN-CHAIN-PART.stl");
    translate([-10, 18, -5]) cube([100, 20, 20]);
    rotate([0, 0, 90]) 
        translate([18 - 5.5, -7 - 0.25, 2.5 + 0.15])
            scale([1.05, 1, 1.05])
                import("C:/Users/darek/Downloads/FLYANDI-BLOCK-LATERN-CHAIN-CONNECTOR.stl");
    rotate([0, 0, 90]) 
        translate([18 - 5.5, -57 - 0.25, 2.5 + 0.15])
            scale([1.05, 1, 1.05])
                import("C:/Users/darek/Downloads/FLYANDI-BLOCK-LATERN-CHAIN-CONNECTOR.stl");

}