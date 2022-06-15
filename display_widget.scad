// Math game

$fa = 1;
$fs = 0.4;
$fn = 100;

showBushing = false;
showComponents = false;
flat = true;
noDisplay = false;

displayX = 1;
displayY = 2;

displayBoardWidth = 270;
displayBoardHeight = 280;
displayWidth = 265 - 20; // 20 - display area offset
displayHeight = 192 - 40;

// https://openscad.org/cheatsheet/
// % transparent
// ! show only 
// # highlight
// * disable

translate([0, 0, -17]) {
    difference() {
        Case();
        {
            if (noDisplay) {
                translate([-10, -10, -5]) {
                    cube([60, 49, 25]);
                }
                translate([-10, 86, -5]) {
                    cube([60, 30, 25]);
                }
            }
            if (flat) {            
                translate([-10, 86, 0]) {
                    cube([60, 20, 20]);
                }
            }
        }
    }
}

if (showComponents) {
    translate([displayX, displayY, 12])
        DisplayPlaceholder();
}

if (showBushing) {
    translate([0, 0, -1]) {
        translate([10, 36, 0]) Bushing();
        translate([15, 36, 0]) Bushing();
        translate([20, 36, 0]) Bushing();
        translate([25, 36, 0]) Bushing();
    }
}

module Case() {
    difference() {
        minkowski() {
            sphere(2.2);
            cube([29, 30, 15]);
        }
        {
            translate([-1, -1, -9]) {
                cube([31, 32, 25]);
            }
            translate([displayX, displayY, 14.5]) {
                DisplayPlaceholder();
            }
            if (flat) {
                translate([-10, -10, -10]) {
                    cube([60, 110, 20]);
                }
            }
        }
    }
    translate([displayX, displayY, 12]) {
        DisplayMountingBolts();
    }
    translate([displayX, displayY, 12]) {
        DisplayFrame();
    }
}


module DisplayFrame() {
    frameHeightOffset = -2;
    frameHeight = 12;
    xPos = (displayBoardWidth - displayWidth) / 2;
    yPos = 47; // Top offset
    width = displayWidth - 20;
    height = displayHeight - 20;
        scale([0.1, 0.1, 0.1]) {
            translate([xPos - 5, yPos - 5, 30]) {
                
                difference() {
                    translate([0, 0, 0]) {
                        rotate([90, 0, 0]) {
                            translate([5, 12, -(displayHeight + 5)]) {
                                cylinder(h = displayHeight, d = 20);
                            }
                            translate([displayWidth + 5, 12, -(displayHeight + 5)]) {
                                cylinder(h = displayHeight, d = 20);
                            }
                        }
                        rotate([90, 0, 90]) {
                            translate([5, 12, 5]) {
                                cylinder(h = displayWidth, d = 20);
                            }
                            translate([displayHeight + 5, 12, 5]) {
                                cylinder(h = displayWidth, d = 20);
                            }
                        }
                    }
                    translate([-50, -20, -90]) {
                        cube([500, 340, 100]);
                    }
                }
                difference() {
                    translate([0, 0, frameHeightOffset]) {
                        cube([width + 30, height + 30, frameHeight]);
                    }
                    translate([15, 15, -40]) {
                        cube([width, height, 80]);
                    }
                }
            }
    }
}

module DisplayMountingBolts() {
    d = 20; // Diameter of the bolt
    x = 7 + d / 2; // X position offset
    y = 11 + d / 2; // Y position offset
    h = 65; // Height of the bolt
    hOffset = -13;
    scale([0.1, 0.1, 0.1]) {
        translate([x, y, hOffset]) { Bolt(); }
        translate([displayBoardWidth - x, y, hOffset]) { Bolt(); }
        translate([x, displayBoardHeight - y, hOffset]) { Bolt(); }
        translate([displayBoardWidth - x, displayBoardHeight - y, hOffset]) { Bolt(); }    
    }
    
    module Bolt() {
        translate([0, 0, 0]) {
            cylinder(h, d = d);
            translate([-d, -7, h / 2]) cube([d * 2 + 2, 14, 21]);
            translate([-7, -d, h / 2]) cube([14, d * 2 + 2, 21]);
        }
    }
}

module Bushing() {
    d = 2.1; // Diameter of the bolt
    h = 1;
    difference() {
        cylinder(h, d = d * 1.75);
        translate([0, 0, -5]) cylinder(10, d = d);
    }
}

module DisplayPlaceholder() {
    thickness = 18; // Display thickness
    d = 20; // Hole diameter
    x = 7 + d / 2; // Hole X position offset
    y = 11 + d / 2; // Hole Y position offset
    scale([0.1, 0.1, 0.1]) {
        difference() {
            cube([displayBoardWidth, displayBoardHeight, 12]);
            {
                translate([x, y, -1]) { cylinder(50, d = d); }
                translate([displayBoardWidth - x, y, -1]) { cylinder(50, d = d); }
                translate([x, displayBoardHeight - y, -1]) { cylinder(50, d = d); }
                translate([displayBoardWidth - x, displayBoardHeight - y, -1]) { cylinder(50, d = d); }
            }
        }
        xPos = (displayBoardWidth - displayWidth) / 2;
        yPos = 47; // 8mm
        translate([xPos, yPos, 12]) {
            color("black") {
                cube([displayWidth, displayHeight, thickness]);
            }
        }
    }
}
