
difference() {
    stand();
    translate([0,0,-69]) cube(150, true);
    translate([-23,0,9]) #cylinder(d = 14, h = 20, $fn = 180);
}

module stand() {
    import("tray_brush_head_stand.stl");
    translate([32,0,4]) brush_end_stand();
    translate([8,0,4]) brush_end_stand();
    //translate([-23.35,0,4]) cylinder(d = 6.5, h = 18.8, $fn = 180);
    translate([-39.5,-66,5.85]) tunnel();
}


module tunnel() {
    intersection() {
        import("Oral-b_iO_Wall_Mount_single.stl");
        translate([13.5,66,-1]) cylinder(d = 34, h = 100, $fn = 180);
    }
}

module brush_end_stand() {
    d = 10;
    h = 16;
    cylinder(d = d, h = h, $fn = 180);
    translate([0, 0, h]) sphere(d = d,$fn = 180);
}