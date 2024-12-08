// IQ Mini

difference() {
    translate([0, -9, 0]) {
        translate([2.1, 1, 30]) rotate([90, 0, 0]) scale([1.1, 1, 1]) import("skadisHook.stl");
        translate([2.1, 40.5, 30]) rotate([90, 0, 0]) scale([1.1, 1, 1]) import("skadisHook.stl");
    }
    translate([5, -11, 11]) cube([20, 46, 10]);
}

translate([0, -10, 12.5]) cube([4, 43.5, 40]);

translate([0, -1, 0]) mount();
translate([0, 20, 0]) mount();

//#translate([0, 0, 0]) cube([1,25,1]);
//#translate([-2, 0, 3]) cube([12,1,71.5]);

// Mount
module mount() {
    translate([-0, 0, 1]) cube([4, 4, 76]);
    translate([-6, 0, 1]) difference() {
        cube([8, 4, 6]);
        translate([-1, -1, 2]) cube([8, 6, 1.7]);
    }
    translate([-6, 0, 71]) difference() {
        cube([8, 4, 6]);
        translate([-1, -1, 2]) cube([8, 6, 1.7]);
    }
    translate([-25.5, 0, 74.7]) cube([25, 4, 2.3]);
    translate([-25.5, 0, 72]) cube([2, 4, 4]);

    translate([-25.5, 0, 1]) cube([25, 4, 2]);
    translate([-25.5, 0, 2]) cube([2, 4, 4]);
}


//MI Monitor
/*
// Frame
module hook() {
    translate([2.1, 1, 30]) rotate([90, 0, 0]) scale([1.1, 1, 1]) import("skadisHook.stl");
    translate([2.1, 40, 30]) rotate([90, 0, 0]) scale([1.1, 1, 1]) import("skadisHook.stl");
    //translate([0, 0, 15]) cube([4, 42, 40]);
}

difference() {
    hook();
    translate([5, -5, -20]) cube([10, 50, 40]);
}
translate([3, -1, 47]) cube([11, 4, 3]);
translate([3, 38, 47]) cube([11, 4, 3]);

translate([3, 20, 34]) rotate([90, 0, 270]) import("Xiaomi_Mi_Temperature_and_Humidity_Monitor_2.stl");
*/