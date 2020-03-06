use <lib/rounded.scad>
use <lib/belt_clamp.scad>
use <lib/bearing_holder.scad>;


module base(
	dual = false,
	holes_top1 = 24, // top row top
	holes_spacing1 = 20, // top row spacing
	holes_top2 = 35, // middle row top
	holes_spacing2 = 30, // middle row spacing
	holes_top3 = 46, // bottom row top
	holes_spacing3 = 20, // bottom row spacing
	width = 42.5,
	height = 51,
	motor_to_hotend_yoffset = 20,
	carriage_to_filament_zoffset = 30,
	fillet = 1
	)
{
	base_w = dual ? width*2 : width;
	xadd = dual ? width/2 : 0;
	difference()
	{
		union()
		{
			translate([-base_w/2, 10, 0])
			//cube([base_w, carriage_to_filament_zoffset, motor_to_hotend_yoffset]);
				rounded_cube(base_w, carriage_to_filament_zoffset-10, motor_to_hotend_yoffset, 0, fillet, 0);
				
			translate([-base_w/2, carriage_to_filament_zoffset - 8, -height])
				rounded_cube(base_w, 8, motor_to_hotend_yoffset+height, fillet, fillet, fillet);
			translate([-xadd, 10, motor_to_hotend_yoffset/2])
				cube([width-24, 3.3, 5], center=true);
			if (dual)
				translate ([xadd, 10, motor_to_hotend_yoffset/2])
					cube([width-24, 3.3, 5], center=true);
		}

		if (holes_top1!=undef)
		{
			translate([-holes_spacing1/2, carriage_to_filament_zoffset+0.1, motor_to_hotend_yoffset-holes_top1])
				screw_hole_carriage_nut();
			translate([ holes_spacing1/2, carriage_to_filament_zoffset+0.1, motor_to_hotend_yoffset-holes_top1])
				screw_hole_carriage_nut();
		}
		if (holes_top2!=undef)
		{
			translate([-holes_spacing2/2, carriage_to_filament_zoffset+0.1, motor_to_hotend_yoffset-holes_top2])
				screw_hole_carriage_nut();
			translate([ holes_spacing2/2, carriage_to_filament_zoffset+0.1, motor_to_hotend_yoffset-holes_top2])
				screw_hole_carriage_nut();
		}
		if (holes_top3!=undef && holes_top3!=undef)
		{
			translate([-holes_spacing3/2, carriage_to_filament_zoffset+0.1, motor_to_hotend_yoffset-holes_top3])
				screw_hole_carriage_nut();
			translate([ holes_spacing3/2, carriage_to_filament_zoffset+0.1, motor_to_hotend_yoffset-holes_top3])
				screw_hole_carriage_nut();
		}
		
		translate ([-xadd, 0, 0])
			screw_holes_main(
				width = width,
				motor_to_hotend_yoffset = motor_to_hotend_yoffset,
				carriage_to_filament_zoffset = carriage_to_filament_zoffset,
				cover_depth = 20
			);
		if (dual)
			translate ([xadd, 0, 0])
				screw_holes_main(
					width = width,
					motor_to_hotend_yoffset = motor_to_hotend_yoffset,
					carriage_to_filament_zoffset = carriage_to_filament_zoffset,
					cover_depth = 20
				);

		// aux side mount holes
		//screw_hole_x(15, 5, l=10, w = base_w);
		screw_hole_x(carriage_to_filament_zoffset - 4, -26, r=-90, l=7.5, w = base_w); 
		screw_hole_x(carriage_to_filament_zoffset - 4, -6, r=-90, l=8, w = base_w);
	}
}

