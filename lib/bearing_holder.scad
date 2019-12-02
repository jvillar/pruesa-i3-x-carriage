module bearing_holder(
                        bearing_diameter=15, 
                        wall_size = 2.5, 
                        height = 60, 
                        y_offset=10, 
                        gap_width=1.5, 
                        tab_width=4, 
                        n_holes=2, 
                        hole_size=2) {
    outer_size = bearing_diameter + wall_size*2;
    hole_spacing=height/(n_holes);
    hole_offset = hole_spacing/2;
    bearing_yaxis_offset = bearing_diameter /2 + y_offset;
    difference(){
        difference() {
            union() {
                translate([-outer_size/2,0,0])
                    // back fill
                    cube([outer_size, bearing_yaxis_offset , height], center=false);
                // bearing wall
                cylinder(h=height, r=outer_size/2, center=false, $fn = 100);
                if(tab_width > 0) {
                    //tab
                    hull() {
                        // back square tap
                        translate([-(gap_width+(tab_width*2))/2, -(outer_size/2)+2,  max(0, hole_offset-hole_size*5)])
                            cube([gap_width+tab_width*2, hole_size , min(height, (n_holes-1)*hole_spacing+hole_size*10)], center=false);
                        // fron squares
                        for (i = [0:n_holes-1]) {
                            translate([0, -outer_size/2-hole_size*1.5, hole_offset+hole_spacing*i])
                                rotate([0,90,0])
                                    cylinder(h=gap_width+tab_width*2, r=hole_size*3/2, $fn=100, center=true);
                        }
                    }
                }
            }
            
            translate([0,0,-10])
            // bearing hole
            cylinder(h=height+20, r=bearing_diameter/2, center=false, $fn = 100);
            
            // gap
            translate([-gap_width/2, -outer_size/2-hole_size*4, -1])
            cube([gap_width,  hole_size*8 , height+2], center=false);
        }

        for (i = [0:n_holes-1]) {
            translate([0, -outer_size/2-hole_size*1.5, hole_offset+hole_spacing*i])
                rotate([0,90,0])
                    cylinder(h=gap_width+tab_width*4, r=hole_size/2, $fn=100, center=true);
        }
    }
}

bearing_holder(bearing_diameter=15, 
                        wall_size = 2.5, 
                        height = 60, 
                        y_offset=10, 
                        gap_width=1.5, 
                        tab_width=4, 
                        n_holes=2, 
                        hole_size=2
               );