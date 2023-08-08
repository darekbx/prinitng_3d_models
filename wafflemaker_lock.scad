$fn = 90;

h = 47;
w = 42.5;

difference() {
    minkowski() {
        sphere(2);
        cube([h + 6, w + 6, 2], true);
    }
    #cube([h, w, 8], true);
}