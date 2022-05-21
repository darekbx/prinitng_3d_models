
$fn = 180;
thickness = 2.35;
corner = 2;

difference() {
    handle();
    {
        topHole();
        bottomHole();
    }
}


module handle() {
    
    // Plate
    difference() {
        cube([11.3, 33.3, thickness]);
        {
            translate([0, 0, 0]) {
                fillet(corner, 5);
            }
            translate([11.3, 0, 0]) {
                rotate([0, 0, 90]) {
                    fillet(corner, 5);
                }
            }
        }
    }
    
    // Bottom thickening
    translate([15.5 - ((15.5 - 11.3) / 2), 33.3, 0]) {
        rotate([0, 0, 180]) {
            difference() {
                cube([15.5, 6, thickness]);
                {
                    translate([0, 0, 0]) {
                        fillet(corner, 5);
                    }
                    translate([15.5, 0, 0]) {
                        rotate([0, 0, 90]) {
                            fillet(corner, 5);
                        }
                    }
                }
            }
        }
    }
}

module topHole() {
    holeDiameter = 3;
    holeRadius = holeDiameter / 2;
    translate([4.1 + holeRadius, 3.2 + holeRadius, -2]) {
        cylinder(h=10, r=holeRadius);
    }
}

module bottomHole() {
    holeXDiameter = 3;
    holeYDiameter = 5;
    holeXRadius = holeXDiameter / 2;
    holeYRadius = holeYDiameter / 2;
    translate([4.1 + holeXRadius, 19.7 + holeXRadius, -2]) {
        cylinder(h=10, r=holeXRadius);
    }
    translate([4.1 + holeXRadius, 19.7 + holeXRadius + holeYRadius / 1.25, -2]) {
        cylinder(h=10, r=holeXRadius);
    }
    translate([4.1, 19.7 + holeXRadius / 1, -2]) {
        cube([3, 2, 5]);
    }
}

module fillet(r, h) {
    translate([r / 2, r / 2, 0])

        difference() {
            cube([r + 0.01, r + 0.01, h], center = true);

            translate([r/2, r/2, 0])
                cylinder(r = r, h = h + 1, center = true);

        }
}