module carriage(
	holes_top1 = 24, // top row top
	holes_spacing1 = 20, // top row spacing
	holes_top2 = 35, // middle row top
	holes_spacing2 = 30, // middle row spacing
	holes_top3 = 46, // bottom row top
	holes_spacing3 = 20, // bottom row spacing
	motor_to_hotend_yoffset = 20,
	fillet = 1,
	carriage_top_bearings_separation = 10,
	carriage_bottom_bearings_separation = 10,
	carriage_bearing_diameter = 15,
	carriage_bearing_length = 24,
	carriage_bearing_holder_length = 15.3,
	carriage_bearing_holder_wall_size = 2,
	carriage_bearing_holder_holes = 0,
	x_rods_separation = 45,
    rod_diameter=8
	)
{
	top_width = max(42.5, max(carriage_bearing_length, carriage_bearing_holder_length)+carriage_top_bearings_separation+fillet*2);
	bottom_width = max(carriage_bearing_length, carriage_bearing_holder_length)+carriage_bottom_bearings_separation+fillet*2;
	middle_width = max(holes_spacing1, holes_spacing2, holes_spacing3)+15;
	width = max(42.5, top_width, bottom_width, middle_width);
	height = x_rods_separation+carriage_bearing_diameter+4;
    height_top = height /2 + 7;
    height_bottom = height - height_top;
    bearing_y = -8-carriage_bearing_diameter/2+((carriage_bearing_diameter-rod_diameter)/2)-0.5;
    top_bearing_z = motor_to_hotend_yoffset-carriage_bearing_diameter/2-2;
    bottom_bearing_z = top_bearing_z - x_rods_separation;
    bearings = [
        [ carriage_top_bearings_separation/2, bearing_y, top_bearing_z],
        [-carriage_top_bearings_separation/2, bearing_y, top_bearing_z],
        [ carriage_bottom_bearings_separation/2, bearing_y, bottom_bearing_z],
        [-carriage_bottom_bearings_separation/2, bearing_y, bottom_bearing_z]
    ];
	difference()
	{
		union()
		{
			// belt clamps
			// body	
			//translate([-width/2, -20, -height/2+motor_to_hotend_yoffset+5]) 
			//	cube([width,20, 1]);
			//translate([-width/2, -20, -height/2+motor_to_hotend_yoffset-5]) 
			//	cube([width,20, 1]);
			translate([-width/2, -8, -height_top+motor_to_hotend_yoffset]) 
				rounded_cube(width, 8, height_top, fillet, fillet, fillet);
            translate([-bottom_width/2, -8, -height+motor_to_hotend_yoffset]) 
				rounded_cube(bottom_width, 8, height_top, fillet, fillet, fillet);
			translate([-width/2+15.7, -8, motor_to_hotend_yoffset-height/2+1])
				rotate([90,0,0])
					belt_clamp();
			mirror([1,0,0])
				translate([-width/2+15.7, -8, motor_to_hotend_yoffset-height/2+1])
					rotate([90,0,0])
						belt_clamp();
            // bearing holders
            for(bearing = bearings)
                translate([bearing[0]-(carriage_bearing_holder_length-4)/2-0.5, bearing[1], bearing[2]-carriage_bearing_diameter/2-2])
                    cube([carriage_bearing_holder_length-3, carriage_bearing_diameter/2, carriage_bearing_diameter+4]);
		}
        // bearing gaps
        for(bearing = bearings)
            translate([bearing[0], bearing[1], bearing[2]])
                rotate([0,90,0])
                    bearing(
                        length = carriage_bearing_length,
                        inner_diameter = 0,
                        outer_diameter = carriage_bearing_diameter,
                        groove_distance = carriage_bearing_holder_length,
                        groove_width = 0.75,
                        groove_depth = 0.4,
                        inserts = true,
                        wall_size = carriage_bearing_holder_wall_size
                    );

				
			


		if (holes_top1!=undef)
		{
			translate([-holes_spacing1/2, 0.1, motor_to_hotend_yoffset-holes_top1])
				screw_hole_carriage();
			translate([ holes_spacing1/2, 0.1, motor_to_hotend_yoffset-holes_top1])
				screw_hole_carriage();
		}
		if (holes_top2!=undef)
		{
			translate([-holes_spacing2/2, 0.1, motor_to_hotend_yoffset-holes_top2])
				screw_hole_carriage();
			translate([ holes_spacing2/2, 0.1, motor_to_hotend_yoffset-holes_top2])
				screw_hole_carriage();
		}
		if (holes_top3!=undef && holes_top3!=undef)
		{
			translate([-holes_spacing3/2, 0.1, motor_to_hotend_yoffset-holes_top3])
				screw_hole_carriage();
			translate([ holes_spacing3/2, 0.1, motor_to_hotend_yoffset-holes_top3])
				screw_hole_carriage();
		}
	}
}

