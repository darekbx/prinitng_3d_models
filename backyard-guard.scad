$fn = $preview ? 50 : 90;

!translate([0, 40, 0]) Back();
//PIRScrewMount();

Case();
translate([0, -35 + 2.5, 0]) PIRMount();

module PIRScrewMount() {
  difference() {
        cube([14, 2, 5], true);
        translate([0, 1, 0]) 
            rotate([90, 0, 0]) 
                translate([0, 0, -1]) cylinder(d = 2.5, h = 6);
    }   
}

module Back() {
    difference() {
        translate([0, 0, 0]){
            cube([53, 2, 53], true);
            translate([0, -1, 0]) cube([49.8, 2, 49.8], true);
        }
        translate([0, 10, 0]) ScrewsGuide(true);
    }  
    translate([0, 13.5, 0]) cube([53, 27, 25], true);
}

module Case() {
    tempertureSensorDepth = -30;
    
    translate([0, -20, 0]) difference() {
        cube([53, 28 + 2, 53], true);
        cube([50, 74, 50], true);
        
        //Cut off for cable
        translate([0, 14.1, -26]) cube([5, 2.5, 5], true);
        
        //Cut off for faster printing
        //translate([0, 10, 0]) cube([70, 65, 70], true);
        
    }
    
    // PIR sides fill
    translate([-19, -34, 0]) cube([14, 2, 50], true);
    difference() {
        translate([19, -34, 0]) cube([14, 2, 50], true);
        
        //Cut off for temperature sensor
        translate([0, tempertureSensorDepth, 0]) 
            translate([19, 0, 0]) 
                cube([4.5, 8, 4.5], true);
    }
    
    translate([0, -34, -24]) cube([50, 2, 4], true);
    translate([0, -34, 24]) cube([50, 2, 4], true);
    
    // Temp sensor hole
    translate([19, tempertureSensorDepth, 0]) difference() {
        cube([8, 6, 8], true);
        translate([0, 2, 0]) cube([4.5, 20, 4.5], true);
    }
    
    // Atom mount
    translate([-18.5, -28, 7.25]) difference() {
        cube([9.8 + 4, 10, 24.5 + 4], true);
        cube([9.8, 20, 24.5], true);
        translate([0, 6, -14]) cube([9.8, 10, 5], true);
    }
    
    // Screws guide
    ScrewsGuide();
}

module ScrewsGuide(onlyBolts = false) {
    translate([-22.75, -6, -22.75]) ScrewMount(onlyBolts);
    translate([22.75, -6, -22.75]) ScrewMount(onlyBolts);
    translate([22.75, -6, 22.75]) ScrewMount(onlyBolts);
    translate([-22.75, -6, 22.75]) ScrewMount(onlyBolts);
}

module ScrewMount(onlyBolts) {
    rotate([90, 0, 0]) {
        if (onlyBolts) {
            translate([0, 0, -0.1]) cylinder(d = 3 + 0.25, h = 15);
        } else {
            difference() {
                cylinder(d = 6.5, h = 27);
                translate([0, 0, -0.1]) cylinder(d = 3, h = 15);
            }
        }
    }
}

module PIRMount() {
    pir_diameter = 10;
    
    difference() {
        translate([0, 0, 0]) {
            difference() {
                difference() {
                    
                    // Main shape
                    cube([26, 5, 45], true);
                    
                    // PIR sensor hole
                    translate([0, 10, 10]) 
                        rotate([90, 0, 0]) 
                            cylinder(d = pir_diameter, h = 40);
                    
                    // Front cut off
                    translate([0, -10, 10]) sphere(d = 23);
                }
                // Cut off for connector
                translate([0, 0.9, -(3 + 9)]) cube([11, 4, 14], true);
            }
            
            // Screw guide
            translate([0, 4.9, 2.5 - 4.4]) 
                rotate([90, 0, 0]) 
                    cylinder(d = 5, h = 2.9);
            
            // Supports
            translate([8, 3.7, 4.4]) 
                rotate([90, 0, 0]) 
                    cylinder(d = 4, h = 1.8);
            translate([-7, 3.7, 15]) 
                rotate([90, 0, 0]) 
                    cylinder(d = 4, h = 1.8);
        }
        
        // Screw hole
        translate([0, 4.5, 2.5 - 4.4]) 
            rotate([90, 0, 0]) 
                translate([0, 0, -1]) cylinder(d = 2, h = 6);
    }
}