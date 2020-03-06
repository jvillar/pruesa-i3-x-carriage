use <extruder.scad>
use <sensor_mount.scad>
use <x_end_motor.scad>
use <x_end_idler.scad>
use <lib/nema17.scad>
use <5015_blower_duct.scad>
use <lib/e3d_v6.1.scad>

/* [Main options] */

// What would you like to see?
part = "assembly"; // [assembly:Full assembly,lh_print_all:All extruder parts at once -left hand-,rh_print_all:All extruder parts at once -right hand-, base:Extruder base, lh_holder:Extruder holder -left hand-, rh_holder:Extruder holder -right hand-, lh_cover:Extruder cover -left hand-, rh_cover:Extruder cover -right hand-, lh_lever:Extruder lever -left hand-, rh_lever:Extruder lever -right hand-, lh_top_plate:Extruder top plate -left hand-, rh_top_plate:Extruder top plate -right hand-, lh_duct: Fan duct -left hand-, rh_duct: Fan duct -right hand-, carriage:Carriage, sensor:Sensor mount, xendm: X end motor, xendi: X end idler, xendt: X end tensioner]
// rounded corners radius
fillet = 2.5; // [0:0.1:2.5]

// separation between rods in x axis
x_rods_separation=45; // [0:0.1:100] // 45.5

// separation between rods in z axis
z_rods_separation=27; // [0:0.1:100]

// separation between rods in x and z axis
xz_rods_separation=22; // [0:0.1:100]

// diameter of rods
rod_diameter=8; // [0:0.1:30]

// effective distance between X end motor and idler blocks
x_ends_distance = 300; // [0:1:1000]

// relative position of the X carriage
extruder_position = 50; // [0:1:100]

/* [Tolerances] */
bearing_diameter_tolerance = 0.5; // [0:0.1:2]
nut_holder_inner_diameter_tolerance = 0.5; // [0:0.1:2]
rod_diameter_tolerance = 0.3; // [0:0.1:2]

/* [Extruder options] */

// hot end type
hot_end="e3dv6"; // [e3dv6:E3Dv6,prometheus:Prometheus]
	
// dual or single extruder system
extruders = "single"; //[single:Single,dual:Dual]

// filament diameter
filament_diameter = 1.75; // [1.75,3]

// percentage of groove fill tolerance
flex_guide_groove_fill_tolerance = 100; // [0:0.1:200]



// brass tube in the lever rotating axis
brass_tube=false;

// generate built-in supports
supports = true;

// generate auxiliary holes in the front of the cover
front_holes=true;

/* [Extruder gear options] */
// gear outer diameter
gear_outer_diameter = 11; // [0:0.1:20]
gear_effective_diameter = 10.9;  // [0:0.1:20]
gear_groove_width = 0; // [0:0.1:10] 
gear_height = 13; // [0:0.1:20]

/* [Extruder bearing options] */
// bearing outer diameter
bearing_outer_diameter = 13; // [0:0.1:20]
// bearing effective diameter
bearing_effective_diameter = 11; // [0:0.1:20]
// bearing inner diameter
bearing_inner_diameter = 4; // [0:0.1:20]
// bearing groove width
bearing_groove_width = 2.1; // [0:0.1:10]
// bearing height
bearing_height = 4; // [0:0.1:20]

/* [Extruder base mounting holes] */
// Top row holes -vertical position-
base_holes_toprow_top = 22; // [0:100]
// Top row holes -separation-
base_holes_toprow_spacing = 0; // [0:100]
// Middle row holes -vertical position-
base_holes_midrow_top = 34; // [0:100]
// Middle row holes -spacing-
base_holes_midrow_spacing = 0; // [0:100]
// Bottom row holes -vertical position-
base_holes_bottomrow_top = 40; // [0:100]
// Bottom row holes -spacing-
base_holes_bottomrow_spacing = 21; // [0:100]

/* [Extruder dimensions] */
cover_depth = 15; // [12:100]

// base height
base_height = 30; // [0:100]

carriage_to_filament_y_spacing = 30; //[18:100]
motor_base_to_hotend_z_spacing= 15; //[12.8:0.1:100]

/* [Carriage] */

carriage_top_bearings_separation = 30; // [0:1:100]
carriage_bottom_bearings_separation = 0; // [0:1:100]
carriage_bearing_diameter = 15; //[10:0.1:40]
carriage_bearing_length = 24; //[10:0.1:100]
carriage_bearing_holder_length = 15.3; //[10:0.1:100]
carriage_bearing_holder_wall_size = 2; //[1:0.1:5]
carriage_bearing_holder_holes = 1; //[0:1:2]
/* [Fan duct] */

fan_extra_height = 0; // [0:1:50]
fan_outlet_width = 12; // [0:1:30]
fan_outlet_height = 3;// [0:1:10]
fan_outlet_angle = 0; // [0:1:90]
fan_tip_length = 15; // [0:1:30]
fan_tip_angle = 80; // [0:1:90]

/* [Sensor options] */

//type of support 
sensor_type="bltouch"; // [bltouch:Bl Touch, round:Round sensor]

// 90º rotated bltouch
sensor_bltouch_rotated=true;

// Inner diameter for a round sensor
sensor_round_inner_diameter=18;

// Outer diameter for a round sensor
sensor_round_outer_diameter=30;

// Style of the arm reinforcement
sensor_arm_style = "reinforced";  // [elephant: Elephant, reinforced: Reinforced, straight: Straight]

// Height of the arm
sensor_z_offset = 14.6; //[0:0.1:100]

// depth of the arm
sensor_y_offset = 16.5; //[0:0.1:100]

// Thickness of the horizontal section of the arm (default: 4.5)
sensor_arm_horizontal_thickness = 4; //[2:0.1:15]



/* [X ends] */
x_end_height=60; // [0:1:100]
x_end_extra_width=0; // [0:1:100]
x_end_main_body_width=18; // [0:1:100]
x_end_bearing_diameter=15;  // [0:1:100]
x_end_bearing_holder_wall_size=2;  // [0:1:100]
x_end_bearing_gap_width=1.5;  // [0:1:100]
x_end_bearing_tab_width=3.5;  // [0:1:100]
x_end_bearing_n_holes=2;  // [0:1:100]
x_end_bearing_hole_size=2.5; // [0:1:100]
x_end_nut_holder_inner_diameter=10.2; // [0:1:100]
x_end_nut_holder_outer_diameter=23; // [0:1:100]
x_end_nut_holder_height=10; // [0:1:100]
x_end_nut_holes_radial_separation=8; // [0:1:100]
x_end_nut_n_holes=4; // [0:1:100]
x_end_nut_hole_size=3.5; // [0:1:100]
x_end_tensioner_holder_wall_size=3; // [0:1:100]
x_end_tensioner_holder_hole_size=3; // [0:1:100]
x_end_pulley_screw_head_diameter=20; // [0:1:100]
x_end_motor_x_offset=5; // [0:1:100]
x_end_motorshaft_hole_diameter=30; // [0:1:100]
x_end_front_motor=false;

