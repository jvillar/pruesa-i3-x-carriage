use <lib/nut_attachment.scad>;
use <lib/bearing_holder.scad>;
use <lib/tensioner_holder.scad>
use <lib/x_motor_attachment.scad>;
use <lib/rod_block.scad>;

x_end_motor();
module x_end_motor(
                height=60,
                extra_width=0, 
                z_rod_sep=27,
                x_rod_sep=45,
                zx_rod_sep=22,
                rod_diameter=8,
                main_body_width=18,
                bearing_diameter=15, 
                bearing_holder_wall_size=2, 
                bearing_gap_width=1.5, 
                bearing_tab_width=3.5, 
                bearing_n_holes=2, 
                bearing_hole_size=2.5,
                nut_holder_inner_diameter=10.2,
                nut_holder_outer_diameter=23,
                nut_holder_height=10,
                nut_holes_radial_separation=8,
                nut_n_holes=4,
                nut_hole_size=3.5,
                tensioner_holder_wall_size=3,
                tensioner_holder_hole_size=3,
                pulley_screw_head_diameter=20,
                motor_x_offset=5,
                motorshaft_hole_diameter=30,
                front_motor=false,
                x_endstop=true,
                x_endstop_screw_size=2.2,
                x_endstop_screw_sep=9.5,
                x_endstop_screw_depth=5,                   
                x_endstop_elevation=8,
                z_endstop_screw_holder_depth=8,
                z_endstop_rod_screw_x_offset=26,
                z_endstop_rod_screw_y_offset=5,
                z_endstop_screw_hole_size=3) {
    motor_width = 42.5;

    translate([-bearing_width/2-motor_width /2-motor_x_offset, zx_rod_sep, height/2 ])
    mirror([1,0,0])  
        x_end_motor_attachment(
                                   width=motor_width,
                                   height=height, 
                                   depth=main_body_width,
                                   x_offset=motor_x_offset+tensioner_holder_wall_size/2,
                                   screw_hole_size=3.6,
                                   screw_head_size=6.3,
                                   screw_head_depth=3,
                                   shaft_hole_diameter=motorshaft_hole_diameter,
                                   front_motor=front_motor);

    bearing_width = bearing_diameter+2*bearing_holder_wall_size;
    bearing_xrods_gap = (zx_rod_sep-bearing_diameter/2-main_body_width/2);
    nut_attachment_width = nut_holder_outer_diameter;
    width = (bearing_width/2)+(nut_attachment_width/2)+z_rod_sep+extra_width;
    // bearing
    bearing_holder(
                    bearing_diameter=bearing_diameter,
                    wall_size=bearing_holder_wall_size, 
                    height=height,
                    y_offset=bearing_xrods_gap,
                    gap_width=bearing_gap_width,
                    tab_width=bearing_tab_width,
                    n_holes=bearing_n_holes,
                    hole_size=bearing_hole_size
                    );
    // nut
    //nut_attachment_width = nut_holder_outer_diameter;
    nut_attachment_xrods_gap = (zx_rod_sep-nut_holder_outer_diameter/2-main_body_width/2);
    nut_attachment_bearing_holder_sep = z_rod_sep-nut_holder_outer_diameter/2-bearing_width/2;

    translate([z_rod_sep, 0, 0])
    nut_attachment(
                    inner_diameter=nut_holder_inner_diameter,
                    outer_diameter=nut_holder_outer_diameter, 
                    height=nut_holder_height,
                    y_offset=nut_attachment_xrods_gap,
                    hole_radial_separation=nut_holes_radial_separation,
                    n_holes=nut_n_holes,
                    hole_size=nut_hole_size,
                    left_fill=nut_attachment_bearing_holder_sep,
                    right_fill=0,
                    side_fill_depth = 0.75*(bearing_xrods_gap+bearing_diameter/2)
                    );



      //translate([-z_rod_sep, 0, 0])

    x_rods_z_offset = (height - x_rod_sep) / 2;
    x_rods_z_distance = x_rod_sep;
    x_rods_height = x_rods_z_offset * 2;
    translate([width/2-bearing_width/2, zx_rod_sep, x_rods_z_offset ])
      rod_block(width=width, height=x_rods_height, depth=main_body_width, rod_diameter=rod_diameter);
        
    translate([width/2-bearing_width/2, zx_rod_sep, x_rods_z_offset+x_rods_z_distance])
            rod_block(
                width=width, 
                height=x_rods_height, 
                depth=main_body_width, 
                rod_diameter=rod_diameter,
                endstop=x_endstop,
                endstop_screw_size=x_endstop_screw_size,
                endstop_screw_sep=x_endstop_screw_sep,
                endstop_screw_depth=x_endstop_screw_depth,
                endstop_elevation=x_endstop_elevation
            );
            
    
    // Rod separation support walls
    translate([-bearing_width/2+tensioner_holder_wall_size/2, zx_rod_sep, x_rods_height])    
        mirror([-1,0,0])
            tensioner_holder(
                             width=width-tensioner_holder_wall_size,
                             height=x_rods_z_distance-x_rods_height,
                             depth=main_body_width,
                             wall_size=tensioner_holder_wall_size,
                             tensioner_hole_size=tensioner_holder_hole_size,
                             pulley_screw_head_diameter=pulley_screw_head_diameter,
                             back_face=false,
                             back_pulley_screw_head_diameter=0);

    // Z endstop
    z_endstop_diameter = z_endstop_screw_hole_size*3;
    z_endstop_gap = zx_rod_sep-main_body_width/2+z_endstop_rod_screw_y_offset-z_endstop_diameter/2;
    
    
    translate([-z_endstop_rod_screw_x_offset, -z_endstop_rod_screw_y_offset, 0]) {
        nut_attachment(
                        inner_diameter=z_endstop_screw_hole_size,
                        outer_diameter=z_endstop_diameter, 
                        height=z_endstop_screw_holder_depth,
                        y_offset=z_endstop_gap, 
                        n_holes=0,
                        hole_size=nut_hole_size,
                        left_fill=0,
                        right_fill=0,
                        side_fill_depth=0
                        );
    }
}
    
    

module z_endstop_screw(
                          height=7,
                          rod_screw_x_offset=20,
                          rod_screw_y_offset=1,
                    
                          z_endstop_screw_hole_size=3
                         )
{
        translate([-rod_screw_x_offset, -rod_screw_y_offset, 0]) {
            cylinder(r=z_endstop_screw_hole_size/2, h=height*3, center=true, $fn=30);
        }
}




