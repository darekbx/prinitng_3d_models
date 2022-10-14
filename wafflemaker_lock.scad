$fn = 90;

h = 47;
w = 42.5;

difference() {
    minkowski() {
        sphere(2);
        cube([h + 5, w + 5, 1], true);
    }
    #cube([h, w, 8], true);
}