/* [X Z endstops] */
x_endstop=true;
x_endstop_screw_size=2.2; // [0:1:100]
x_endstop_screw_sep=9.5; // [0:1:100]
x_endstop_screw_depth=5; // [0:1:100]
x_endstop_elevation=4; // [0:1:100]
z_endstop_screw_holder_depth=8; // [0:1:100]
z_endstop_rod_screw_x_offset=26; // [0:1:100]
z_endstop_rod_screw_y_offset=5; // [0:1:100]
z_endstop_screw_hole_size=3; // [0:1:100]

main(
	part = part,
	hot_end = hot_end,
	extruders = extruders,
	filament_diameter = filament_diameter,
	flex_guide_groove_fill_tolerance = flex_guide_groove_fill_tolerance,
	fillet = fillet,
	brass_tube = brass_tube,
	supports = supports,
	front_holes=front_holes,
	gear_outer_diameter = gear_outer_diameter,
	gear_effective_diameter = gear_effective_diameter,
	gear_groove_width = gear_groove_width,
	gear_height = gear_height,
	bearing_outer_diameter = bearing_outer_diameter,
	bearing_effective_diameter = bearing_effective_diameter,
	bearing_inner_diameter = bearing_inner_diameter,
	bearing_groove_width = bearing_groove_width,
	bearing_height = bearing_height,
	base_holes_toprow_top = base_holes_toprow_top,
	base_holes_toprow_spacing = base_holes_toprow_spacing,
	base_holes_midrow_top = base_holes_midrow_top,
	base_holes_midrow_spacing = base_holes_midrow_spacing,
	base_holes_bottomrow_top = base_holes_bottomrow_top,
	base_holes_bottomrow_spacing = base_holes_bottomrow_spacing,
	cover_depth = cover_depth,
	base_height = base_height,
	carriage_to_filament_y_spacing = carriage_to_filament_y_spacing,
	motor_base_to_hotend_z_spacing = motor_base_to_hotend_z_spacing,
    carriage_top_bearings_separation = carriage_top_bearings_separation,
    carriage_bottom_bearings_separation = carriage_bottom_bearings_separation,
    carriage_bearing_diameter = carriage_bearing_diameter+bearing_diameter_tolerance,
    carriage_bearing_length = carriage_bearing_length,
    carriage_bearing_holder_length = carriage_bearing_holder_length,
    carriage_bearing_holder_wall_size = carriage_bearing_holder_wall_size,
    carriage_bearing_holder_holes = carriage_bearing_holder_holes,
    x_rods_separation = x_rods_separation,
    z_rods_separation = z_rods_separation,
    xz_rods_separation = xz_rods_separation,
    rod_diameter = rod_diameter+rod_diameter_tolerance,
    x_ends_distance = x_ends_distance,
    extruder_position = extruder_position,
    fan_extra_height = fan_extra_height,
    fan_outlet_width = fan_outlet_width,
    fan_outlet_height = fan_outlet_height,
    fan_outlet_angle = fan_outlet_angle,
    fan_tip_length = fan_tip_length,
    fan_tip_angle = fan_tip_angle,
    sensor_type = sensor_type,
    sensor_bltouch_rotated = sensor_bltouch_rotated,
    sensor_round_inner_diameter = sensor_round_inner_diameter,
    sensor_round_outer_diameter = sensor_round_outer_diameter,
    sensor_arm_style = sensor_arm_style,
    sensor_z_offset = sensor_z_offset,
    sensor_y_offset = sensor_y_offset,
    sensor_arm_horizontal_thickness = sensor_arm_horizontal_thickness,
    x_end_height = x_end_height,
    x_end_extra_width = x_end_extra_width,
    x_end_main_body_width = x_end_main_body_width,
    x_end_bearing_diameter = x_end_bearing_diameter+bearing_diameter_tolerance,
    x_end_bearing_holder_wall_size = x_end_bearing_holder_wall_size,
    x_end_bearing_gap_width = x_end_bearing_gap_width,
    x_end_bearing_tab_width = x_end_bearing_tab_width,
    x_end_bearing_n_holes = x_end_bearing_n_holes,
    x_end_bearing_hole_size = x_end_bearing_hole_size,
    x_end_nut_holder_inner_diameter = x_end_nut_holder_inner_diameter+nut_holder_inner_diameter_tolerance,
    x_end_nut_holder_outer_diameter = x_end_nut_holder_outer_diameter,
    x_end_nut_holder_height = x_end_nut_holder_height,
    x_end_nut_holes_radial_separation = x_end_nut_holes_radial_separation,
    x_end_nut_n_holes = x_end_nut_n_holes,
    x_end_nut_hole_size = x_end_nut_hole_size,
    x_end_tensioner_holder_wall_size = x_end_tensioner_holder_wall_size,
    x_end_tensioner_holder_hole_size = x_end_tensioner_holder_hole_size,
    x_end_pulley_screw_head_diameter = x_end_pulley_screw_head_diameter,
    x_end_motor_x_offset = x_end_motor_x_offset,
    x_end_motorshaft_hole_diameter = x_end_motorshaft_hole_diameter,
    x_end_front_motor = x_end_front_motor,
    x_endstop = x_endstop,
    x_endstop_screw_size = x_endstop_screw_size,
    x_endstop_screw_sep = x_endstop_screw_sep,
    x_endstop_screw_depth = x_endstop_screw_depth,
    x_endstop_elevation = x_endstop_elevation,
    z_endstop_screw_holder_depth = z_endstop_screw_holder_depth,
    z_endstop_rod_screw_x_offset = z_endstop_rod_screw_x_offset,
    z_endstop_rod_screw_y_offset = z_endstop_rod_screw_y_offset,
    z_endstop_screw_hole_size = z_endstop_screw_hole_size
);

