

module tensioner_holder(
                         width=60,
                         height=30,
                         depth=20,
                         wall_size=3,
                         tensioner_hole_size=3,
                         pulley_screw_head_diameter=20,
                         back_face=true,
                         back_pulley_screw_head_diameter=0
    ) {
    difference() {
        //walls
        union() {
            // left face
            hull() {
              translate([0, -depth/2, 0])
                sphere(d=wall_size , $fn=30);
              translate([-width, -depth/2, 0])
                sphere(d=wall_size , $fn=30);
              translate([0, -depth/2, height])
                sphere(d=wall_size , $fn=30);
              translate([-width, -depth/2, height])
                sphere(d=wall_size , $fn=30);
            }
            // right face
            hull() {
              translate([0, depth/2, 0])
                sphere(d=wall_size , $fn=30);
              translate([-width, depth/2, 0])
                sphere(d=wall_size , $fn=30);
              translate([0, depth/2, height])
                sphere(d=wall_size , $fn=30);
              translate([-width, depth/2, height])
                sphere(d=wall_size , $fn=30);
            }
            
            if(back_face) {
                // back face
                hull() {
                  translate([0, depth/2, 0])
                    sphere(d=wall_size , $fn=30);
                  translate([0, -depth/2, 0])
                    sphere(d=wall_size , $fn=30);
                  translate([0, depth/2, height])
                    sphere(d=wall_size , $fn=30);
                  translate([0, -depth/2, height])
                    sphere(d=wall_size , $fn=30);
                }
            }
        }
        
     // tensioner hole
     if(back_face)
        translate([wall_size*2,0,height/2])
        rotate([0,-90,0])
            cylinder(r=tensioner_hole_size/2,  h =4*wall_size, $fn=30);
    else {
     // tensioner back screw hole
     translate([0, -depth,height/2])
        rotate([-90,0,0])
            cylinder(r=back_pulley_screw_head_diameter/2,  h =depth*2, $fn=100);
    } 
     // tensioner screw hole
     translate([-width-(wall_size/2), -depth,height/2])
        rotate([-90,0,0])
            cylinder(r=pulley_screw_head_diameter/2,  h =depth*2, $fn=100);
    }


}

tensioner_holder(
                  width=60,
                  height=30,
                  depth=20,
                  wall_size=3,
                  tensioner_hole_size=3,
                  pulley_screw_head_diameter=20,
                  back_face=true,
                  back_pulley_screw_head_diameter=0);