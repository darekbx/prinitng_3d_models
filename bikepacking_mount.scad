$fn = 30;

withHolder = false;

height = 160;
width = 20;
depth = 60;
thickness = 9;
strapWidth = 14;
strapHoldOffset = 10;
cornersRadius = 2;
strapCornersRadius = 1;
insetWidth = 11;
bolt = 5; // M5

// Pump
//translate([-100, 0, 24]) rotate([0, 90, 0]) #cylinder(h = 800, d = 39);
Mounting(true);


module SmallStrapHolds() {
    translate([34, 33, -1]) {
        StrapHold();
    }
    translate([-(34 + strapWidth + 2 * 3), 33, -1]) {
        StrapHold();
    }
    rotate([180, 0, 0]) {
        translate([34, 33, 1]) {
            mirror([0, 0, 1]) StrapHold();
        }
        translate([-(34 + strapWidth + 2 * 3), 33, 1]) {
            mirror([0, 0, 1]) StrapHold();
        }
    }
}


module Mounting(holes = true) {
    difference() {
        Stick();
        {
            translate([0, 0, 2]) {
                StickInset(height);
            }
            
            if (withHolder) {
                translate([-(height / 2) + 4, 0, depth / 2 - 2]) {
                    rotate([0, 270, 0]) {
                        StickInset(depth - 2);
                    }
                }
            }
            if (holes) {
                holeOffset = 32;
                translate([holeOffset + (64 / 2), 0, -10]) {
                    BoltHole();
                }
                translate([holeOffset + (-64 / 2), 0, -10]) {
                    BoltHole();
                }
                translate([holeOffset + (-128 + 64 / 2), 0, -10]) {
                    BoltHole();
                }
            }
        }
    }
}

module Stick() {
    minkowski() {
        sphere(cornersRadius);
        cube([
            height - cornersRadius * 2, 
            width - cornersRadius * 2, 
            thickness - cornersRadius * 2
        ], true);
    }

    offset = height / 2 - 2;
    translate([offset, 0, -2.5]) {
        RoundedEdge();
    }

    if (withHolder) {
        rotate([0, 90, 0]) {
            yOffset = depth / 2 - 2;
            translate([-(depth / 2) + 3, 0, -(height / 2) + 2]) {
                translate([-yOffset, 0, -1]) {
                    RoundedEdge();
                }
                minkowski() {
                    sphere(cornersRadius);
                    cube([
                        depth - cornersRadius * 2, 
                        width - cornersRadius * 2, 
                        thickness - cornersRadius * 2
                    ], true);
                }
            }
        }
    } else {
        translate([-height / 2 + 2, 0, -2.5]) {
            RoundedEdge();
        }
    }
    
    module RoundedEdge() {
        minkowski() {   
            sphere(cornersRadius); 
            cylinder(h = thickness - cornersRadius * 2, d = 16);
        }
    }
}

module StickInset(height) {
    cube([height - 4, insetWidth, 8], true);
    
    offset = height / 2 - 2;
    translate([offset, 0, -4]) {
        cylinder(h = 7, d = insetWidth);
    }   
    
    if (!withHolder) {
        translate([-height / 2 + 2, 0, -4]) {
            cylinder(h = 9, d = insetWidth);
        }   
    }
}

module BoltHole() {
    translate([-1, 0, 0]) cylinder(h = 20, d = bolt);
    translate([-1, -(bolt / 2), 0]) cube([2, bolt, 20]);
    translate([1, 0, 0]) cylinder(h = 20, d = bolt);
}

module StrapHold() {
    rotate([10, 0, 0]) {
        translate([0, strapHoldOffset - 24.65, 11.10]) {
            difference() {
                minkowski() {
                    cube([
                        strapWidth + 3 * 2 - strapCornersRadius * 2, 
                        2 + 3 * 2 - strapCornersRadius * 2, 
                        5 - strapCornersRadius * 2
                    ]);
                    sphere(d = 1);
                }
                translate([2, 1.5, -5]) cube([strapWidth, 3, 10]);
            }
            /*rotate([0, 90, 0]) {
                translate([-2.25, 1.5, 2]) cylinder(h = strapWidth, d = 0.5);
                translate([-2.25, 4.5, 2]) cylinder(h = strapWidth, d = 0.5);
                translate([0.25, 1.5, 2]) cylinder(h = strapWidth, d = 0.5);
                translate([0.25, 4.5, 2]) cylinder(h = strapWidth, d = 0.5);
            }*/
            //translate([2, 0.75, -0.25]) cube([strapWidth, 1, 2.5]);
            //translate([2, 4.25, -0.25]) cube([strapWidth, 1, 2.5]);
        }
    }
    difference() {
        rotate([45, 0, 0]) {
            translate([0, -18, 17]) {
                    minkowski() {
                        cube([
                            20 - strapCornersRadius * 2, 
                            strapHoldOffset + 3 * 2 - strapCornersRadius * 2, 
                            5 - strapCornersRadius * 2
                        ]);
                        sphere(d = 1);
                    }
                }
            }
            
        rotate([10, 0, 0]) {
            translate([0, strapHoldOffset - 24.65, 11.10]) {
                translate([2, 1.5, -5]) cube([strapWidth, 3, 10]);
            }
        }
    }
}