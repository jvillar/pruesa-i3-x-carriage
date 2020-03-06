/* [Sensor options] */

//type of support 
sensor_type="bltouch"; // [bltouch:Bl Touch, round:Round sensor]

// 90º rotated bltouch
bltouch_rotated=false;

// Inner diameter for a round sensor
round_sensor_inner_diameter=18;

// Outer diameter for a round sensor
round_sensor_outer_diameter=30;

/* [Arm options] */

// Style of the arm
arm_style = "elephant";  // [elephant: Elephant, reinforced: Reinforced, straight: Straight]

// Width of arm
arm_width = 12; //[10:0.1:100]

// Height of the arm
sensor_z_offset = 60; //[0:0.1:100]

// depth of the arm
sensor_y_offset = 30; //[0:0.1:100]

// Thickness of the vertical section of the arm (default: 4.5)
arm_vertical_thickness = 4; //[2:0.1:15]

// Thickness of the horizontal section of the arm (default: 4.5)
arm_horizontal_thickness = 4; //[2:0.1:15]

/* [Mount plate options] */

// Width of back plate
mount_width = 33;  //[10:0.1:100]

// Height of back plate 
mount_height = 15; //[10:0.1:100]

// Thickness of back plate
mount_thickness = 4; //[2:0.1:15]

// Number of mounting holes 
mount_slots = 3; //[2:1:3]

// Horizontal distance of mounting holes
mount_slot_separation = 10; //[5:0.1:90]

// Verical length of mounting holes
mount_slot_length = 5; //[0:0.1:90]

// Diameter of screw head
screw_head_diameter = 5.5; //[2:0.1:15]

// Diameter of screw hole  
screw_hole_diameter = 2.8; //[2:0.1:15]



sensor_mount(
    sensor_type = sensor_type,
    bltouch_rotated = bltouch_rotated,
    round_sensor_inner_diameter = round_sensor_inner_diameter,
    round_sensor_outer_diameter = round_sensor_outer_diameter,

    arm_style = arm_style,
    arm_width = arm_width,
    sensor_z_offset = sensor_z_offset,
    sensor_y_offset = sensor_y_offset,
    arm_vertical_thickness = arm_vertical_thickness,
    arm_horizontal_thickness = arm_horizontal_thickness,

    mount_width = mount_width,  
    mount_height = mount_height, 
    mount_thickness = mount_thickness,
    mount_slots = mount_slots,
    mount_slot_separation = mount_slot_separation,
    mount_slot_length = mount_slot_length,
    screw_head_diameter = screw_head_diameter, 
    screw_hole_diameter = screw_hole_diameter); 