module holder(
	filament_d = 1.75,
	gear_od = 11,
	gear_ed = 11,
	gear_groove_width = 3.2,
	gear_height = 10,
	bearing_od = 13,
	bearing_ed = 12,
	bearing_id = 4,
	bearing_groove_width = 2.1,
	bearing_height = 4,
	flex_guide_safety_tolerance = 0.05,
	width = 42.5,
	carriage_to_filament_zoffset = 30,
	motor_to_hotend_yoffset = 20,
	fillet = 1,
	supports = true,
	prometheus = false,
	brass_tube = true
	)
{
	filament_offset = (gear_ed + filament_d)/2;
	difference()
	{
		union()
		{
			translate([-width/2, 0, 0])
				rounded_cube(width, 10, motor_to_hotend_yoffset, 0, fillet, 0);
			translate([-width/2, -6, motor_to_hotend_yoffset])
				rounded_cube(width, 16, 11, fillet,fillet,fillet);
			translate([-width/2, -6, motor_to_hotend_yoffset-5])
				rounded_cube(width, 16, 10, 0,0,fillet);

			translate([filament_offset-5,-6, motor_to_hotend_yoffset+8]) 
				cube ([10, 13.1, 13]);	//tip for flex filament
			//translate([filament_offset-5,0, motor_to_hotend_yoffset+10]) 
			//	cube ([10, 7.5, 9]);	//tip for flex filament

			translate([-12,0, motor_to_hotend_yoffset+10.9])
				cylinder(d2 = 5, d1=8, h=2.1, $fn=64); //spring 
		}
		// front half hotend locker
		translate([-width/2-0.15, -15, 0.1])
			rounded_cube(width+0.3, 15, motor_to_hotend_yoffset, fillet,fillet,fillet); 
		// base insert
		translate([0, 10, motor_to_hotend_yoffset/2])
			cube([width-23.8, 3.5, 5.2], center=true);
		translate([0, 10, motor_to_hotend_yoffset/2])
			cube([width-23.0, 0.5, 6], center=true);
		
		// motor round big gap
		translate([0,10.1,motor_to_hotend_yoffset+21.5])
			rotate([90,0,0])
				cylinder(d=23, h=3, $fn=64);
		
		// spring screw
		translate([-12,0, motor_to_hotend_yoffset+11])
			cylinder(r = 1.5, h=20, $fn=64, center=true); //spring
		
		//hotend mount
		translate([filament_offset,0, 0]) 
		{
			hotend_mount(prometheus=prometheus);
			//translate([-5.1,-10,20])
			//	cube([10.2, 10, 20]);
		}
		
		//motor screws
		translate([-31/2, -6, motor_to_hotend_yoffset+6])
			rotate([-90, 0, 0])
			{
				cylinder(r = 1.6, h = 25, $fn=32);
				cylinder(r = 3.1, h = 6, $fn=32, center=true);
			}
		translate([ 31/2, -6, motor_to_hotend_yoffset+6])
			rotate([-90, 0, 0]) 
			{
				cylinder(r = 1.6, h = 25, $fn=32);
				cylinder(r = 3.1, h = 6, $fn=32, center=true);
			}
		
		screw_holes_main(
			width = width,
			motor_to_hotend_yoffset = motor_to_hotend_yoffset,
			carriage_to_filament_zoffset = carriage_to_filament_zoffset,
			cover_depth = 20
		);
		translate([0, 0, motor_to_hotend_yoffset+6+31/2])
			flex_guide(
				filament_d = filament_d,
				gear_od = gear_od,
				gear_ed = gear_ed,
				gear_groove_width = gear_groove_width,
				gear_height = gear_height,
				bearing_od = bearing_od,
				bearing_ed = bearing_ed,
				bearing_id = bearing_id,
				bearing_groove_width = bearing_groove_width,
				bearing_height = bearing_height,
				safety_tolerance = flex_guide_safety_tolerance,
				fillet = fillet
				);
//		//5015S fan mounts
        screw_hole_x(5, motor_to_hotend_yoffset+1, r=90, w=width);
	}

	//tip supports
	if (supports)
		for (xx =[-5.2, -2.5, 0, 2.5, 4.7])
			translate([filament_offset+xx, 7.2, motor_to_hotend_yoffset+11.4]) 
				cube ([0.55, 2.8, 8]);
}

