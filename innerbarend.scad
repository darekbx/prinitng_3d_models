
difference() {
    scale([1, 1, 0.75]) import("C:/Users/darek/Downloads/inner_bar_ends_v1.2-.stl");
    translate([-15, -17.2, 9]) {
        rotate([0, 90, 0]) cylinder(d = 4.5, h = 30, $fn = 90);
        translate([20, 0, 0]) #rotate([0, 90, 0]) cylinder(d = 8, h = 20, $fn = 90);
        translate([-10, 0, 0]) #rotate([0, 90, 0]) cylinder(d = 8, h = 20, $fn = 6);
    }
}