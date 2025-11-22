
$fn = 100;

scale(0.1) {
    r30();
    //translate([0, 240, 0]) r35();
}

module r35() {
    translate([-160, -10, 0]) scale([0.65, 0.62, 1]) rotate([180,0,0]) linear_extrude(20) 
    import("C:/Users/darek/Downloads/rim_35.svg");
    //#cube([350, 10, 15]);
    //translate([175 - 5, 0, 0]) #cube([10, 210, 15]);
}

module r30() {
    translate([-273, 685, 0]) scale([2.34, 2.16, 1]) rotate([180,0,0]) linear_extrude(42) 
    import("C:/Users/darek/Downloads/rim_e_30.svg");
    //#cube([300, 10, 15]);
    //translate([150 - 5, 0, 0]) #cube([10, 200, 15]);
}

module rim() {
    difference() {
        linear_extrude(42) polygon(points=[
            [2, 3],
            [2, 63],
            [69, 151],
            [147, 226],
            [176, 239],
            [217, 239],
            [249, 226],
            [326, 151],
            [394, 63],
            [394, 3],
            [370, 3],
            [377, 16],
            [377, 60],
            [301, 61],
            [251, 86],
            [198, 95],
            [143, 86],
            [94, 60],
            [18, 60],
            [18, 16],
            [26, 3]
        ]);

        translate([29, 40, -1]) scale([0.85, 0.70, 1.0]) linear_extrude(44) polygon(points=[
            [69, 151],
            [147, 226],
            [176, 239],
            [217, 239],
            [249, 226],
            [326, 151],
            [377, 60],
            [301, 61],
            [251, 86],
            [198, 95],
            [143, 86],
            [94, 60],
            [18, 60],
        ]);
    }
}