module cover(
	filament_d = 1.75,
	gear_ed = 11,
	width = 42.5,
	cover_depth = 16,
	motor_to_hotend_yoffset = 20,
	fillet = 1,
	prometheus=false,
	front_holes=true
	)
{
	filament_offset = (gear_ed + filament_d)/2;
	difference()
	{
		translate([-width/2, -cover_depth, 0])
			rounded_cube(width, cover_depth, motor_to_hotend_yoffset, fillet,fillet,fillet);
		translate([filament_offset,0,0])
			hotend_mount(prometheus=prometheus);
		//screw_hole_x(-5, 5, w=width);
		screw_holes_main(
			width = width,
			motor_to_hotend_yoffset = motor_to_hotend_yoffset,
			carriage_to_filament_zoffset = 20,
			cover_depth = cover_depth
		); 
		if(front_holes)
		{
			//front fan mounts
			screw_hole_y(10, -cover_depth, 5);
			screw_hole_y(0, -cover_depth, 5);
			screw_hole_y(-10, -cover_depth, 5);
		}
	}
}

module lever(
	filament_d = 1.75,
	gear_ed = 11,
	bearing_od = 13,
	bearing_ed = 11,
	bearing_id = 4,
	bearing_height = 4,
	lever_height = 12,
	fillet = 1,
	brass_tube = true 
	)
{
	filament_offset = (gear_ed + filament_d)/2;
	bearing_x = filament_offset + filament_d/2+bearing_ed/2; 
	difference()
	{
		union()
		{
			hull()
			{
				translate([-8, -(lever_height/2), 32.5])
					rounded_cube(38-14+fillet, lever_height, 10, fillet, fillet, fillet, noback = true);
				translate([-13, -(lever_height/2), 39.5])
					rotate([-90, 0, 0])
						rounded_cylinder(3, lever_height-1, fillet, true, true);
				translate([-13, -(lever_height/2), 35.5])
					rotate([-90, 0, 0])
						rounded_cylinder(3, lever_height-1, fillet, true, true);
			}
	
			hull()
			{
				translate([-13, -(lever_height/2), 39.5])
					rotate([-90, 0, 0])
						rounded_cylinder(3, lever_height-1, fillet, true, true);
				translate([-13, -(lever_height/2), 35.5])
					rotate([-90, 0, 0])
						rounded_cylinder(3, lever_height-1, fillet, true, true);
				translate([-18.5, -(lever_height/2), 35.5])
					rotate([-90, 0, 0])
						rounded_cylinder(3, lever_height-1, fillet, true, true);
				translate([-25, -(lever_height/2), 39.5])
					rotate([-90, 0, 0])
						rounded_cylinder(3, lever_height-1, fillet, true, true);
			}
	
			hull()
			{
				translate([bearing_x-bearing_od/2+1, -(lever_height/2), 21.5])
					rounded_cube(bearing_od/2, lever_height, 15, fillet, fillet, fillet);
				translate([ 31/2, -(lever_height/2), 37])
					rotate([-90, 0, 0])
						rounded_cylinder(r = 5.5, h = lever_height, rrnd=fillet, $fn=64);
				translate([bearing_x, 0, 21.5])
					rotate([-90, 0, 0])
						rounded_cylinder((bearing_od-2)/2, lever_height, fillet, center=true);
				
				if (bearing_od <= 16)
					translate([min((bearing_x+2),20-(bearing_od-2)/2), 0, 21.5])
						rotate([-90, 0, 0])
							rounded_cylinder((bearing_od-2)/2, lever_height, fillet, center=true);
			}
			//translate([-12,0, 30.5]) cylinder(d1 = 5, d2=8, h=2.1, $fn=64); //spring tip
			translate([filament_offset,0, 30]) cylinder(d1 = 6, d2=10, h=3, $fn=64); //filament tip
		}

		translate([filament_offset,0, 42.5-3]) cylinder(d1 = 4, d2=5, h=3, $fn=64);
		
		//mounting hole
		translate([ 31/2, -(lever_height/2), 37]) rotate([-90, 0, 0])
		{
			hd = brass_tube ? 4.2 : 3;
			cylinder(d=hd, h = 20, $fn=32); //change to r=1.5 if no brass pipe
			cylinder(d=8, h = 7, $fn=32, center=true);
		}
		
		translate([bearing_x, 0, 21.5]) rotate([-90, 0, 0])
		{
			difference()
			{
				cylinder(d=bearing_od+2, h=bearing_height+0.5, $fn=64, center=true);
				difference()
				{
					cylinder(d=bearing_id+(bearing_od-bearing_id)/3, h=bearing_height+0.5, $fn=64, center=true);
					cylinder(d=bearing_od, h=bearing_height+0.1, $fn=64, center=true);
				}
			}
			cylinder(d=bearing_id*0.95, h=20, $fn=64, center=true);
		}

		//translate([filament_offset, -(bearing_height)/2, 0]) cube([20, bearing_height+0.1, 21.5]);
		// filament hole
		translate([filament_offset,0, 25])
			cylinder(d=4.2, h=20, $fn=64); 
		
		// spring screw
		translate([-12,0, 32.5])
		{ 
			cylinder(r = 1.6, h=30, $fn=64, center=true);
			translate([-3, -3.3, 3]) cube([6, 10, 3.0]);
		}
	}
}

