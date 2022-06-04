$fn = 180;

switchDiameter = 20;

difference() {
    Box();
    translate([(switchDiameter + 25 + 4) / 2, (switchDiameter + 15 - 4)/ 2, -1.1]) {
        color("#50AA00") {
            SwitchPlaceholder();
        }
    }
}

translate([50, 40, 2]) {
    rotate([0, 180, 0]) { 
        Cover();
    }
}

module Box() {
    difference() {
        minkowski() {
            sphere(d = 2);
            cube([50, 30, 26]);
        }
        {
            translate([1, 1, 2.5]) {
                cube([48, 28, 40]);
            }  
            translate([-5, -5, 26]) {
                cube([60, 40, 5]);
            }
            translate([-3, 5, 23]) {
                minkowski() {
                    sphere(d = 1);
                    cube([6, 5, 3]);
                }
            }
            translate([46, 21, 23]) {
                minkowski() {
                    sphere(d = 1);
                    cube([6, 5, 3]);
                }
            }
        }
    }
}

module Cover() {
    difference() {
        minkowski() {
            sphere(d = 2);
            cube([50, 30, 2]);
        }
        translate([-5, -5, -3.1]) {
            cube([60, 40, 5]);
        }
    }
    translate([1.2, 1.2, 1]) {
        difference() {
            cube([47.6, 27.6, 1]);
            translate([1, 1, -0.5]) {
                cube([45.6, 25.6, 3]);
            }
        }
    }
}

module SwitchPlaceholder() {
    cylinder(d = switchDiameter, h = 4.5);
    translate([0, 0, -0.6]) {
        cylinder(d = 23, h = 0.5);
    }
    translate([-7.5, -5, 4.5]) {
        minkowski() {
            cylinder(d = 2, h = 1);
            cube([15, 10, 10]);
        }
    }
    // Connectors
    translate([0, -2.5, 14]) {
        cube([1, 5, 7]);
        translate([6, 0, 0]) cube([1, 5, 7]);
        translate([-6, 0, 0]) cube([1, 5, 7]);
    }
}