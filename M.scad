$fn = 25;
showLock = true;

if (!showLock) {
    M();
    translate([8, 42, 3]) Mount();
    translate([8, 18, 3]) Mount();
    translate([56, 42, 3]) Mount();
    translate([56, 18, 3]) Mount();
    // In place
    //translate([10.1, 14, 4.5]) #Lock();
} else {
    translate([10.1, 14, 4.5]) Lock();
}

module Lock() {
    cube([3.8, 38, 2]);
    translate([-1.1, 0, 0]) cube([6, 3, 2]);
}

module Mount() {
    difference() {
        cube([8, 4, 6]);
        translate([2, -1, 0]) cube([4, 10, 4]);
    }
}

module M() {
    scale([6, 5, 3]) {
        minkowski() {
            linear_extrude(1)
                text("M", font = "Calibri");
            sphere(r=0.35);
        }
    }
}
