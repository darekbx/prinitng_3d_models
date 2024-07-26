$fn = 90;
size = 45;
lean = 20;

minkowski() {
    linear_extrude(0.1) {
        polygon(points = [ 
            [0, 0],
            [size, 0],
            [size - lean, size],
            [- lean, size],
        ]);
    }
    sphere(1);
}

translate([6, -7.8, -3.5])
    rotate([0, 0, 0]) 
        drawBeam(5);

difference() {
    translate([18.1, -7.8, 8.44]) {
        translate([-8.1, 0, 0])
            rotate([0, 90, 0])
                drawBeam(3);
        translate([8.1, 0, 0])
            rotate([0, 90, 0])
                drawBeam(3);
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

module drawBeam(NrOfHoles)
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
			for (i = [1:NrOfHoles])
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