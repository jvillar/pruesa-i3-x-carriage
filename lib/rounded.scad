module rounded_corner(rx=1, ry=2, rz=3)
{
	if (rx == ry && ry == rz)
	{
		sphere(r = rx);
	}
	else
	{
		cylinder(r = rz, h = 0.01);
		minkowski() 
		{
			cylinder(r = rz, h = 0.01);
			rotate ([0, 90, 0])
				cylinder(r = rx, h = 0.01);
			rotate ([90, 0, 0])
				cylinder(r = ry, h = 0.01);
		}
	}
}

module rounded_cube(x, y, z, rx=1, ry=1, rz=1, noback=true, nobottom=false, notop=false)
{
	$fs = 0.15;
	union()
	{
		corner_x_radius = (rx == ry && ry == rz) ? rx : rz+ry;
		corner_y_radius = (rx == ry && ry == rz) ? ry : rz+rx;
		corner_z_radius = (rx == ry && ry == rz) ? rz : rx+ry; 
		translate([corner_x_radius, corner_y_radius, corner_z_radius]) 
			minkowski() 
			{
				cube([x-2*corner_x_radius, y-2*corner_y_radius, z-2*corner_z_radius]);
				rounded_corner(rx=rx, ry=ry, rz=rz);      
			}
//			hull() // extremely slow
//			{ 
//				for (x_pos =[corner_x_radius ,x-corner_x_radius])
//					for (y_pos =[corner_y_radius ,y-corner_y_radius])
//						for (z_pos =[corner_z_radius ,z-corner_z_radius])
//							translate([x_pos, y_pos, z_pos])
//								rounded_corner(rx=rx, ry=ry, rz=rz);      
//			}
		
		if (noback)
		{
			minkowski()
			{
				translate([ry, y/2, ry])
					cube([x-ry*2, y/2, z-ry*2]);
				rotate ([90, 0, 0])
					cylinder(r = ry, h = 0.01);
			}
		}
		
		if (nobottom)
		{
			minkowski()
			{
				translate([rz, rz, 0])
					cube([x-rz*2, y-rz*2, z/2]);
				rotate ([0, 0, 0])
					cylinder(r = rz, h = 0.01);
			}
		}
		
		if (notop)
		{
			minkowski()
			{
				translate([rz, rz, z/2])
					cube([x-rz*2, y-rz*2, z/2]);
				rotate ([0, 0, 0])
					cylinder(r = rz, h = 0.01);
			}
		}
	}
}

module rounded_cylinder(r, h, rrnd = 1, rtop = true, rbottom = false, center=false)
{
	$fs = 0.15;
	htr = center ? -h/2 : 0;
	translate([0, 0, htr])
		union()
		{
        	minkowski()
			{
				translate([0,0,rrnd])
					cylinder(r=r-rrnd, h=h-rrnd*2);
				sphere(rrnd);
        	}
			if (!rbottom) 
				translate([0,0,h/2]) cylinder(r=r, h=h/2);
			if (!rtop) 
				translate([0,0,0]) cylinder(r=r, h=h/2);        
		}
}


//rounded_cube(x=50, y=25, z=15, rx=2, ry=2, rz=2, noback=true, nobottom=false, notop=false);
//rounded_cylinder(r=5, h=10, rrnd = 1, rtop = true, rbottom = true, center=false);

