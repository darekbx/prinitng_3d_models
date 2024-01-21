$fn = 90;

diameter = 100;
width = 160;
thickness = 2;

difference() {
    cylinder(d = diameter, h = width);
    translate([0, 0, -0.5]) cylinder(d = diameter - thickness * 2, h = width + 1);
    
    translate([-12, 0, width / 2]) cube([100, diameter + 2, width + 2], true);
}