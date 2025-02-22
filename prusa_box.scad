// Plates
// 340x390x3 x4 = 0.53m2
// 340x358x3 x1 = 0.12m2
//                0.65m2

wall_thickness = 3;
height = 390;
width = 340;
depth = 340;

offset = 0.1; // Additional space for connectors
edge_height = 15;

if ($preview) {
    #box();
}

// bottom edges
translate([(width - 240) / 2, -9, -3]) bottom_edge(width = 240);
translate([(width - 240) / 2, 6 + depth, -3]) bottom_edge(width = 240);
translate([6, (width - 240) / 2, -3]) rotate([0, 0, 90]) bottom_edge(width = 246);
translate([3 + depth, (width - 240) / 2, -3]) rotate([0, 0, 90]) bottom_edge(width = 246);

// bottom corners
translate([-3, -9, -3]) bottom_corner();
mirror([1, 0, 0]) translate([-width - 3, -9, -3]) bottom_corner();
translate([width, depth + 6, 0]) rotate([0, 0, 180]) {
    translate([-3, -9, -3]) bottom_corner();
    mirror([1, 0, 0]) translate([-width - 3, -9, -3]) bottom_corner();
}

// top-bottom corners
!translate([-3, -9, edge_height - 3]) top_bottom_corner();

// top corners
mirror([0, 0, 1]) {
    translate([0, 0, -height]) {
        translate([-3, -9, -3]) top_corner();
        mirror([1, 0, 0]) translate([-width - 3, -9, -3]) top_corner();
        translate([width, depth + 6, 0]) rotate([0, 0, 180]) {
            translate([-3, -9, -3]) top_corner();
            mirror([1, 0, 0]) translate([-width - 3, -9, -3]) top_corner();
        }
    }
}

// top edges
translate([(width - 240) / 2, -9, height - 12]) top_edge(width = 240);

module box() {
    // Front
    translate([0, -wall_thickness * 2, 0]) 
        cube([width, wall_thickness, height]);

    // Back
    translate([0, depth + wall_thickness + wall_thickness * 2, 0]) 
        cube([width, wall_thickness, height]);

    // Left
    translate([0, wall_thickness, 0]) 
        cube([wall_thickness, depth, height]);

    // Right
    translate([depth - wall_thickness, wall_thickness, 0]) 
        cube([wall_thickness, depth, height]);

    // Top
    translate([0, -6, height + wall_thickness * 2]) 
        cube([width, depth + 18, wall_thickness]);
}

module bottom_edge(width = 200) {
    color([0.3, 0.3, 0.3]) difference() {
        cube([width, 9, edge_height]);
        translate([-1, (9 - wall_thickness) / 2 - offset / 2, 3]) 
            cube([width + 2, wall_thickness + offset, edge_height]);
    }
}

module top_edge(width = 200) {
    color([0.3, 0.3, 0.3]) difference() {
        cube([width, 9, edge_height + 9]);
        translate([-1, (9 - wall_thickness) / 2 - offset / 2, -3]) 
            cube([width + 2, wall_thickness + offset, edge_height]);
        translate([-1, 3, 12 + wall_thickness * 2 - offset / 1 -offset]) 
            cube([width + 2, 6 + wall_thickness * 2, wall_thickness + offset*3]);
    }
}

module bottom_corner() {
    color([0.5, 0.5, 0.5]) difference() {
        translate([0, 0, 0]) {
            cube([53, 59, edge_height]);
            translate([0, 0, edge_height]) 
                cube([edge_height, edge_height + 9, edge_height]);
        }
        translate([9, 9, -1]) cube([53, 59, 50]);
        translate([3, (9 - wall_thickness) / 2 - offset / 2, 3]) 
            cube([width + 2, wall_thickness + offset, edge_height * 3]);
        translate([6, (27 - wall_thickness) / 2 - offset / 2, 3]) 
            rotate([0, 0, 90]) 
                cube([width + 2, wall_thickness + offset, edge_height * 3]);
    }
}

module top_corner() {
    color([0.5, 0.5, 0.5]) difference() {
        translate([0, 0, 0]) {
            translate([0, 0, -9]) cube([53, 59, edge_height + 9]);
            translate([0, 0, edge_height]) 
                cube([edge_height, edge_height + 9, edge_height]);
        }
        translate([9, 9, -10]) cube([53, 59, 70]);
        translate([3, (9 - wall_thickness) / 2 - offset / 2, 3]) 
            cube([width + 2, wall_thickness + offset, edge_height * 3]);
        translate([6, (27 - wall_thickness) / 2 - offset / 2, 3]) 
            rotate([0, 0, 90]) 
                cube([width + 2, wall_thickness + offset, edge_height * 3]);
                
        translate([3, 3, -12 + wall_thickness * 2]) 
            cube([width / 3, depth / 3+ wall_thickness * 2, wall_thickness + offset * 4]);
    }
}

module top_bottom_corner() {
    edge_height = 8;
    color([0.3, 0.3, 0.3]) difference() {
        translate([0, 0, 0]) {
            translate([0, 0, edge_height]) 
                cube([edge_height, edge_height + 7, 342/2]);
        }
        translate([9, 9, -1]) cube([53, 59, height + 50]);
        translate([3, (9 - wall_thickness) / 2 - offset / 2, 3]) 
            cube([width + 2, wall_thickness + offset* 3, height + edge_height * 3]);
        translate([6, (27 - wall_thickness) / 2 - offset / 2, 3]) 
            rotate([0, 0, 90]) 
                cube([width + 2, wall_thickness + offset* 3, height + edge_height * 3]);
    }
}

if ($preview) {
    translate([140, 140, 70]) import("C:/Users/darek/Downloads/PrusaMini+_aligned.stl");
}