$fn = 180;
size = 75;
inner_size = 51;
corner = 6;
height = 7;
hole_offset = 4.5;

//!top();

difference() {
    tile();
    //translate([0, 0, -10]) cube(50);
}

module tile() {
    bottom();
    //translate([0, 0, 20 + 3.02]) top();
}

module top() {
    scale([0.97, 0.97, 1]) difference() {
        minkowski() {
            cube([size - corner, size - corner, 0.96], true);
            cylinder(d = corner, h = 0.00001);
        }
        translate([0, 0, -1]) cube([inner_size + 4, inner_size + 4, 10], true);
    }
    
    // Corner holes
    translate([size / 2 - hole_offset, size / 2 - hole_offset, -5]) top_mount();
    translate([-size / 2 + hole_offset, size / 2 - hole_offset, -5]) top_mount();
    translate([size / 2 - hole_offset, -size / 2 + hole_offset, -5]) top_mount();
    translate([-size / 2 + hole_offset, -size / 2 + hole_offset, -5]) top_mount();
    
    // Center holes
    translate([size / 2 - hole_offset, 0, -5]) top_mount();
    translate([-size / 2 + hole_offset, 0, -5]) top_mount();
    translate([0, size / 2 - hole_offset, -5]) top_mount();
    translate([0, -size / 2 + hole_offset, -5]) top_mount();
    
}

module bottom() {
    difference() {
        translate([0, 0, 0]) {
            bottom_part(inner_size);
        }
        translate([0, 0, 5.99]) scale([0.9733, 0.9733, 1]) bottom_part(inner_size + 3.45);
        
        // Corner holes
        translate([size / 2 - hole_offset, size / 2 - hole_offset, -2.5]) bottom_hole();
        translate([-size / 2 + hole_offset, size / 2 - hole_offset, -2.5]) bottom_hole();
        translate([size / 2 - hole_offset, -size / 2 + hole_offset, -2.5]) bottom_hole();
        translate([-size / 2 + hole_offset, -size / 2 + hole_offset, -2.5]) bottom_hole();
        
        // Center holes
        translate([size / 2 - hole_offset, 0, -2.5]) bottom_hole();
        translate([-size / 2 + hole_offset, 0, -2.5]) bottom_hole();
        translate([0, size / 2 - hole_offset, -2.5]) bottom_hole();
        translate([0, -size / 2 + hole_offset, -2.5]) bottom_hole();
        
        // Magnet holes
        translate([-0.5, -0.5, 0]) mirror([0, 0, 0]) magnet_hole();
        translate([0.5, 0.5, 0]) mirror([1, 1, 0]) magnet_hole();
        translate([-0.5, -0.5, 0]) mirror([1, -1, 0]) magnet_hole();
        translate([-0.5, 0.5, 0]) mirror([0, 1, 0]) magnet_hole();
    }
}

module magnet_hole(){
        translate([size / 2 - (21 + 8), size / 2 - 6, -3]) magnet();
        translate([-size / 2 + (1 + 8), size / 2 - 6, -3]) magnet();
}

module bottom_part(inner_size) {
    difference() {
        minkowski() {
            cube([size - corner, size - corner, height], true);
            cylinder(d = corner, h = 0.00001);
        }
        translate([0, 0, -1]) cube([inner_size, inner_size, 10], true);
    }
}

module bottom_hole() {
    cylinder(d = 5, h = 10);
}

module top_mount() {
    cylinder(d = 4.7, h = 5);
}

module magnet() {
    //cylinder(d = 5, h = 20);
    cube([21, 5.5, 5.5]);
}