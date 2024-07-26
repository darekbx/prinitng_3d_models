$fn = $preview ? 30 : 180;

bottle_diameter = 85;
height = 29.38;
cutout = 6;
screw_diameter = 4.8;

difference() {
    cylinder(d = bottle_diameter + 2.5, h = height);
    
    // bottle
    translate([0, 0, -1]) cylinder(d = bottle_diameter, h = 50);
    
    // cutout
    translate([42, 0, 20]) cube([10, cutout, 50], true);
}

!translate([0, 0, 50]) topMount();

//#translate([-47.7, 0.3, 10])cylinder(d = 4.6, h = 80);

module topMount() {
    d = 26;
    h = 4;
    c = 4;
        
    difference() {
        translate([0, 0, 1]) { 
            translate([0, 0, 3]) cylinder(d = d + 4 +(3.6 * 2), h = h);
            cylinder(d = d + 4, h = h - 1);
        }
        cylinder(d = d, h = h + 10);
        translate([0, 0, 5]) cylinder(d = d +(3.6 * 2), h = 5);
        
        // cutout
        translate([14, 0, 2]) cube([c + 10, c, h + 12], true);
    }
    
    // screw mount
    difference() {
        translate([18.5, 0, h / 2]) {
            translate([1, c / 2 + 1, 1]) {
                cube([14, 2, h], true);
                translate([2, 0, 3]) cube([10, 2, h], true);
                translate([-4, 1.5, 0]) 
                    rotate([0, 0, 45]) 
                        cube([1, h, h], true);
            }
        translate([1, -c / 2, 1]) 
            cube([14, 2, h], true);
            translate([3, -2, 4]) cube([10, 2, h], true);
            translate([-4, -3.75, 1]) 
                rotate([0, 0, -45]) 
                    cube([1, h, h], true);
        }
        translate([14, 0, 0]) {
            position = 1.5;
            translate([8.5, 0, 6 - position]) 
                rotate([0, 90, 90]) 
                    cylinder(d = screw_diameter, h = 30, center = true);
        }
    }
    
    translate([-35.75, -7.8, 0.2]) {
        rotate([0, 0, 90]) drawBeam(3, 3);
        translate([16, 0, 0]) rotate([0, 0, 90]) drawBeam(3, 3);
        translate([-3.7, -3.7, 0]) drawBeam(3, 3);
        translate([-3.7, 12.4, 0]) drawBeam(3, 3);
        
        difference() {
            translate([15.5, -2, 0]) cube([6, 20, 7.8]);
            translate([35.75, 7.8, -0.2]) {
                translate([0, 0, 5]) cylinder(d = d +(3.6 * 2), h = 5);
            }
        }
    }
}

// liftarms
difference() {
    rotate([90, 0, 0]) translate([-0.5, height/2, -20]) {
        translate([-51, 43, 23.5]) 
            rotate([0, 90, 0]) {
                beam5();
            }
            
        translate([-43.5, 0.02, 19.5]) 
                cube([1, 7.8, 35], true);
        translate([-67, 43, 23.5]) 
            rotate([0, 90, 0])
                beam5();
        translate([-51, 43, -0.2]) 
            rotate([0, 0, 0])
                beam5(3);
        translate([-51, 43, 32]) 
            rotate([0, 0, 0])
                beam5(3);
        translate([-51, 43, 32/2]) 
            rotate([0, 0, 0])
                beam5(3);
    }
    
    // bottle
    translate([0, 0, -1]) cylinder(d = bottle_diameter, h = 50);
}

module beam5(NrOfFilledHoles=5) {
    translate([-12.1, -39.09, 0]) rotate([90, 0, 0]) drawBeam(5, NrOfFilledHoles);
}

// screw mount
difference() {
    translate([48, 0, height / 2]) {
        translate([0, cutout / 2 + 1, 0]) {
            cube([12, 2, height], true);
            translate([-4, 1, 0]) 
                rotate([0, 0, 45]) 
                    cube([1, 4, height], true);
        }
        translate([0, -cutout / 2 - 1, 0]) 
            cube([12, 2, height], true);
            translate([-4, -5, 0]) 
                rotate([0, 0, -45]) 
                    cube([1, 4, height], true);
    }
    translate([48, 0, 0]) {
        position = 8;
        translate([0, 0, height - position]) 
            rotate([0, 90, 90]) 
                cylinder(d = screw_diameter, h = 30, center = true);
        translate([0, 0, position]) 
            rotate([0, 90, 90]) 
                cylinder(d = screw_diameter, h = 30, center = true);
    }
}


eps = 0.05*1;
Pitch = 8*1;
Radius1 = 4.8 / 2;
Radius2 = 6.1 / 2;
Height = 7.8*1;
Depth = 0.8*1;
Width = 7.5*1;
MidThickness = Height;
MiniCubeOffset = 1.1*1; // was 0.9
MiniCubeWidth = Radius1 - MiniCubeOffset;
CrossInnerRadius = 1.5*1;

module drawBeam(NrOfHoles, NrOfFilledHoles)
{
	Length = (NrOfHoles - 1) * Pitch;
	Thickness = (Width - 2 * Radius2) / 2;

	difference()
	{
		union()
		{			
			cube([Length, Thickness, Height]);
			translate([0, Width-Thickness,0]) cube([Length, Thickness, Height]);
			translate([0, 0, Height/2-MidThickness/2]) cube([Length, Width, MidThickness]);
			for (i = [1:NrOfHoles])
			{
				translate([(i-1)*Pitch, Width/2,0]) 
				{
					cylinder(r=Width/2, h=Height);
				}
			}
		}

		union()
		{
			for (i = [1:NrOfFilledHoles])
			{
				translate([(i-1)*Pitch, Width/2,0]) 
				{
					translate([0,0,-eps]) cylinder(r=Radius2,h=Depth+eps);
					translate([0,0,-eps]) cylinder(r=Radius1,h=Height+2*eps);
					translate([0,0,Height-Depth]) cylinder(r=Radius2,h=Depth+eps);
				}
			}
		}
	}
}