module main(
	part,
	hot_end,
	extruders,
	filament_diameter,
	flex_guide_groove_fill_tolerance,
	fillet,
	brass_tube,
	supports,
	front_holes=front_holes,
	gear_outer_diameter,
	gear_effective_diameter,
	gear_groove_width,
	gear_height,
	bearing_outer_diameter,
	bearing_effective_diameter,
	bearing_inner_diameter,
	bearing_groove_width,
	bearing_height,
	base_holes_toprow_top,
	base_holes_toprow_spacing,
	base_holes_midrow_top,
	base_holes_midrow_spacing,
	base_holes_bottomrow_top,
	base_holes_bottomrow_spacing,
	cover_depth,
	base_height,
	carriage_to_filament_y_spacing,
	motor_base_to_hotend_z_spacing,
    carriage_top_bearings_separation,
    carriage_bottom_bearings_separation,
    carriage_bearing_diameter,
    carriage_bearing_length,
    carriage_bearing_holder_length,
    carriage_bearing_holder_wall_size,
    carriage_bearing_holder_holes,
    x_rods_separation,
    z_rods_separation,
    xz_rods_separation,
    rod_diameter,
    x_ends_distance,
    extruder_position,
    fan_extra_height,
    fan_outlet_width,
    fan_outlet_height,
    fan_outlet_angle,
    fan_tip_length,
    fan_tip_angle,
    sensor_type,
    sensor_bltouch_rotated,
    sensor_round_inner_diameter,
    sensor_round_outer_diameter,
    sensor_arm_style,
    sensor_z_offset,
    sensor_y_offset,
    sensor_arm_horizontal_thickness,
    x_end_height,
    x_end_extra_width,
    x_end_main_body_width,
    x_end_bearing_diameter,
    x_end_bearing_holder_wall_size,
    x_end_bearing_gap_width,
    x_end_bearing_tab_width,
    x_end_bearing_n_holes,
    x_end_bearing_hole_size,
    x_end_nut_holder_inner_diameter,
    x_end_nut_holder_outer_diameter,
    x_end_nut_holder_height,
    x_end_nut_holes_radial_separation,
    x_end_nut_n_holes,
    x_end_nut_hole_size,
    x_end_tensioner_holder_wall_size,
    x_end_tensioner_holder_hole_size,
    x_end_pulley_screw_head_diameter,
    x_end_motor_x_offset,
    x_end_motorshaft_hole_diameter,
    x_end_front_motor,
    x_endstop,
    x_endstop_screw_size,
    x_endstop_screw_sep,
    x_endstop_screw_depth,
    x_endstop_elevation,
    z_endstop_screw_holder_depth,
    z_endstop_rod_screw_x_offset,
    z_endstop_rod_screw_y_offset,
    z_endstop_screw_hole_size
)
{
	prometheus = (hot_end == "prometheus");
	dual_extruder = (extruders == "dual");
	flex_guide_safety_tolerance = flex_guide_groove_fill_tolerance / 100;
	if(part == "assembly")
	{
		assembly(
			dual_extruder = dual_extruder,
			base_holes_toprow_top = base_holes_toprow_top,
			base_holes_toprow_spacing = base_holes_toprow_spacing,
			base_holes_midrow_top = base_holes_midrow_top,
			base_holes_midrow_spacing = base_holes_midrow_spacing,
			base_holes_bottomrow_top = base_holes_bottomrow_top,
			base_holes_bottomrow_spacing = base_holes_bottomrow_spacing,
			base_height = base_height,
			filament_d = filament_diameter,
			gear_od = gear_outer_diameter,
			gear_ed = gear_effective_diameter,
			gear_groove_width = gear_groove_width,
			gear_height = gear_height,
			bearing_od = bearing_outer_diameter,
			bearing_ed = bearing_effective_diameter,
			bearing_id = bearing_inner_diameter,
			bearing_groove_width = bearing_groove_width,
			bearing_height = bearing_height,
			flex_guide_safety_tolerance = flex_guide_safety_tolerance,
			width = 42.5,
			cover_depth = cover_depth,
			carriage_to_filament_zoffset = carriage_to_filament_y_spacing,
			motor_to_hotend_yoffset = motor_base_to_hotend_z_spacing,
			lever_height = 12,
			fillet = fillet,
			supports = supports,
			prometheus=prometheus,
			brass_tube=brass_tube,
			front_holes=front_holes,
            carriage_top_bearings_separation = carriage_top_bearings_separation,
            carriage_bottom_bearings_separation = carriage_bottom_bearings_separation,
            carriage_bearing_diameter = carriage_bearing_diameter,
            carriage_bearing_length = carriage_bearing_length,
            carriage_bearing_holder_length = carriage_bearing_holder_length,
            carriage_bearing_holder_wall_size = carriage_bearing_holder_wall_size,
            carriage_bearing_holder_holes = carriage_bearing_holder_holes,
            x_rods_separation = x_rods_separation,
            z_rods_separation = z_rods_separation,
            xz_rods_separation = xz_rods_separation,
            rod_diameter = rod_diameter,
            x_ends_distance = x_ends_distance,
            extruder_position = extruder_position,
            fan_extra_height = fan_extra_height,
            fan_outlet_width = fan_outlet_width,
            fan_outlet_height = fan_outlet_height,
            fan_outlet_angle = fan_outlet_angle,
            fan_tip_length = fan_tip_length,
            fan_tip_angle = fan_tip_angle,
            sensor_type = sensor_type,
            sensor_bltouch_rotated = sensor_bltouch_rotated,
            sensor_round_inner_diameter = sensor_round_inner_diameter,
            sensor_round_outer_diameter = sensor_round_outer_diameter,
            sensor_arm_style = sensor_arm_style,
            sensor_z_offset = sensor_z_offset,
            sensor_y_offset = sensor_y_offset,
            sensor_arm_horizontal_thickness = sensor_arm_horizontal_thickness,
            x_end_height = x_end_height,
            x_end_extra_width = x_end_extra_width,
            x_end_main_body_width = x_end_main_body_width,
            x_end_bearing_diameter = x_end_bearing_diameter,
            x_end_bearing_holder_wall_size = x_end_bearing_holder_wall_size,
            x_end_bearing_gap_width = x_end_bearing_gap_width,
            x_end_bearing_tab_width = x_end_bearing_tab_width,
            x_end_bearing_n_holes = x_end_bearing_n_holes,
            x_end_bearing_hole_size = x_end_bearing_hole_size,
            x_end_nut_holder_inner_diameter = x_end_nut_holder_inner_diameter,
            x_end_nut_holder_outer_diameter = x_end_nut_holder_outer_diameter,
            x_end_nut_holder_height = x_end_nut_holder_height,
            x_end_nut_holes_radial_separation = x_end_nut_holes_radial_separation,
            x_end_nut_n_holes = x_end_nut_n_holes,
            x_end_nut_hole_size = x_end_nut_hole_size,
            x_end_tensioner_holder_wall_size = x_end_tensioner_holder_wall_size,
            x_end_tensioner_holder_hole_size = x_end_tensioner_holder_hole_size,
            x_end_pulley_screw_head_diameter = x_end_pulley_screw_head_diameter,
            x_end_motor_x_offset = x_end_motor_x_offset,
            x_end_motorshaft_hole_diameter = x_end_motorshaft_hole_diameter,
            x_end_front_motor = x_end_front_motor,
            x_endstop = x_endstop,
            x_endstop_screw_size = x_endstop_screw_size,
            x_endstop_screw_sep = x_endstop_screw_sep,
            x_endstop_screw_depth = x_endstop_screw_depth,
            x_endstop_elevation = x_endstop_elevation,
            z_endstop_screw_holder_depth = z_endstop_screw_holder_depth,
            z_endstop_rod_screw_x_offset = z_endstop_rod_screw_x_offset,
            z_endstop_rod_screw_y_offset = z_endstop_rod_screw_y_offset,
            z_endstop_screw_hole_size = z_endstop_screw_hole_size
		);
	}
	else
	{
		print_base = part=="rh_print_all" || part=="lh_print_all" || part=="base";
        print_carriage = part=="rh_print_all" || part=="lh_print_all" || part=="carriage";
        print_xend_motor = part=="xendm";
        print_xend_idler = part=="xendi";
        print_xend_tensioner = part=="xendt";
		print_holder = part=="rh_print_all" || part=="lh_print_all" || part=="rh_holder" || part=="lh_holder";
		print_cover = part=="rh_print_all" || part=="lh_print_all" || part=="rh_cover" || part=="lh_cover";
		print_lever = part=="rh_print_all" || part=="lh_print_all" || part=="rh_lever" || part=="lh_lever";
		print_top_plate = part=="rh_print_all" || part=="lh_print_all" || part=="rh_top_plate" || part=="lh_top_plate";
		print_duct =  part=="rh_print_all" || part=="lh_print_all" || part=="rh_duct" || part=="lh_duct";
        print_sensor = part=="sensor";
		mirrored = (part=="lh_print_all" || part=="lh_holder" || part=="lh_cover" || part=="lh_lever" || part=="lh_top_plate" || part=="lh_duct") ? 1 : 0;
		print(
			mirrored = mirrored,
			show_base = print_base,
			show_holder = print_holder,
			show_cover = print_cover,
			show_lever = print_lever,
			show_top_plate = print_top_plate,
            show_carriage = print_carriage,
            show_xend_motor = print_xend_motor,
            show_xend_idler = print_xend_idler,
            show_xend_tensioner = print_xend_tensioner,
            show_duct = print_duct,
            show_sensor = print_sensor,
			dual_extruder = dual_extruder,
			base_holes_toprow_top = base_holes_toprow_top,
			base_holes_toprow_spacing = base_holes_toprow_spacing,
			base_holes_midrow_top = base_holes_midrow_top,
			base_holes_midrow_spacing = base_holes_midrow_spacing,
			base_holes_bottomrow_top = base_holes_bottomrow_top,
			base_holes_bottomrow_spacing = base_holes_bottomrow_spacing,
			base_height = base_height,
			filament_d = filament_diameter,
			gear_od = gear_outer_diameter,
			gear_ed = gear_effective_diameter,
			gear_groove_width = gear_groove_width,
			gear_height = gear_height,
			bearing_od = bearing_outer_diameter,
			bearing_ed = bearing_effective_diameter,
			bearing_id = bearing_inner_diameter,
			bearing_groove_width = bearing_groove_width,
			bearing_height = bearing_height,
			flex_guide_safety_tolerance = flex_guide_safety_tolerance,
			width = 42.5,
			cover_depth = cover_depth,
			carriage_to_filament_zoffset = carriage_to_filament_y_spacing,
			motor_to_hotend_yoffset = motor_base_to_hotend_z_spacing,
			lever_height = 12,
			fillet = fillet,
			supports = supports,
			prometheus = prometheus,
			brass_tube = brass_tube,
			front_holes=front_holes,
            carriage_top_bearings_separation = carriage_top_bearings_separation,
            carriage_bottom_bearings_separation = carriage_bottom_bearings_separation,
            carriage_bearing_diameter = carriage_bearing_diameter,
            carriage_bearing_length = carriage_bearing_length,
            carriage_bearing_holder_length = carriage_bearing_holder_length,
            carriage_bearing_holder_wall_size = carriage_bearing_holder_wall_size,
            carriage_bearing_holder_holes = carriage_bearing_holder_holes,
            x_rods_separation = x_rods_separation,
            z_rods_separation = z_rods_separation,
            xz_rods_separation = xz_rods_separation,
            rod_diameter = rod_diameter,
            fan_extra_height = fan_extra_height,
            fan_outlet_width = fan_outlet_width,
            fan_outlet_height = fan_outlet_height,
            fan_outlet_angle = fan_outlet_angle,
            fan_tip_length = fan_tip_length,
            fan_tip_angle = fan_tip_angle,
            sensor_type = sensor_type,
            sensor_bltouch_rotated = sensor_bltouch_rotated,
            sensor_round_inner_diameter = sensor_round_inner_diameter,
            sensor_round_outer_diameter = sensor_round_outer_diameter,
            sensor_arm_style = sensor_arm_style,
            sensor_z_offset = sensor_z_offset,
            sensor_y_offset = sensor_y_offset,
            sensor_arm_horizontal_thickness = sensor_arm_horizontal_thickness,
            x_end_height = x_end_height,
            x_end_extra_width = x_end_extra_width,
            x_end_main_body_width = x_end_main_body_width,
            x_end_bearing_diameter = x_end_bearing_diameter,
            x_end_bearing_holder_wall_size = x_end_bearing_holder_wall_size,
            x_end_bearing_gap_width = x_end_bearing_gap_width,
            x_end_bearing_tab_width = x_end_bearing_tab_width,
            x_end_bearing_n_holes = x_end_bearing_n_holes,
            x_end_bearing_hole_size = x_end_bearing_hole_size,
            x_end_nut_holder_inner_diameter = x_end_nut_holder_inner_diameter,
            x_end_nut_holder_outer_diameter = x_end_nut_holder_outer_diameter,
            x_end_nut_holder_height = x_end_nut_holder_height,
            x_end_nut_holes_radial_separation = x_end_nut_holes_radial_separation,
            x_end_nut_n_holes = x_end_nut_n_holes,
            x_end_nut_hole_size = x_end_nut_hole_size,
            x_end_tensioner_holder_wall_size = x_end_tensioner_holder_wall_size,
            x_end_tensioner_holder_hole_size = x_end_tensioner_holder_hole_size,
            x_end_pulley_screw_head_diameter = x_end_pulley_screw_head_diameter,
            x_end_motor_x_offset = x_end_motor_x_offset,
            x_end_motorshaft_hole_diameter = x_end_motorshaft_hole_diameter,
            x_end_front_motor = x_end_front_motor,
            x_endstop = x_endstop,
            x_endstop_screw_size = x_endstop_screw_size,
            x_endstop_screw_sep = x_endstop_screw_sep,
            x_endstop_screw_depth = x_endstop_screw_depth,
            x_endstop_elevation = x_endstop_elevation,
            z_endstop_screw_holder_depth = z_endstop_screw_holder_depth,
            z_endstop_rod_screw_x_offset = z_endstop_rod_screw_x_offset,
            z_endstop_rod_screw_y_offset = z_endstop_rod_screw_y_offset,
            z_endstop_screw_hole_size = z_endstop_screw_hole_size

		);
	}
}

