/*import("/users/Darek/Downloads/thread.stl", convexity=3);

scale([1.6, 1, 1]) import("/users/Darek/Downloads/base.stl", convexity=3);*/

//translate([0, 0, 20]) import("/users/Darek/Downloads/screw.stl", convexity=3);
translate([30, 0, 0]) import("/users/Darek/Downloads/screw.stl", convexity=3);

difference() {
    import("/users/Darek/Downloads/screw.stl", convexity=3);
    translate([20, 10, -10]) cube([100, 30, 30]);
}