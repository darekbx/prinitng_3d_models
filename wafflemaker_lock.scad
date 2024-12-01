$fn = 90;

h = 47;
w = 42.5;

difference() {
    minkowski() {
        sphere(2);
        cube([h + 8, w + 8, 4], true);
    }
    #cube([h, w, 10], true);
}