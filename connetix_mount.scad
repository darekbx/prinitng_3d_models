$fn = 90;

tile_thickness = 7;
tile_size = 75;
magnet_d = 10.4;
magnet_h = 10;


difference() {
    mount();
    scale([1, 1.01, 1.01]) tile();
}

module mount() {
    translate([-40, 0, 0]) {
        difference() {
            rotate([0, 90, 0]) {
                translate([-2, 0, -1]) scale([1, 1, 0.7]) tile();
                translate([-8.75, -(tile_size / 2) + -0.5, -3]) cube([16, tile_size + 5, 17]);
            }
            translate([-2.5, 30, 28]) rotate([0, 90, 0]) magnet();
            translate([-2.5, -26, 28]) rotate([0, 90, 0]) magnet();
            translate([-2.5, 30, -29]) rotate([0, 90, 0]) magnet();
            translate([-2.5, -26, -29]) rotate([0, 90, 0]) magnet();
            translate([-5, -17, -8]) rotate([0, 90, 0]) cube([30, 38, 20]);
            translate([-5, -17, 40]) rotate([0, 90, 0]) cube([30, 38, 20]);
        }
    }
}

module tile() {
    rounded_edge = 2;
    translate([rounded_edge, rounded_edge, 0]) 
        minkowski() {
            cube([tile_size - rounded_edge * 2, tile_size - rounded_edge * 2, tile_thickness - 1], true);
            cylinder(h = 1, r = rounded_edge);
        }
}

module magnet() {
    cylinder(h = magnet_h, d = magnet_d);
}