module print(
	mirrored = 0,
	show_base = true,
	show_holder = true,
	show_cover = true,
	show_lever = true,
	show_top_plate = true,
    show_carriage = true,
    show_xend_motor = false,
    show_xend_idler = false,
    show_xend_tensioner = false,
    show_duct = true,
    show_sensor = true,
	dual_extruder = false, //use two extruders
	base_holes_toprow_top = 24, // top row top
	base_holes_toprow_spacing = 20, // top row spacing
	base_holes_midrow_top = 35, // middle row top
	base_holes_midrow_spacing = 30, // middle row spacing
	base_holes_bottomrow_top = 46, // bottom row top
	base_holes_bottomrow_spacing = 20, // bottom row spacing
	base_height = 51,
	filament_d = 1.75,  // filament diameter
	gear_od = 11,  // gear outer diameter
	gear_ed = 11,  // gear effective diameter
	gear_groove_width = 3.2, // gear groove width
	gear_height = 10,
	bearing_od = 13,  // bearing outer diameter
	bearing_ed = 12, // bearing effective diameter
	bearing_id = 4, // bearing input diameter
	bearing_groove_width = 2.1, // bearing groove width
	bearing_height = 4, // bearing height
	flex_guide_safety_tolerance = 0.05,
	width = 42.5,
	cover_depth = 16,
	carriage_to_filament_zoffset = 30,
	motor_to_hotend_yoffset = 20,
	lever_height = 12,
	fillet = 1,
	supports = true,
	prometheus=false,
	brass_tube=true,
	front_holes=true,
    carriage_top_bearings_separation = 10,
    carriage_bottom_bearings_separation = 10,
    carriage_bearing_diameter = 15,
    carriage_bearing_length = 24,
    carriage_bearing_holder_length = 15.3,
    carriage_bearing_holder_wall_size = 2,
    carriage_bearing_holder_holes = 1,
    x_rods_separation=45,
    z_rods_separation=27,
    xz_rods_separation=22,
    rod_diameter=8,
    fan_extra_height = 0,
    fan_outlet_width = 10,
    fan_outlet_height = 3,
    fan_outlet_angle = 0,
    fan_tip_length = 15,
    fan_tip_angle = 80,
    sensor_type = "bltouch",
    sensor_bltouch_rotated = false,
    sensor_round_inner_diameter = 18,
    sensor_round_outer_diameter = 30,
    sensor_arm_style = "reinforced",
    sensor_z_offset = 60,
    sensor_y_offset = 30,
    sensor_arm_horizontal_thickness = 10,
    x_end_height=60,
    x_end_extra_width=0,
    x_end_main_body_width=18,
    x_end_bearing_diameter=15,
    x_end_bearing_holder_wall_size=2,
    x_end_bearing_gap_width=1.5,
    x_end_bearing_tab_width=3.5,
    x_end_bearing_n_holes=2,
    x_end_bearing_hole_size=2.5,
    x_end_nut_holder_inner_diameter=10.2,
    x_end_nut_holder_outer_diameter=23,
    x_end_nut_holder_height=10,
    x_end_nut_holes_radial_separation=8,
    x_end_nut_n_holes=4,
    x_end_nut_hole_size=3.5,
    x_end_tensioner_holder_wall_size=3,
    x_end_tensioner_holder_hole_size=3,
    x_end_pulley_screw_head_diameter=20,
    x_end_motor_x_offset=5,
    x_end_motorshaft_hole_diameter=30,
    x_end_front_motor=false,
    x_endstop=true,
    x_endstop_screw_size=2.2,
    x_endstop_screw_sep=9.5,
    x_endstop_screw_depth=5,
    x_endstop_elevation=8,
    z_endstop_screw_holder_depth=8,
    z_endstop_rod_screw_x_offset=26,
    z_endstop_rod_screw_y_offset=5,
    z_endstop_screw_hole_size=3
	)
{    
	mirror ([mirrored, 0, 0]) {
		xadd = dual_extruder ? 1.5*width : width;
		
		translate([0, 31, carriage_to_filament_zoffset])
			rotate([-90, 0, 0])
				if (show_base)
					base(
						dual = dual_extruder,
						holes_top1 = base_holes_toprow_top,
						holes_spacing1 = base_holes_toprow_spacing,
						holes_top2 = base_holes_midrow_top,
						holes_spacing2 = base_holes_midrow_spacing,
						holes_top3 = base_holes_bottomrow_top,
						holes_spacing3 = base_holes_bottomrow_spacing,
						width = width,
						height = base_height,
						carriage_to_filament_zoffset = carriage_to_filament_zoffset,
						motor_to_hotend_yoffset = motor_to_hotend_yoffset,
						fillet = fillet
					);

		translate([15+xadd, 3+motor_to_hotend_yoffset, 10])
			rotate([-90, 0, 0])
				if (show_top_plate)
					top_plate(
						brass_tube = brass_tube
					);
		translate([15+xadd, 0, 10])
			rotate([-90, 0, 0])
				if (show_holder)
					holder(
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
						flex_guide_safety_tolerance = flex_guide_safety_tolerance,
						width = width,
						carriage_to_filament_zoffset = carriage_to_filament_zoffset,
						motor_to_hotend_yoffset = motor_to_hotend_yoffset,
						fillet = fillet,
						supports = supports,
						prometheus=prometheus,
						brass_tube = brass_tube
					);      
		translate([30+xadd+width, 0,0])
		{   
			translate([0, 0, cover_depth])
				rotate([-90, 180, 0])
					if (show_cover)
						cover(
							filament_d = filament_d,
							gear_ed = gear_ed,
							width = width,
							cover_depth = cover_depth,
							motor_to_hotend_yoffset = motor_to_hotend_yoffset,
							fillet = fillet,
							prometheus=prometheus,
							front_holes=front_holes
						);
			translate([0 ,40+motor_to_hotend_yoffset, width])
				rotate([-180, 0, 0])
					if (show_lever)
						lever(
							filament_d = filament_d,
							gear_ed = gear_ed, 
							bearing_od = bearing_od,
							bearing_ed = bearing_ed,
							bearing_id = bearing_id,
							bearing_height = bearing_height,
							lever_height = lever_height, 
							fillet = fillet,
							brass_tube = brass_tube
						);
		}

		translate([50+xadd+2*width, 0,0])
		{   
			translate([0, 0, cover_depth])
				//rotate([-90, 180, 0])
					if (show_duct)
                    fan_duct(
                        fan_elevation = fan_extra_height,
                        outlet_width = fan_outlet_width,
                        outlet_height = fan_outlet_height,
                        tip_length = fan_tip_length,
                        angle = fan_tip_angle,
                        automatic_outlet_angle = false,
                        outlet_angle = fan_outlet_angle
                    );

		}
        
        translate([0, -base_height- motor_to_hotend_yoffset, 0])
			rotate([-90, 0, 0])
				if (show_carriage)
					carriage(
                        holes_top1 = base_holes_toprow_top,
                        holes_spacing1 = base_holes_toprow_spacing,
                        holes_top2 = base_holes_midrow_top,
                        holes_spacing2 = base_holes_midrow_spacing,
                        holes_top3 = base_holes_bottomrow_top,
                        holes_spacing3 = base_holes_bottomrow_spacing,
                        motor_to_hotend_yoffset = motor_to_hotend_yoffset,
                        fillet = fillet,    
                        carriage_top_bearings_separation = carriage_top_bearings_separation,
                        carriage_bottom_bearings_separation = carriage_bottom_bearings_separation,
                        carriage_bearing_diameter = carriage_bearing_diameter,
                        carriage_bearing_length = carriage_bearing_length,
                        carriage_bearing_holder_length = carriage_bearing_holder_length,
                        carriage_bearing_holder_wall_size = carriage_bearing_holder_wall_size,
                        carriage_bearing_holder_holes = carriage_bearing_holder_holes,
                        x_rods_separation = x_rods_separation,
                        rod_diameter=rod_diameter
					);
        if (show_xend_motor)
            x_end_motor(
                height=x_end_height,
                extra_width=x_end_extra_width, 
                z_rod_sep=z_rods_separation,
                x_rod_sep=x_rods_separation,
                zx_rod_sep=xz_rods_separation,
                rod_diameter=rod_diameter,
                main_body_width=x_end_main_body_width,
                bearing_diameter=x_end_bearing_diameter, 
                bearing_holder_wall_size=x_end_bearing_holder_wall_size, 
                bearing_gap_width=x_end_bearing_gap_width, 
                bearing_tab_width=x_end_bearing_tab_width, 
                bearing_n_holes=x_end_bearing_n_holes, 
                bearing_hole_size=x_end_bearing_hole_size,
                nut_holder_inner_diameter=x_end_nut_holder_inner_diameter,
                nut_holder_outer_diameter=x_end_nut_holder_outer_diameter,
                nut_holder_height=x_end_nut_holder_height,
                nut_holes_radial_separation=x_end_nut_holes_radial_separation,
                nut_n_holes=x_end_nut_n_holes,
                nut_hole_size=x_end_nut_hole_size,
                tensioner_holder_wall_size=x_end_tensioner_holder_wall_size,
                tensioner_holder_hole_size=x_end_tensioner_holder_hole_size,
                pulley_screw_head_diameter=x_end_pulley_screw_head_diameter,
                motor_x_offset=x_end_motor_x_offset,
                motorshaft_hole_diameter=x_end_motorshaft_hole_diameter,
                front_motor=x_end_front_motor,
                x_endstop=x_endstop,
                x_endstop_screw_size=x_endstop_screw_size,
                x_endstop_screw_sep=x_endstop_screw_sep,
                x_endstop_screw_depth=x_endstop_screw_depth,                   
                x_endstop_elevation=x_endstop_elevation,
                z_endstop_screw_holder_depth=z_endstop_screw_holder_depth,
                z_endstop_rod_screw_x_offset=z_endstop_rod_screw_x_offset,
                z_endstop_rod_screw_y_offset=z_endstop_rod_screw_y_offset,
                z_endstop_screw_hole_size=z_endstop_screw_hole_size);
        if (show_xend_idler)
            x_end(
                height=x_end_height,
                extra_width=x_end_extra_width, 
                z_rod_sep=z_rods_separation,
                x_rod_sep=x_rods_separation,
                zx_rod_sep=xz_rods_separation,
                rod_diameter=rod_diameter,
                main_body_width=x_end_main_body_width,
                bearing_diameter=x_end_bearing_diameter, 
                bearing_holder_wall_size=x_end_bearing_holder_wall_size, 
                bearing_gap_width=x_end_bearing_gap_width, 
                bearing_tab_width=x_end_bearing_tab_width, 
                bearing_n_holes=x_end_bearing_n_holes, 
                bearing_hole_size=x_end_bearing_hole_size,
                nut_holder_inner_diameter=x_end_nut_holder_inner_diameter,
                nut_holder_outer_diameter=x_end_nut_holder_outer_diameter,
                nut_holder_height=x_end_nut_holder_height,
                nut_holes_radial_separation=x_end_nut_holes_radial_separation,
                nut_n_holes=x_end_nut_n_holes,
                nut_hole_size=x_end_nut_hole_size,
                tensioner_holder_wall_size=x_end_tensioner_holder_wall_size,
                tensioner_holder_hole_size=x_end_tensioner_holder_hole_size,
                pulley_screw_head_diameter=x_end_pulley_screw_head_diameter);
                
        if (show_sensor)
            translate([0, 0, sensor_z_offset])
                sensor_mount(
                    sensor_type = sensor_type,
                    bltouch_rotated = sensor_bltouch_rotated,
                    round_sensor_inner_diameter = sensor_round_inner_diameter,
                    round_sensor_outer_diameter = sensor_round_outer_diameter,

                    arm_style = sensor_arm_style,
                    arm_width = 12,
                    sensor_z_offset = sensor_z_offset,
                    sensor_y_offset = sensor_y_offset,
                    arm_vertical_thickness = 4.5,
                    arm_horizontal_thickness = sensor_arm_horizontal_thickness,

                    mount_width = dual_extruder ? 34 : 32.5,  
                    mount_height = motor_to_hotend_yoffset, 
                    mount_thickness = 4.5,
                    mount_slots = 2,
                    mount_slot_separation = dual_extruder ? 22.5 : 20,
                    mount_slot_length = motor_to_hotend_yoffset-10,
                    screw_head_diameter = 5.5, 
                    screw_hole_diameter = 2.8);

	}
}

