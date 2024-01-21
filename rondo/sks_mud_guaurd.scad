
$fn = 90;

difference() {
    translate() {
        scale([0.98, 0.98, 1]) import("SKS_AL46_bridge.stl", convexity=3);
        
        translate([14.2, 18, 0]) rotate([0, 0, -20]) cube([4, 8, 18]);
        translate([-29.8, 18, 0]) rotate([0, 0, 18]) cube([4, 8, 18]);
    }
    translate([-25, -27, -1]) cube(40);
    
    translate([13, 9, -4]) rotate([0, 0, -20]) cube([10, 20, 30]);
    translate([-35, 9, -4]) rotate([0, 0, 19]) cube([10, 20, 30]);
}

//mount();
fender();

module mount() {
    translate([-16, 13, -24]) difference() {
        cube([20.2, 2, 26.2]);
        translate([2, -1, 2]) cube([16.2, 4, 22.2]);
    }
}

module fender() {
    difference() {
        translate([-30.4, 81, 159.37]) 
            rotate([1, 180, 180]) 
                scale([0.6, 0.25, 0.7]) 
                    import("fenderpt1.STL");
        
        //translate([13, 9, -4]) rotate([0, 0, -20]) cube([10, 20, 22]);
        //translate([-35, 9, -4]) rotate([0, 0, 19]) cube([10, 20, 22]);
    }
}

module guard() {
    for (i = [1, 2, 3]) {
        translate([0, 0, i * 18]) {
            difference() {
                import("SKS_AL46_bridge.stl", convexity=3);
                translate([-25, -27, -1]) cube(40); 
                translate([-36, 18, -1]) cube(60); 
            }
        }
    }

    intersection() {
        translate([-6, 20, 4 * 18 - 12])
            rotate([90, 0, 0]) {
                cylinder(d = 60, h = 10);
            }
        translate([0, 0, 4 * 18]) difference() {
            import("SKS_AL46_bridge.stl", convexity=3);
            translate([-25, -27, -1]) cube(40); 
            translate([-36, 18, -1]) cube(60); 
        }
    }
}