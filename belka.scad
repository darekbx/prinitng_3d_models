//4/126
$fn = 90;

rotate([0, 90, 0]) {
    minkowski() {
        sphere(r=2);
        cylinder(h=126 - 2,d=0.1);
    }
    //translate([0, 0, -1]) #cylinder(h=126,d=4);
}