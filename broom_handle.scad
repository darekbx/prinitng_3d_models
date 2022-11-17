$fn = 90;

d1 = 22;
d2 = 22;
d3 = 12; 

mounts();
difference() {
    plate();
    translate([-18, -22, 11]) screwHole();
    translate([-18, 86, 11]) screwHole();
}

module plate() {
    translate([-17.5, -32, 0]) cube([5, 128, 22]);
}

module mounts() {
    translate([0, 0, 0]) mount(d1);
    translate([0, 40, 0]) mount(d2);
    translate([-5, 70, 0]) mount(d3);
}

module screwHole() {
    translate([4, 0, 0]) rotate([0, 90, 0]) cylinder(d1 = 5, d2 = 10, h = 2);
    rotate([0, 90, 0]) cylinder(d = 5, h = 10);
}

module mount(componentDiameter) {
    difference() {
        translate([0, 0, 0]) {
            cylinder(d = componentDiameter + 4, h = 20);
            translate([-componentDiameter / 2 - 2, -componentDiameter / 2 - 2, 10 - 2]) 
                cube([componentDiameter - 8, componentDiameter + 4, 4]);
        }
        {
            translate([0, 0, -50]) cylinder(d = componentDiameter, h = 100);
            translate([12, 0, -50]) cylinder(d = componentDiameter + 4, h = 100);
        }
    }
}