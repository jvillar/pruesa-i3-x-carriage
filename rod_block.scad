module rod_block(
                   width=60,
                   height=10,
                   depth=10,
                   rod_diameter=8.6,
                   endstop=false,
                   endstop_screw_size=2.2,
                   endstop_screw_sep=9.5,
                   endstop_screw_depth=6
                   )
    {
    // x rod gaps  
    rotate([0,-90,0])

    difference(){
        cube([height, depth, width], center=true);
        cylinder(h=2*width, r=rod_diameter/2, center=true, $fn=100);
        cube([rod_diameter, rod_diameter/2, 2*width], center=true);
        if(endstop) {
            rotate([0,90,0]) {
                translate([width/2-endstop_screw_depth,endstop_screw_sep/2,0])
                    cylinder(h=2*height, r=endstop_screw_size/2, center=true, $fn=30);
                translate([width/2-endstop_screw_depth,-endstop_screw_sep/2,0])
                    cylinder(h=2*height, r=endstop_screw_size/2, center=true, $fn=30);
            }
        }
    }
}

rod_block(width=50, 
           height=15, 
           depth=20,
           rod_diameter=8,
           endstop=true,
           endstop_screw_size=2.2,
           endstop_screw_sep=9.5,
           endstop_screw_depth=5);