module assembly(
	dual_extruder = false, //use two extruders
	base_holes_toprow_top = 24, // top row top
	base_holes_toprow_spacing = 20, // top row spacing
	base_holes_midrow_top = 35, // middle row top
	base_holes_midrow_spacing = 30, // middle row spacing
	base_holes_bottomrow_top = 46, // bottom row top
	base_holes_bottomrow_spacing = 20, // bottom row spacing
	base_height = 51,
	filament_d = 1.75,  // filament diameter
	gear_od = 11,  // gear outer diameter
	gear_ed = 11,  // gear effective diameter
	gear_groove_width = 3.2, // gear groove width
	gear_height = 10,
	bearing_od = 13,  // bearing outer diameter
	bearing_ed = 12, // bearing effective diameter
	bearing_id = 4, // bearing input diameter
	bearing_groove_width = 2.1, // bearing groove width
	bearing_height = 4, // bearing height
	flex_guide_safety_tolerance = 0.05,
	width = 42.5,
	cover_depth = 16,
	carriage_to_filament_zoffset = 30,
	motor_to_hotend_yoffset = 20,
	lever_height = 12,
	fillet = 1,
	supports = false,
	prometheus=false,
	brass_tube=true,
	front_holes=true,
    carriage_top_bearings_separation = 10,
    carriage_bottom_bearings_separation = 10,
    carriage_bearing_diameter = 15,
    carriage_bearing_length = 24,
    carriage_bearing_holder_length = 15.3,
    carriage_bearing_holder_wall_size = 2,
    carriage_bearing_holder_holes = 1,
    x_rods_separation=45,
    z_rods_separation=27,
    xz_rods_separation=22,
    rod_diameter=8,
    x_ends_distance = 300,
    extruder_position = 50,
    fan_extra_height = 0,
    fan_outlet_width = 10,
    fan_outlet_height = 3,
    fan_outlet_angle = 0,
    fan_tip_length = 15,
    fan_tip_angle = 80,
    sensor_type = "bltouch",
    sensor_bltouch_rotated = false,
    sensor_round_inner_diameter = 18,
    sensor_round_outer_diameter = 30,
    sensor_arm_style = "reinforced",
    sensor_z_offset = 60,
    sensor_y_offset = 30,
    sensor_arm_horizontal_thickness = 10,
    x_end_height=60,
    x_end_extra_width=0,
    x_end_main_body_width=18,
    x_end_bearing_diameter=15,
    x_end_bearing_holder_wall_size=2,
    x_end_bearing_gap_width=1.5,
    x_end_bearing_tab_width=3.5,
    x_end_bearing_n_holes=2,
    x_end_bearing_hole_size=2.5,
    x_end_nut_holder_inner_diameter=10.2,
    x_end_nut_holder_outer_diameter=23,
    x_end_nut_holder_height=10,
    x_end_nut_holes_radial_separation=8,
    x_end_nut_n_holes=4,
    x_end_nut_hole_size=3.5,
    x_end_tensioner_holder_wall_size=3,
    x_end_tensioner_holder_hole_size=3,
    x_end_pulley_screw_head_diameter=20,
    x_end_motor_x_offset=5,
    x_end_motorshaft_hole_diameter=30,
    x_end_front_motor=false,
    x_endstop=true,
    x_endstop_screw_size=2.2,
    x_endstop_screw_sep=9.5,
    x_endstop_screw_depth=5,
    x_endstop_elevation=8,
    z_endstop_screw_holder_depth=8,
    z_endstop_rod_screw_x_offset=26,
    z_endstop_rod_screw_y_offset=5,
    z_endstop_screw_hole_size=3
	)
{
	base_w = dual_extruder ? width*2 : width;
	xadd = dual_extruder ? width/2 : 0;

	top_width = max(carriage_bearing_length, carriage_bearing_holder_length)+carriage_top_bearings_separation+2*fillet;
	bottom_width = max(carriage_bearing_length, carriage_bearing_holder_length)+carriage_bottom_bearings_separation+2*fillet;
	middle_width = max(base_holes_toprow_spacing, base_holes_midrow_spacing, base_holes_bottomrow_spacing)+15;
	carriage_width = max(base_w, top_width, bottom_width, middle_width);
    carriage_offset = ((x_ends_distance - carriage_width)/100)*(extruder_position-50);
	translate([carriage_offset,0,0]) {
        color("gold")
            base(
                dual = dual_extruder,
                holes_top1 = base_holes_toprow_top,
                holes_spacing1 = base_holes_toprow_spacing,
                holes_top2 = base_holes_midrow_top,
                holes_spacing2 = base_holes_midrow_spacing,
                holes_top3 = base_holes_bottomrow_top,
                holes_spacing3 = base_holes_bottomrow_spacing,
                width = width,
                height = base_height,
                carriage_to_filament_zoffset = carriage_to_filament_zoffset,
                motor_to_hotend_yoffset = motor_to_hotend_yoffset,
                fillet = fillet
            );
        color("teal")
            translate ([0, carriage_to_filament_zoffset, 0])
                mirror([0,1,0])
                    carriage(
                        holes_top1 = base_holes_toprow_top,
                        holes_spacing1 = base_holes_toprow_spacing,
                        holes_top2 = base_holes_midrow_top,
                        holes_spacing2 = base_holes_midrow_spacing,
                        holes_top3 = base_holes_bottomrow_top,
                        holes_spacing3 = base_holes_bottomrow_spacing,
                        motor_to_hotend_yoffset = motor_to_hotend_yoffset,
                        fillet = fillet,    
                        carriage_top_bearings_separation = carriage_top_bearings_separation,
                        carriage_bottom_bearings_separation = carriage_bottom_bearings_separation,
                        carriage_bearing_diameter = carriage_bearing_diameter,
                        carriage_bearing_length = carriage_bearing_length,
                        carriage_bearing_holder_length = carriage_bearing_holder_length,
                        carriage_bearing_holder_wall_size = carriage_bearing_holder_wall_size,
                        carriage_bearing_holder_holes = carriage_bearing_holder_holes,
                        x_rods_separation = x_rods_separation,
                        rod_diameter=rod_diameter
                    );
	translate([0, -cover_depth,motor_to_hotend_yoffset/2]) {
            sensor_mount(
                sensor_type = sensor_type,
                bltouch_rotated = sensor_bltouch_rotated,
                round_sensor_inner_diameter = sensor_round_inner_diameter,
                round_sensor_outer_diameter = sensor_round_outer_diameter,

                arm_style = sensor_arm_style,
                arm_width = 12,
                sensor_z_offset = sensor_z_offset,
                sensor_y_offset = sensor_y_offset,
                arm_vertical_thickness = 4.5,
                arm_horizontal_thickness = sensor_arm_horizontal_thickness,

                mount_width = dual_extruder ? 34 : 32.5,  
                mount_height = motor_to_hotend_yoffset, 
                mount_thickness = 4.5,
                mount_slots = 2,
                mount_slot_separation = dual_extruder ? 22.5 : 20,
                mount_slot_length = motor_to_hotend_yoffset-10,
                screw_head_diameter = 5.5, 
                screw_hole_diameter = 2.8);
            if(sensor_type == "bltouch")
                color("grey")
                    translate([0,-sensor_y_offset,-sensor_z_offset])
                        rotate([180,0,sensor_bltouch_rotated ? 0 : 90])
                            import("lib/bltouch_dummy.stl");
    }
//        color("grey")
//                translate([-(base_w/2+7.5),-18,-15.5])
//                    rotate([180,90,0])
//                        import("lib/ODB5115.stl");

        translate ([-xadd, 0, 0])
            assembly_single(
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
                flex_guide_safety_tolerance = flex_guide_safety_tolerance,
                width = width,
                cover_depth = cover_depth,
                carriage_to_filament_zoffset = carriage_to_filament_zoffset,
                motor_to_hotend_yoffset = motor_to_hotend_yoffset,
                lever_height = lever_height,
                fillet = fillet,
                supports = supports,
                prometheus = prometheus,
                brass_tube = brass_tube,
                front_holes=front_holes,
                fan_extra_height = fan_extra_height,
                fan_outlet_width = fan_outlet_width,
                fan_outlet_height = fan_outlet_height,
                fan_outlet_angle = fan_outlet_angle,
                fan_tip_length = fan_tip_length,
                fan_tip_angle = fan_tip_angle
            );
        if (dual_extruder)
        {
            translate ([xadd, 0, 0])
            {
                mirror([1, 0, 0])
                {
                    assembly_single(
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
                        flex_guide_safety_tolerance = flex_guide_safety_tolerance,
                        width = width,
                        cover_depth = cover_depth,
                        carriage_to_filament_zoffset = carriage_to_filament_zoffset,
                        motor_to_hotend_yoffset = motor_to_hotend_yoffset,
                        lever_height = lever_height,
                        fillet = fillet,
                        supports = supports,
                        prometheus = prometheus,
                        brass_tube = brass_tube,
                        front_holes=front_holes,
                        fan_extra_height = fan_extra_height,
                        fan_outlet_width = fan_outlet_width,
                        fan_outlet_height = fan_outlet_height,
                        fan_outlet_angle = fan_outlet_angle,
                        fan_tip_length = fan_tip_length,
                        fan_tip_angle = fan_tip_angle
                    );
                }
            }
        }
    }

    translate ([-x_ends_distance/2-z_rods_separation-x_end_nut_holder_outer_diameter/2-x_end_extra_width, carriage_to_filament_zoffset-xz_rods_separation+8+carriage_bearing_diameter/2, 
motor_to_hotend_yoffset-carriage_bearing_diameter/2-carriage_bearing_holder_wall_size-x_rods_separation+(-x_end_height+x_rods_separation)/2])
    {
        color("SteelBlue")
            x_end_motor(
                height=x_end_height,
                extra_width=x_end_extra_width, 
                z_rod_sep=z_rods_separation,
                x_rod_sep=x_rods_separation,
                zx_rod_sep=xz_rods_separation,
                rod_diameter=rod_diameter,
                main_body_width=x_end_main_body_width,
                bearing_diameter=x_end_bearing_diameter, 
                bearing_holder_wall_size=x_end_bearing_holder_wall_size, 
                bearing_gap_width=x_end_bearing_gap_width, 
                bearing_tab_width=x_end_bearing_tab_width, 
                bearing_n_holes=x_end_bearing_n_holes, 
                bearing_hole_size=x_end_bearing_hole_size,
                nut_holder_inner_diameter=x_end_nut_holder_inner_diameter,
                nut_holder_outer_diameter=x_end_nut_holder_outer_diameter,
                nut_holder_height=x_end_nut_holder_height,
                nut_holes_radial_separation=x_end_nut_holes_radial_separation,
                nut_n_holes=x_end_nut_n_holes,
                nut_hole_size=x_end_nut_hole_size,
                tensioner_holder_wall_size=x_end_tensioner_holder_wall_size,
                tensioner_holder_hole_size=x_end_tensioner_holder_hole_size,
                pulley_screw_head_diameter=x_end_pulley_screw_head_diameter,
                motor_x_offset=x_end_motor_x_offset,
                motorshaft_hole_diameter=x_end_motorshaft_hole_diameter,
                front_motor=x_end_front_motor,
                x_endstop=x_endstop,
                x_endstop_screw_size=x_endstop_screw_size,
                x_endstop_screw_sep=x_endstop_screw_sep,
                x_endstop_screw_depth=x_endstop_screw_depth,                   
                x_endstop_elevation=x_endstop_elevation,
                z_endstop_screw_holder_depth=z_endstop_screw_holder_depth,
                z_endstop_rod_screw_x_offset=z_endstop_rod_screw_x_offset,
                z_endstop_rod_screw_y_offset=z_endstop_rod_screw_y_offset,
                z_endstop_screw_hole_size=z_endstop_screw_hole_size);
                // motor
                translate([-x_end_bearing_diameter/2-x_end_bearing_holder_wall_size-42.5/2-5, 52+x_end_main_body_width/2, x_end_height/2])
                    rotate([90,0,0])
                        color("gray", 0.5)
                            nema17(motor_length=30);
        }
	color("SteelBlue")
    	translate ([x_ends_distance/2+z_rods_separation+x_end_nut_holder_outer_diameter/2+x_end_extra_width, carriage_to_filament_zoffset-xz_rods_separation+8+carriage_bearing_diameter/2, 
motor_to_hotend_yoffset-carriage_bearing_diameter/2-carriage_bearing_holder_wall_size-x_rods_separation+(-x_end_height+x_rods_separation)/2])
            mirror([0,0,0])
           x_end(
                height=x_end_height,
                extra_width=x_end_extra_width, 
                z_rod_sep=z_rods_separation,
                x_rod_sep=x_rods_separation,
                zx_rod_sep=xz_rods_separation,
                rod_diameter=rod_diameter,
                main_body_width=x_end_main_body_width,
                bearing_diameter=x_end_bearing_diameter, 
                bearing_holder_wall_size=x_end_bearing_holder_wall_size, 
                bearing_gap_width=x_end_bearing_gap_width, 
                bearing_tab_width=x_end_bearing_tab_width, 
                bearing_n_holes=x_end_bearing_n_holes, 
                bearing_hole_size=x_end_bearing_hole_size,
                nut_holder_inner_diameter=x_end_nut_holder_inner_diameter,
                nut_holder_outer_diameter=x_end_nut_holder_outer_diameter,
                nut_holder_height=x_end_nut_holder_height,
                nut_holes_radial_separation=x_end_nut_holes_radial_separation,
                nut_n_holes=x_end_nut_n_holes,
                nut_hole_size=x_end_nut_hole_size,
                tensioner_holder_wall_size=x_end_tensioner_holder_wall_size,
                tensioner_holder_hole_size=x_end_tensioner_holder_hole_size,
                pulley_screw_head_diameter=x_end_pulley_screw_head_diameter);
}

