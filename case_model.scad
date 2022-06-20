// Math game

$fa = 1;
$fs = 0.4;
$fn = 25;

showComponents = false;
flat = false;
noKeyboard = false;
noKeys = true;
noDisplay = false;
noKeyMask = true;

keyboardX = 0;
keyboardY = 40;

displayX = 3;
displayY = 0;

switchX = 41;
switchY = 14;

displayBoardWidth = 358;
displayBoardHeight = 340;
displayWidth = 344;
displayHeight = 190;

// https://openscad.org/cheatsheet/
// % transparent
// ! show only 
// # highlight
// * disable

checkMark = [ 
    [0,3], 
    [2,0], 
    [6,4.5], 
    [6.5,6], 
    [2,1.5],
    [0.5,3.5]
  ];

if (noKeyboard && !noKeys) {
    !KeyboardKeys();
}

module SwitchBall() {
    difference() {
        translate([0, 0, 0]) {
            sphere(d = 5);
            cube([10, 4, 1], true);
        }
        translate([-5, -5, 0]) {
            translate([0, 0, 0.5]) cube([10, 10, 5]);
            translate([5, 5, 0]) cube([1.6, 1.6, 4], true);
        }
    }
}

difference() {
    Case();
    {
        if (noKeyboard) {
            translate([-10, 38, -5]) {
                cube([60, 80, 25]);
            }
        }
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

if (showComponents) {
    translate([displayX, displayY, 12])
        DisplayPlaceholder();

    translate([keyboardX, keyboardY, 11])
        KeyboardPlaceholder();
    
    translate([switchX, switchY, 3]) {
        rotate([90, 0, 90]) {
            SwitchPlaceholder();
        }
    }
    //#PowerModulePlaceholder();
}

module Case() {
    difference() {
        minkowski() {
            sphere(2.2);
            translate([0, 0, 3]) cube([42, 90, 12]);
        }
        {
            translate([-1, -1, -9]) {
                cube([44, 92, 25]);
            }
            translate([displayX, displayY, 13]) {
                DisplayPlaceholder();
            }
            translate([keyboardX, keyboardY, 13]) {
                KeyboardPlaceholder();
            }
            translate([keyboardX, keyboardY, 10]) {
                KeyboardPlaceholder();
            }
            translate([switchX, switchY, 3]) {
                rotate([90, 0, 90]) {
                    SwitchPlaceholder();
                }
            }
            if (flat) {
                translate([-5, 25, -5]) {
                    cube([60, 110, 20]);
                }
                translate([-22, -10, -5]) {
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
    translate([keyboardX + 2.5, keyboardY, 15.7]) {
        if (!noKeys) {
            KeyboardKeys();
        }
    }
    translate([43.5, 13, 3]) {
        rotate([0, 0, 90]) {
            SwitchMounting();
        }
    }
    KeyboardMounting();
}

module KeyboardMounting() {
    // Front wall
    translate([keyboardX - 2, keyboardY - 1.5, 8]) {
        cube([46, 1.2, 8]);
    }
    // Back wall
    translate([keyboardX - 2, keyboardY + 44.5, 8]) {
        cube([46, 1.2, 8]);
    }
    
    translate([keyboardX - 2, keyboardY - 0.5, 8]) {
        Mounting1();
    }
    translate([keyboardX - 2, keyboardY + 20, 8]) {
        Mounting1();
    }
    translate([keyboardX - 2, keyboardY + 40, 8]) {
        Mounting1();
    }
    
    translate([keyboardX + 39.5, keyboardY + 2, 8]) {
        Mounting2();
    }
    translate([keyboardX + 39.5, keyboardY + 19, 8]) {
        Mounting2();
    }
    translate([keyboardX + 39.5, keyboardY + 38, 8]) {
        Mounting2();
    }
    
    module Mounting1() {
        cube([2, 5, 8]);
        translate([1, 0, 0]) {
            cube([2, 5, 1.5]);
        }
    }
    
    module Mounting2() {
        cube([1.5, 5, 8]);
        translate([-1, 0, 0]) {
            difference() {
                translate([0, 0, 0]) {
                    cube([2, 5, 1.5]);
                    difference() {
                        translate([0.5, 2, 4]) {
                            rotate([105, 0, 90]) {
                                cube([1, 5, 2]);
                            }
                        }
                        translate([0, 1.5, 3]) {
                            cube([1, 2, 4]);
                        }
                    }
                }
                translate([0, 0, 0]) {
                    translate([-2, -0.5, 0.25]){
                        rotate([0, 45, 0]) {
                            cube([3, 6, 2]);
                        }
                    }
                }
            }
        }
    }
}

module KeyboardKeys() {
    vSpace = 3.6;
    hSpace = 3.2;
    switchSize = 6; // 6mm
    
    labelIndex = 0;
    labels = [
        ["x", "2", "1", "0"],
        ["M", "5", "4", "3"],
        ["_", "8", "7", "6"],
        ["=", ">", "9", "<"]
    ];
    offsetX = [
        [0, 0, 0, 0],
        [-0.75, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
    ];
    offsetY = [
        [0.5, 0, 0, 0],
        [0, 0, 0, 0],
        [2.75, 0, 0, 0],
        [0.75, 0.75, 0, 0.75]
    ];
    for (y = [0:3]) {
        for (x = [0:3]) { 
            translate([
                1.5 + (switchSize + vSpace) * x, 
                2.5 + (switchSize + hSpace) * y, 
                -0.0]
            ) {
                difference() {
                    {
                        translate([0.125, 0.125, 0.25]) {
                            minkowski() {
                                sphere(d = 1);    
                                cube([4.75, 4.75, 1.5]);
                            }
                        }
                    }
                    {
                        translate([4 - offsetX[y][x], 4.5 - offsetY[y][x], 1.5]) {
                            rotate(180, [0,0,1]) {
                                linear_extrude() 
                                    text(
                                        text = labels[y][x], 
                                        size = 4, 
                                        font ="Helvetica:style=Bold"
                                    );
                            }
                        }
                        translate([-1, -1, -1]) {
                            cube([7, 7, 1]);
                        }
                    }
                }
                        translate([-1, -1, 0]) cube([7, 7, 0.25]);
            }
            translate([4, 4 + y * 9, 0]) cube([29.5, 2, 0.25]);
        }
        translate([3 + y * 9.5, 3, 0]) cube([2, 30, 0.25]);
    }
}

module DisplayFrame() {
    frameHeightOffset = -2;
    frameHeight = 12;
    xPos = (displayBoardWidth - displayWidth) / 2;
    yPos = 58; // 8mm
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
    x = 11 + 30 / 2; // Hole X position offset
    y = 12 + 30 / 2; // Hole Y position offset
    d = 29; // Diameter of the bolt
    sd = 16; // Screw hole diameter
    h = 52; // Height of the bolt
    hOffset = 0;
    scale([0.1, 0.1, 0.1]) {
        translate([x, y, hOffset]) { Bolt(); }
        translate([displayBoardWidth - x, y, hOffset]) { Bolt(); }
        translate([x, displayBoardHeight - y, hOffset]) { Bolt(); }
        translate([displayBoardWidth - x, displayBoardHeight - y, hOffset]) { Bolt(); }    
    }
    
    module Bolt() {
        difference() { 
            translate([0, 0, 0]) {
                cylinder(h, d = d);
                translate([-d, -5, 28]) cube([d * 2, 10, 15]);
                translate([-5, -d, 28]) cube([10, d * 2 + 5, 15]);
            }
            translate([0, 0, -2]) cylinder(h, d = sd);
        }
    }
}

module SwitchMounting() {
    padding = 1;
    difference() {
        translate([0, 0, 0]) {
            cube([9 + padding * 2, 3 + padding * 1, 3.6 +  + padding]);
            translate([0, 0.5, 1]) {
                rotate([45, 0, 0]) {
                    cube([9 + padding * 2, 5, 7]);
                }
            }
        }
        {
            translate([1, 3.5, -0.4]) 
                rotate([90, 0, 0]) 
                    scale([1, 1.1, 1]) 
                        SwitchPlaceholder();
            translate([-1, -6, -1]) cube([14, 6, 12]);
            translate([1, 5.5, -1.5]) rotate([90, 0, 0]) SwitchPlaceholder();
        }
    }
}

module DisplayPlaceholder() {
    // https://www.waveshare.com/1.3inch-oled-b.htm
    // https://botland.com.pl/wyswietlacze-oled/4441-wyswietlacz-oled-niebieski-graficzny-13-b-128x64px-spi-i2c-proste-zlacza-waveshare-10451-5904422371968.html
    thickness = 15; // 1.8mm
    d = 30; // Hole diameter, 3mm
    x = 11 + 30 / 2; // Hole X position offset
    y = 12 + 30 / 2; // Hole Y position offset
    scale([0.1, 0.1, 0.1]) {
        difference() {
            cube([displayBoardWidth, displayBoardHeight, thickness]);
            {
                translate([x, y, -1]) { cylinder(50, d = d); }
                translate([displayBoardWidth - x, y, -1]) { cylinder(50, d = d); }
                translate([x, displayBoardHeight - y, -1]) { cylinder(50, d = d); }
                translate([displayBoardWidth - x, displayBoardHeight - y, -1]) { cylinder(50, d = d); }
            }
        }
        xPos = (displayBoardWidth - displayWidth) / 2;
        yPos = 58;
        translate([xPos, yPos, 20]) {
            color("black") {
                cube([displayWidth, displayHeight, 30]);
            }
        }
    }
}

module KeyboardPlaceholder() {
    width = 394; // 39.4mm
    height = 441; // 44.1mm
    thickness = 15; // 1.5mm
    scale([0.1, 0.1, 0.1]) {
        
        // Board
        color("green") {
            cube([width, height, thickness]);
        }
        
        offsetLeft = 35; // 5.5mm
        offsetTop = 20; // 2mm
        vSpace = 36; // 3.6mm
        hSpace = 32; // 2.8mm
        switchSize = 60; // 6mm
        
        translate([offsetLeft, offsetTop, 0]) {
            for (y = [0:3]) {
                for (x = [0:3]) {                     
                    translate([
                        (switchSize + vSpace) * x, 
                        (switchSize + hSpace) * y, 
                        18]
                    ) {
                        TactSwitch(switchSize);
                    }
                }
            }
        }
    }
    
    module TactSwitch(size) {
        height = 32; // 3.2mm
        color("black") {
            cube([size, size, height - 1]);
        }
        translate([0, 0, height - 1]) {
            cube([size, size, 1]);
        }
        translate([30, 30, 30]) {
            cylinder(10, d = 35);
        }
    }
}

module SwitchPlaceholder() {
    cube([9, 4, 3.6]);
    translate([3.6, 1.3, 3.6]) cube([1.5, 1.5, 2.3]);
    
    // cables
    rotate([90, 0, 0]) {
        translate([2, 0, 0]) cylinder(h = 12, d = 1);
        translate([4.5, 0, 0]) cylinder(h = 12, d = 1);
        translate([7, 0, 0]) cylinder(h = 12, d = 1);
    }
}

module PowerModulePlaceholder() {
    cube([27.6, 17.1, 1.7]);
    // USB connector
    translate([0, (17.1 - 7.5) / 2, 1.7]) cube([5.4, 7.5, 2.8]);
    // Jumper
    translate([12.2, 1, 1.7]) cube([2.2, 3.9, 6.3]);
    // Battery connector
    translate([9, 17.1 - 1.8 - 5, 1.7]) cube([3.5, 5, 7.5]);
}