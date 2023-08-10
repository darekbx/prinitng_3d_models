$fn = 10;

translate([0, 0, -4]) scale([0.125, 0.125, 1]) linear_extrude(height = 5) import("/Users/darek/Documents/bambilotto/bambilotto_no_text.svg", center = false, dpi = 96);
translate([0.5, 0.5, -4]) scale([0.1225, 0.1225, 1]) linear_extrude(height = 5) import("/Users/darek/Documents/bambilotto/bambilotto_no_text.svg", center = false, dpi = 96);

translate([24.5, 24.5, 0]) cylinder(d = 52, h = 3);
translate([24.5, 24.5, 3]) cylinder(d1 = 52, d2 = 26, h = 25);
translate([24.5, 24.5, 3 + 25]) cylinder(d1 = 26, d2 = 46, h = 20);
translate([24.5, 24.5, 3 + 25 + 20]) cylinder(d1 = 46, d2 = 46, h = 2);