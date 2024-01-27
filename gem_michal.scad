

/*
CubePoints = [
  [  1,  0,  0 ],
  [ 0,  1,  0 ],
  [ 0,  8,  0 ],
  [  1,  9,  0 ],
  [  20,  9,  0 ],
  [  21,  8,  0 ],
  [  21,  1,  0 ],
  [  20,  0,  0 ],
  [  1,  0,  0 ],
 ];
 
for(point = CubePoints) {
  #translate(point)cylinder(d = 0.1, h = 1, $fn = 36);
}

CubeFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3],

  [7,4,0,3],
]; // left
  
polyhedron( CubePoints, CubeFaces );
*/
/*
difference() {
    cube([20, 10, 2], true);
    translate([10, 5, 0]) rotate([0, 0, 45]) cube([3, 3, 3], true);
    translate([10, -5, 0]) rotate([0, 0, -45]) cube([3, 3, 3], true);
    translate([-10, 5, 0]) rotate([0, 0, 45]) cube([3, 3, 3], true);
    translate([-10, -5, 0]) rotate([0, 0, -45]) cube([3, 3, 3], true);
}

translate([7.567, 2.567, 0.82]) rotate([0, -45, 45]) cube([3, 3, 2.5], true);
translate([7.567, -2.567, 0.82]) rotate([0, -45, -45]) cube([3, 3, 2.5], true);
translate([-7.567, 2.567, 0.82]) rotate([0, 45, -45]) cube([3, 3, 2.5], true);
translate([-7.567, -2.567, 0.82]) rotate([0, 45, 45]) cube([3, 3, 2.5], true);

translate([0, 0, 1.75]) scale([0.8, 0.7, 1]) difference() {
    cube([20, 10, 2], true);
    translate([10, 5, 0]) rotate([0, 0, 45]) cube([3, 3, 3], true);
    translate([10, -5, 0]) rotate([0, 0, -45]) cube([3, 3, 3], true);
    translate([-10, 5, 0]) rotate([0, 0, 45]) cube([3, 3, 3], true);
    translate([-10, -5, 0]) rotate([0, 0, -45]) cube([3, 3, 3], true);
}
*/
/*
top();
translate([0, 0, -3]) mirror([0, 0, 1]) top();

module top() {
    parts();
    mirror([1, 0, 0]) parts();
}

module parts() {
    part();
    translate([0, 0, 0]) mirror([0, 1, 0]) part();
}

//!part();

module part() {
    s = 1.25;
    r = 28;
    a = 62;
    
    scale([1, 1, 0.8]) difference() {
        cube([20, 10, 4], true);
        translate([10, -5, 0]) rotate([0, 0, -r]) cube([s, s*2, 5], true);
        translate([9, -4, 1.5]) rotate([0, -a, -r]) cube([3, s, 10], true);
        
        translate([0, 5, 0]) cube([22, 10, 6], true);
        translate([-6, 0, 0]) cube([12, 20, 6], true);
        translate([15.93, 0, 0]) cube([12, 20, 6], true);
        translate([0, -10.88, 0]) cube([20, 12, 6], true);
        
        translate([9.1, -1, 1.08]) rotate([0, -(90 + a) + 3, 0]) cylinder(d = 8.4, $fn = 3, true);
        translate([9.1, -1, 2]) rotate([0, -(90 + a) + 3, 0]) cylinder(d = 8.4, $fn = 3, true);
        translate([9.1, -1, 3]) rotate([0, -(90 + a) + 3, 0]) cylinder(d = 8.4, $fn = 3, true);
        translate([7.1, -1, 2.29]) rotate([0, -(90 + a) + 2.5, 0]) cylinder(d = 8.4, $fn = 3, true);
        
        translate([5, -5.51, 2.45]) rotate([-41.5, 0, 0]) cube([12, 5, 6], true);
    }
}
*/

top();
translate([0, 0, -3]) mirror([0, 0, 1]) top();

module top() {
    parts();
    mirror([1, 0, 0]) parts();
}

module parts() {
    part();
    translate([0, 0, 0]) mirror([0, 1, 0]) part();
}

//!part();

module part() {
    s = 1.25;
    r = 28;
    a = 62;
    
    scale([1, 1, 0.8]) difference() {
        cube([20, 10, 4], true);
        translate([10.1, -5.59, 0]) rotate([0, 0, -20.1]) cube([s, s*2, 5], true);
        translate([9, -4.4, 1.54]) rotate([0, -a, -22]) cube([3, s, 10], true);
        //translate([10, -5, 0]) rotate([0, 0, -r]) cube([s, s*2, 5], true);
        //translate([9, -4, 1.5]) rotate([0, -a, -r]) cube([3, s, 10], true);
        
        translate([0, 5, 0]) cube([22, 10, 6], true);
        translate([-6, 0, 0]) cube([12, 20, 6], true);
        translate([15.93, 0, 0]) cube([12, 20, 6], true);
        translate([0, -10.88, 0]) cube([20, 12, 6], true);
        
        translate([9.1, -1, 1.08]) rotate([0, -(90 + a) + 3, 0]) cylinder(d = 8.4, $fn = 3, true);
        translate([9.1, -1, 2]) rotate([0, -(90 + a) + 3, 0]) cylinder(d = 8.4, $fn = 3, true);
        translate([9.1, -1, 3]) rotate([0, -(90 + a) + 3, 0]) cylinder(d = 8.4, $fn = 3, true);
        translate([7.1, -1, 2.29]) rotate([0, -(90 + a) + 2.5, 0]) cylinder(d = 8.4, $fn = 3, true);
        
        translate([5, -5.51, 3.3]) rotate([-30, 0, 0]) cube([12, 5, 8], true);
        translate([10, -2, 4]) rotate([0, 30, 0]) cube([12, 10, 8], true);
    }
}