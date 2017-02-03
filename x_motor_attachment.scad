
module x_end_motor_attachment(
                                    width=43,
                                    height=60, 
                                    depth=17,
                                    x_offset=5,
                                    screw_hole_size=3.6,
                                    screw_head_size=6.3,
                                    screw_head_depth=3,
                                    shaft_hole_diameter=30,
                                    front_motor=false){
    difference(){ 
    union() { 
        // main body
        cube(size = [width, depth, height], center = true);
        // x_offset
        translate(v=[-width/2-x_offset/2, 0, 0]) 
            cube(size = [x_offset, depth, height], center = true);
    }
    // motor mounting holes              
    for(i=[0:3])
        rotate([0, 90*i, 0]) {
            translate(v=[15.5, 0, 15.5]) 
                rotate(a=[-90, 0, 0]){
                    cylinder(h = 2*depth, r=screw_hole_size/2, $fn=30, center=true);
                    translate(v=[0,0, -depth/2]) 
                        cylinder(h = screw_head_depth*2, r=screw_head_size/2, $fn=30, center=true);
                }
         }
     
    // motor shaft hole
     rotate(a=[90,0,0]) 
         cylinder(h = 2*depth, r=shaft_hole_diameter/2, $fn=6, center=true);
 
    // belt space
    translate([-width/4-(x_offset+1)/2, 0, 0])
        cube(size = [width/2+x_offset+1, 10, 18], center = true);

    // material saving cutouts
    translate([width/2-shaft_hole_diameter/4, 0, height/2-shaft_hole_diameter/4]) 
        cube(size = [width, 2*depth, height], center = true);
    
   // corner chamfer
    chamfer_center_offset = min(width/2, height/2)+width+height;
    hole_clearance = screw_head_size*0.75;
    chamfer_size = (chamfer_center_offset/cos(45)-(15.5)/cos(45)-(screw_head_size/2)-hole_clearance) *2;
    translate([chamfer_center_offset, 0, -chamfer_center_offset]) 
        rotate(a=[0,45,0])
         cube(size = [chamfer_size, 2*depth, 2*width], center = true); 
    }
}

x_end_motor_attachment();