module top_plate(
	brass_tube = true,
	)
{
	difference()
	{
		hull()
		{
			translate([-14.5, 6, 39.5])
				rotate([-90, 0, 0])
					cylinder(r=3, h=4, $fn=32);
			translate([-18, 6, 36])
				rotate([-90, 0, 0])
					cylinder(r=3, h=4, $fn=32);
			translate([-18, 6, 29])
				rotate([-90, 0, 0])
					cylinder(r=3, h=4, $fn=32);
			translate([ 31/2, 6, 37])
				rotate([-90, 0, 0])
					cylinder(r = 5.5, h=4, $fn=32); 
			translate([18, 6, 29])
				rotate([-90, 0, 0])
					cylinder(r=3, h=4, $fn=32);
		}
		
		// big motor gap
		translate([0,10.1, 21.5])
			rotate([90,0,0])
				cylinder(d=24, h=5, $fn=64);
		
		//mount holes
		translate([0, 5.9, 37])
		{
			translate([-31/2, 0, 0])
				rotate([-90, 0, 0])
				{ 
					cylinder(r = 1.6, h = 5, $fn=32);
					cylinder(r = 3.5, h = 2, $fn=32);
				}
			translate([ 31/2, 0, 0])
				rotate([-90, 0, 0])
				{
					hd = brass_tube ? 4.2 : 3;
					cylinder(d = hd, h = 5, $fn=32);
				}
		}
	}
}

module flex_guide(
	filament_d = 1.75,
	gear_od = 11,
	gear_ed = 11,
	gear_groove_width = 3.2,
	gear_height = 10,
	bearing_od = 13,
	bearing_ed = 12,
	bearing_id = 4,
	bearing_groove_width = 2.1,
	bearing_height = 4,
	safety_tolerance = 0.05,
	fillet = 1
	)
{
	gap = gear_ed/2 + bearing_ed/2 + filament_d - gear_od/2 - bearing_od/2;
	diameter_extra_tolerance = (gap*safety_tolerance);
	height = 3*max(gear_height, bearing_height);
	// gear
	grooved_cylinder(
		outer_diameter = gear_od+diameter_extra_tolerance,
		inner_diameter = 0,
		grooved_diameter = gear_ed+diameter_extra_tolerance,
		groove_width = gear_groove_width,
		height = height
		);


	// bearing 
	bearing_outer_diameter = bearing_od+diameter_extra_tolerance;
	bearing_groove_diameter = bearing_ed+diameter_extra_tolerance;
	bearing_groove_width = bearing_groove_width;
	translate([gear_ed/2 + bearing_ed/2 + filament_d, 0, 0]) 
	{
		grooved_cylinder(
			outer_diameter = bearing_outer_diameter,
			inner_diameter = 0,
			grooved_diameter = bearing_groove_diameter,
			groove_width = bearing_groove_width,
			height = height
			);
		translate([0, -height/2, -bearing_outer_diameter/2])
			cube([bearing_outer_diameter/2, height, bearing_outer_diameter/2]);
	}
}

module grooved_cylinder(
	outer_diameter = 13,
	inner_diameter = 4,
	grooved_diameter = 11,
	groove_width = 3.2,
	height = 4
	)
{
	difference()
	{
		// cylinder
		rotate([90, 0, 0])
			cylinder(d=outer_diameter, h=height, $fn=64, center=true);
		// groove
		rotate([90, 0, 0])
			rotate_extrude($fn=64)
				translate([grooved_diameter/2 + (outer_diameter - grooved_diameter)/2 , 0, 0])
					resize([(outer_diameter-grooved_diameter), groove_width])
						circle(d = outer_diameter-grooved_diameter, $fn=64);
		
		rotate([90, 0, 0])
			cylinder(d=inner_diameter, h=height+1, $fn=64, center=true);
	}
	// back groove extra fill
	//translate([0, (groove_width/2-1), 0])
	//{
	//	translate([0, 0.55/2, 0])
	//		rotate([-90, 0, 0])
	//			cylinder(d1=grooved_diameter+1, d2 = outer_diameter+1, h=0.55, center=true, $fn=64);
	//	translate([0, 20/2+0.55, 0])
	//		rotate([-90, 0, 0])
	//			cylinder(d=outer_diameter+1, h=20, center=true, $fn=64);
	//}
	// front groove extra fill
	//translate([0, -(groove_width/2-1), 0])
	//{
	//	translate([0, -0.55/2, 0])
	//		rotate([-90, 0, 0])
	//			cylinder(d1=outer_diameter+1, d2 = grooved_diameter+1, h=0.55, center=true, $fn=64);
	//	translate([0, -20/2-0.55, 0])
	//		rotate([-90, 0, 0])
	//			cylinder(d=outer_diameter+1, h=20, center=true, $fn=64);
	//}
}