module sensor_mount(
    sensor_type,
    bltouch_rotated,
    round_sensor_inner_diameter,
    round_sensor_outer_diameter,

    arm_style,
    arm_width,
    sensor_z_offset,
    sensor_y_offset,
    arm_vertical_thickness,
    arm_horizontal_thickness,
    mount_width,  
    mount_height, 
    mount_thickness,
    mount_slots,
    mount_slot_separation,
    mount_slot_length,
    screw_head_diameter, 
    screw_hole_diameter) 
{
    $fn = 50*1;

    sensor_mount_radius = 
        (sensor_type=="bltouch") ? 
            ((bltouch_rotated) ? 6 : (18+screw_head_diameter)/2)
            : 
            ((round_sensor_outer_diameter)/2
        );
    
    arm_height = (arm_style=="elephant") ? sensor_z_offset + mount_height/2 : sensor_z_offset;
    arm_depth = (arm_style=="elephant") ? sensor_y_offset-mount_thickness-sensor_mount_radius : sensor_y_offset-sensor_mount_radius;
    
    module backwall(){
        rotate([-90,0,0])
            hull() {
                
                translate([(mount_width/2-screw_head_diameter), (mount_height/2-screw_head_diameter), 0])
                    cylinder(r=screw_head_diameter, h = mount_thickness);
                translate([(mount_width/2-screw_head_diameter), -(mount_height/2-screw_head_diameter), 0])
                    cylinder(r=screw_head_diameter, h = mount_thickness);
                translate([-(mount_width/2-screw_head_diameter), (mount_height/2-screw_head_diameter), 0])
                    cylinder(r=screw_head_diameter, h = mount_thickness);
                translate([-(mount_width/2-screw_head_diameter), -(mount_height/2-screw_head_diameter), 0])
                    cylinder(r=screw_head_diameter, h = mount_thickness);

            }
    }
    
    module mount_slot() {
        hull() {
            translate([0, -1, -mount_slot_length/2])
                rotate([-90,0,0])
                    cylinder(r=screw_hole_diameter/2, h = mount_thickness+1);
            translate([0, 0, mount_slot_length/2])
                rotate([-90,0,0])
                    cylinder(r=screw_hole_diameter/2, h = mount_thickness+1);
        }
        // Holes for screwheads
        hull() {
            translate([0,mount_thickness/2, mount_slot_length/2])
                rotate([-90,0,0])
                    cylinder(r=screw_head_diameter/2, h = arm_depth+mount_thickness/2);

            translate([0, mount_thickness/2, -mount_slot_length/2])
                rotate([-90,0,0])
                    cylinder(r=screw_head_diameter/2, h = arm_depth+mount_thickness/2);
        }
    }
    
    module arm() {

        if(arm_style=="elephant") {
            points= concat(
                [[-arm_height, arm_depth]],
                cos_line_i(-arm_height+arm_horizontal_thickness, 0, arm_depth, 0, 30), 
                [[-arm_height,0]]
            );
        
            mirror2([1,0,0])
                cube([arm_width/2, mount_thickness, sensor_z_offset], center=false);
            //middle throat section with smoothed curve
            translate([0, mount_thickness, -mount_height/2])
                mirror2([1,0,0])
                    rotate([0,90,0])
                        linear_extrude(height = arm_width/2)
                            polygon(points); 
        }
        else if(arm_style=="straight" || arm_style=="reinforced") {
            mirror2([1,0,0])
                cube([arm_width/2, arm_vertical_thickness, arm_height], center=false);
            translate([0,0,arm_height-arm_horizontal_thickness]) 
                mirror2([1,0,0])
                    cube([arm_width/2, arm_depth, arm_horizontal_thickness], center=false);
            if(arm_style=="reinforced")
                mirror2([1,0,0])
                    rotate([0,90,0])
                        linear_extrude(height = arm_width/6)
                            polygon([[-arm_height, arm_depth],[0,0],[-arm_height, 0]]);
            }
    }

    module sensor_bltouch() {
     
        translate([0, sensor_y_offset ,sensor_z_offset-arm_horizontal_thickness])
            rotate([0,0,(bltouch_rotated) ? 90 : 0])    
                difference(){
                //bltouch sensor mount
                hull(){
                    if(!bltouch_rotated)
                        translate([0 ,-9, arm_horizontal_thickness/2])
                            cube([12,12,arm_horizontal_thickness],center=true);
                    
                    translate([0 ,9, 0])
                        cylinder(d=12, h = arm_horizontal_thickness);
                       
                    translate([0 ,-9, 0])
                        cylinder(d=12, h = arm_horizontal_thickness);
                }

                //middle hole
                translate([0 , 0, -1])
                    cylinder(r=3, h = arm_horizontal_thickness+2);              
                // Holes for screws in sensor mount
                mirror2([0,1,0])
                    translate([0, 9 ,-1])
                        cylinder(r=3.3/2, h = arm_horizontal_thickness+2);
                // Holes for screwheads
                mirror2([0,1,0])
                    translate([0, 9 , -2])
                        cylinder(r=screw_head_diameter/2, h = arm_horizontal_thickness);
                }              
    }

    module sensor_round() {
        translate([0, sensor_y_offset ,sensor_z_offset-arm_horizontal_thickness])
            difference() {
                hull() {
                    cylinder(d=round_sensor_outer_diameter, h = arm_horizontal_thickness);
                    translate([0, -(round_sensor_outer_diameter-round_sensor_inner_diameter)/3, 0])
                        cylinder(d=round_sensor_outer_diameter, h = arm_horizontal_thickness);
                }
                translate([0,0,-1])
                    cylinder(d=round_sensor_inner_diameter, h = arm_horizontal_thickness+2);
            }
    }
    
    function cos_line(x_min,x_max,y_min,y_max,fn=180)=
        [for(i=[180:180/fn:360])
        [x_min+((i-180)/180)*(x_max-x_min),y_min+(cos(i)+1)/2*(y_max-y_min)]
    ];

    function cos_line_i(x_min,x_max,y_min,y_max,fn=180)=
        [for(i=[180:180/fn:360])
        [x_min+(cos(i)+1)/2*(x_max-x_min),y_min+((i-180)/180)*(y_max-y_min)]
    ];

    module mirror2(v) {
        children();
        mirror(v) children();
    }

    ends_distance = (mount_slots == 2) ? mount_slot_separation : mount_slot_separation*2;
    //echo(sensor_mount_height,mount_height,bl_offset_height); 
    rotate([0,180,180]) 
        difference(){
            union(){
                backwall();
                arm();
                if(sensor_type=="bltouch")
                    sensor_bltouch();
                else if(sensor_type=="round")
                    sensor_round();
            }

            // Holes for screws
            union() {
                mirror2([1,0,0]) {
                    translate([ends_distance/2, 0, 0]) {
                        mount_slot();
                    }
                }
                if(mount_slots == 3) {
                    mount_slot();
                    }
            }
            
        }
         
}