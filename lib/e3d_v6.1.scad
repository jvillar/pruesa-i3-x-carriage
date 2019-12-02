e3d_v6();

module e3d_v6()
{
	fn=100;
	difference()
	{
		translate([0,0,0])
		{
			cylinder(d=16, h=3.7, $fn=fn);
			translate([0,0,3.7])
			{
				cylinder(d=12, h=6, $fn=fn);
				translate([0,0,6])
				{
					cylinder(d=16, h=3, $fn=fn);
					translate([0,0,3])
					{
						cylinder(r=4.475, h=1.5, $fn=fn);
						translate([0,0,1.5]){
							cylinder(d=16, h=1, $fn=fn);
							translate([0,0,1])
							{
								cylinder(r=4.475, h=1.5, $fn=fn);
								translate([0,0,1.5])
								{
									difference()
									{
									cylinder(r=11.15, h=26, $fn=fn);
									for ( i = [0 : 9] )
										translate([0,0,1+i*2.5])
											e3d_pipe(r=12.15,r2=4.475+i*0.15,h=1.5,fn=fn);
									}
								}
							}
						}
					}
				}
			}
		}
		translate([0,0,-1])
			cylinder(r=1.6,h=44.7, $fn=fn);
	}
	difference()
	{
		union()
		{
			
			translate([0,0,42.7])
				cylinder(r=2, h=4.1, $fn=fn);
			translate([-8,-4.5,46.8])
				cube([16, 20, 11.5]);
			translate([0,0,57.3])
				cylinder(r=2.5, h=3,, $fn=fn);
			translate([0,0,59.3])
				cylinder(r=4.03, h=3, $fn=6);
			translate([0,0,61.3])
				cylinder(r1=3, r2=0.5,h=3, $fn=fn);
		}
		translate([0,0,41.7])
			cylinder(r=1.6,h=21, $fn=fn);
		translate([0,0,62.1])
			cylinder(r=0.25,h=4, $fn=10);

		translate([-9,8,54.3])
			rotate([0,90,0])
				cylinder(r=3.05, h=18, $fn=fn);
		translate([-9,8,53.3])
			cube([18,8.5,2]);
		translate([0,13,45.8])
			cylinder(r=1.4, h=13.5, $fn=fn);
		translate([4.45,-1,53.5])
			rotate([0,90,0])
				cylinder(r=1.4, h=4.45, $fn=fn);
		translate([3.45,-2.5,56.3])
			rotate([0,90,0])
				cylinder(r=1.15, h=5.45, $fn=fn);
	}
}

module e3d_pipe(r,r2,h,fn)
{
	difference()
	{
		cylinder(r=r,h=h,$fn=fn);
		translate([0,0,-1])
			cylinder(r=r2,h=h+2,$fn=fn);
	}	
}