module hotend_mount(prometheus=false)
{
	h_tolerance = 1.1;
	h0 = 0.0;
	h1 = prometheus ? 4.8 : 3.7;
	h2 = prometheus ? 4.6 : 6;
	h3 = prometheus ? 2 : 3;
	d0 = 9;
	d1 = 16.5; // 16
	d2 = 12.2; // 12
	d3 = 16.5; // 16
    translate([0,0,-1])
        cylinder(d=4.2, h=47, $fn=64);
	translate([0,0,h3/2])
		cylinder(d=d3, h=h3*h_tolerance, center=true, $fn=64);
	translate([0,0,h3+h2/2])
		cylinder(d=d2, h=h2*h_tolerance, center=true, $fn=64);
	translate([0,0,h3+h2+h1/2])
		cylinder(d=d1, h=h1*h_tolerance, center=true, $fn=64);
	translate([0,0,h3+h2+h1+h0/2])
		cylinder(d=d0, h=h0*h_tolerance, center=true, $fn=64);

}

module screw_hole_x(
	y,
	z,
	r=0,
	l=8,
	w=42.5
	)
{
	translate([-w/2, y, z])
		rotate([0, 90, 0])
		{
			cylinder(r = 1.6, h = l*2, $fn=32, center=true);
			rotate([0, 0, r]) translate([-3.3, -3, 3]) cube([10, 6, 3.0]);
		}
	translate([w/2, y, z])
		rotate([0, -90, 0])
		{
			cylinder(r = 1.6, h = l*2, $fn=32, center=true);
			rotate([0, 0, -r])
				translate([-6.6, -3, 3])
					cube([10, 6, 3.0]);
		}
}

module screw_hole_y(
	x,
	y,
	z,
	l=7.5
	)
{
	translate([x, y, z])
		rotate([-90, 90, 0])
		{
			cylinder(r = 1.6, h = l*2, $fn=32, center=true);
			translate([-3.3, -3, 3]) cube([10, 6, 3.0]);
		} 
}

module screw_hole_carriage_nut()
{
	rotate([90, 0, 0])
	{
		cylinder( r = 1.6, h = 8.1, $fn=32);
		translate([0, 0, 6])
			cylinder( d = 6.6, h = 3, $fn=6);
	}
}

module screw_hole_carriage()
{
	rotate([90, 0, 0])
	{
		cylinder( r = 1.6, h = 8.1, $fn=32);
		translate([0, 0, 6])
			cylinder( d = 6.6, h = 3, $fn=32);
		
	}
}
module screw_holes_main(
	width = 42.5,
	motor_to_hotend_yoffset = 20,
	carriage_to_filament_zoffset = 30,
	cover_depth = 16
	)
{	
	holes_z = motor_to_hotend_yoffset/2 ;
	translate([width/2-4.5, -cover_depth, holes_z])
		rotate([-90, 0, 0])
		{
			cylinder(r = 1.6, h = 50, $fn=32);
			cylinder(r = 3.2, h = 17, $fn=32, center=true);
		}
	translate([-width/2+4.5, -cover_depth, holes_z])
		rotate([-90, 0, 0])
		{
			cylinder(r = 1.6, h = 50, $fn=32);
			cylinder(r = 3.2, h = 17, $fn=32, center=true);
		}
	translate([width/2-4.5, carriage_to_filament_zoffset-4, holes_z])
		rotate([-90, 0, 0])
			cylinder( d = 6.6, h = 4.1, $fn=6);
	translate([-width/2+4.5, carriage_to_filament_zoffset-4, holes_z])
		rotate([-90, 0, 0])
			cylinder( d = 6.6, h = 4.1, $fn=6);
}
