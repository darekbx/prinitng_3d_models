$fn = 90;

difference() {
    cube([126, 9, 7]);
    
    edge_cut();
    translate([126, 0, 0]) mirror([1, 0, 0]) edge_cut();
    translate([27 + 3, 1.2 - 2, 1.5]) cube([66, 7.8, 7]);
    translate([27 + 1, -7.8 + 3.5, 1.5]) cube([70, 7.8, 7]);
}

translate([(126 - 10) / 2, 0, 1.3]) cube([10, 1.3, 2.2]);

translate([(126 - 20) / 2, 9, 0]) cube([20, 20, 7]);

module edge_cut() {
    translate([1.5, 1.2, 1.5]) cube([27, 5.8, 7]);
    translate([1.5 + 6.4, -3.2, 1.5]) cube([27 - 6.4, 7.8, 7]);
    translate([1.5 + 3, -3.2, 3.6]) cube([27 - 6.4, 7.8, 7]);
}