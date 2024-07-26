

import("C:/Users/darek/Downloads/Halter_SIG_003-V2_22mm.stl");

translate([-6.7, 18, 45]) 
    rotate([20, 40, -68]) 
        minkowski($fn = 30) {
            cube([33, 5, 4]);
            cylinder(d = 2);
        }