use <./nut_attachment.scad>;
use <./bearing_holder.scad>;
use <./tensioner_holder.scad>
use <./x_motor_attachment.scad>;;
use <./rod_block.scad>;

module x_motor(
                height = 60,
                extra_width=0, 
                z_rod_sep=27,
                x_rod_sep=45,
                zx_rod_sep=30,
                rod_diameter=8,
                main_body_width=17,
                bearing_diameter=15, 
                bearing_holder_wall_size = 2.5, 
                bearing_gap_width=1.5, 
                bearing_tab_width=4, 
                bearing_n_holes=2, 
                bearing_hole_size=2,
                nut_holder_inner_diameter=10.2,
                nut_holder_outer_diameter=24,
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
                x_endstop_screw_size=2.5,
                x_endstop_screw_sep= 9.5) {

    motor_width = 43;
    translate([-bearing_width/2-motor_width /2-motor_x_offset, zx_rod_sep, height/2 ])
    mirror()    
        x_end_motor_attachment(
                                   width=motor_width,
                                   height=height, 
                                   depth=main_body_width,
                                   x_offset=motor_x_offset,
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
    nut_attachment_width = nut_holder_outer_diameter;
    nut_attachment_xrods_gap = (zx_rod_sep-nut_holder_outer_diameter/2-main_body_width/2);
    nut_attachment_bearing_holder_sep = z_rod_sep-nut_holder_outer_diameter/2-bearing_width/2;

    translate([z_rod_sep, 0, 0])
    nut_attachment(
                    sinner_diameter=nut_holder_inner_diameter,
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
        rod_block(width=width, height=x_rods_height, depth=main_body_width, rod_diameter=rod_diameter, endstop=x_endstop, endstop_screw_size=x_endstop_screw_size , endstop_screw_sep=x_endstop_screw_sep);
        
    translate([width/2-bearing_width/2, zx_rod_sep, x_rods_z_offset+x_rods_z_distance])
        rod_block(width=width, height=x_rods_height, depth=main_body_width, rod_diameter=rod_diameter);
    
    //
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
}
    
module motor_holder(width=100, height=100, depth=50) {
    rotate(a=[90,-90,0])
    linear_extrude(height = depth, center = true, convexity = 10, twist = 0)
    polygon(points=[[0,0],[height,0],[0,width]], paths=[[0,1,2]]);
    }
    

    
x_motor(
                width=50, 
                extra_width=0, 
                height = 59,
                z_rod_sep=27,
                x_rod_sep=45,
                zx_rod_sep=22,
                rod_diameter=8,
                main_body_width=18,
                bearing_diameter=15, 
                bearing_holder_wall_size = 2, 
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
                tensioner_holder_wall_size=4,
                tensioner_holder_hole_size=3,
                pulley_screw_head_diameter=20
                );


