//nema17(5);
module nema17(motor_length=40)
{
	translate([0, 0, motor_length])
		difference()
		{
			union()
			{
				translate([0, 0, -motor_length/2])
					intersection()
					{
						cube([42.3, 42.3, motor_length], center=true);
						rotate([0, 0, 45])
							cube([52, 52, motor_length], center=true);
					}

				cylinder(r=2.5, h=24, $fn=24);
				cylinder(r=11, h=2, $fn=32);

			}
			for (a = [0:90:359])
			{
				rotate([0, 0, a])
					translate([15.5, 15.5, 0])
						cylinder(d=3, h=4.5, center=true, $fn=12);
			}
		}
}