module assembly_single(
	filament_d = 1.75,  // filament diameter
	gear_od = 11,  // gear outer diameter
	gear_ed = 11,  // gear effective diameter
	gear_groove_width = 3.2, // gear groove width
	gear_height = 10,
	bearing_od = 13,  // bearing outer diameter
	bearing_ed = 12, // bearing effective diameter
	bearing_id = 4, // bearing input diameter
	bearing_groove_width = 2.1, // bearing groove width
	bearing_height = 4, // bearing height
	flex_guide_safety_tolerance = 0.05,
	width = 42.5,
	cover_depth = 15,
	carriage_to_filament_zoffset = 30,
	motor_to_hotend_yoffset = 20,
	lever_height = 12,
	fillet = 1,
	supports = true,
	prometheus=false,
	brass_tube=true,
	front_holes=true,
    fan_extra_height = 0,
    fan_outlet_width = 10,
    fan_outlet_height = 3,
    fan_outlet_angle = 0,
    fan_tip_length = 15,
    fan_tip_angle = 80
	)
{
	filament_offset = (gear_ed + filament_d)/2;
	
	color("Orange")
		holder(
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
			flex_guide_safety_tolerance = flex_guide_safety_tolerance,
			width = width,
			carriage_to_filament_zoffset = carriage_to_filament_zoffset,
			motor_to_hotend_yoffset = motor_to_hotend_yoffset,
			fillet = fillet,
			supports = supports,
			prometheus = prometheus,
			brass_tube = brass_tube
		);
	
	color("gold")
		cover(
			filament_d = filament_d,
			gear_ed = gear_ed,
			width = width,
			cover_depth = cover_depth,
			motor_to_hotend_yoffset = motor_to_hotend_yoffset,
			fillet = fillet,
			prometheus=prometheus,
			front_holes=front_holes
		); 
	
	translate([0, 0, motor_to_hotend_yoffset])
	{
		color("Orange")
			top_plate(
				brass_tube = brass_tube
			);
		lever(
			filament_d = filament_d,
			gear_ed = gear_ed, 
			bearing_od = bearing_od,
			bearing_ed = bearing_ed,
			bearing_id = bearing_id,
			bearing_height = bearing_height,
			lever_height = lever_height, 
			fillet = fillet,
			brass_tube = brass_tube
		); 
		color("dimgray", 0.75)

		translate([0, 0, 6+31/2])
		{
			translate([gear_ed/2 + bearing_ed/2 + filament_d, 0, 0])
				grooved_cylinder(
					outer_diameter  = bearing_od,
            		inner_diameter = bearing_id,
					grooved_diameter  = bearing_ed,
					groove_width  = bearing_groove_width,
					height = bearing_height
				);
			grooved_cylinder(
				outer_diameter  = gear_od,
            	inner_diameter = 5,
				grooved_diameter  = gear_ed,
				groove_width  = gear_groove_width,
				height = gear_height
			);
		}
	}
    // fan motor
    translate([-(width/2+7.5),-18, motor_to_hotend_yoffset-19]) {
        color("gray", 0.75)
            rotate([180,90,0])
                import("lib/ODB5115.stl");
        color("PaleGreen")
            translate([0,28,-26]) 
                rotate([0,fan_tip_angle-90,180])
                    fan_duct(
                        fan_elevation = fan_extra_height,
                        outlet_width = fan_outlet_width,
                        outlet_height = fan_outlet_height,
                        tip_length = fan_tip_length,
                        angle = fan_tip_angle,
                        automatic_outlet_angle = false,
                        outlet_angle = fan_outlet_angle
                    );
    }
	//filament
	color("blue", 0.25)
		translate([filament_offset,0, 0])
			cylinder(d=filament_d, h=70, $fn=64);

	// hotend
	if (prometheus)
	{ 
		translate([filament_offset+90, -90, -28.3])
			rotate([0,0,90])
				color("gray", 0.75)
					import("lib/Aluminium_Heat_Sink_V1.1__5mm_.stl");
        translate([filament_offset, 0, -28.3])
			color("gray", 0.5)
				rotate([180,0,0]) cylinder(d=5, h=15);
    }    
    else
        translate([filament_offset, 0, 12.8])
		{
			color("gray", 0.75)
				rotate([0,180, 0])
					e3d_v6();
		}
	// motor
	translate([0,50,motor_to_hotend_yoffset+21.5])
		rotate([90,0,0])
			color("gray", 0.5)
				nema17();
}

