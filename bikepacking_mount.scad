$fn = 90;

withHolder = false;

height = 160;
depth = 60;
thickness = 6;
strapWidth = 25;
strapHoldOffset = 10;
cornersRadius = 2;
strapCornersRadius = 1;
insetWidth = 11;
bolt = 5; // M5

Mounting();

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

module Mounting() {
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
            translate([64 / 2, 0, -10]) {
                BoltHole();
            }
            translate([-64 / 2, 0, -10]) {
                BoltHole();
            }
        }
    }
}

module Stick() {
    minkowski() {
        sphere(cornersRadius);
        cube([
            height - cornersRadius * 2, 
            20 - cornersRadius * 2, 
            thickness - cornersRadius * 2
        ], true);
    }

    offset = height / 2 - 2;
    translate([offset, 0, -1]) {
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
                        20 - cornersRadius * 2, 
                        thickness - cornersRadius * 2
                    ], true);
                }
            }
        }
    } else {
        translate([-height / 2 + 2, 0, -1]) {
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
    cube([height - 4, insetWidth, 4], true);
    
    offset = height / 2 - 2;
    translate([offset, 0, -2]) {
        cylinder(h = 4, d = insetWidth);
    }   
    
    if (!withHolder) {
        translate([-height / 2 + 2, 0, -2]) {
            cylinder(h = 4, d = insetWidth);
        }   
    }
}

module BoltHole() {
    translate([-1, 0, 0]) cylinder(h = 20, d = bolt);
    translate([-1, -(bolt / 2), 0]) cube([2, bolt, 20]);
    translate([1, 0, 0]) cylinder(h = 20, d = bolt);
}

module StrapHold() {
    rotate([25, 0, 0]) {
        translate([0, strapHoldOffset - 18.75, 7.65]) {
            difference() {
                minkowski() {
                    cube([
                        strapWidth + 3 * 2 - strapCornersRadius * 2, 
                        2 + 3 * 2 - strapCornersRadius * 2, 
                        4 - strapCornersRadius * 2
                    ]);
                    sphere(d = 1);
                }
                translate([2, 1.5, -5]) cube([strapWidth, 3, 10]);
            }
            rotate([0, 90, 0]) {
                translate([-2.25, 1.5, 2]) cylinder(h = strapWidth, d = 0.5);
                translate([-2.25, 4.5, 2]) cylinder(h = strapWidth, d = 0.5);
                translate([0.25, 1.5, 2]) cylinder(h = strapWidth, d = 0.5);
                translate([0.25, 4.5, 2]) cylinder(h = strapWidth, d = 0.5);
            }
            translate([2, 0.75, -0.25]) cube([strapWidth, 1, 2.5]);
            translate([2, 4.25, -0.25]) cube([strapWidth, 1, 2.5]);
        }
    }
    rotate([15, 0, 0]) {
        translate([5.5, -24, 6]) {
            minkowski() {
                cube([
                    20 - strapCornersRadius * 2, 
                    strapHoldOffset + 3 * 2 - strapCornersRadius * 2, 
                    4 - strapCornersRadius * 2
                ]);
                sphere(d = 1);
            }
        }
    }
}