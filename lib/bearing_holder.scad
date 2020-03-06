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

module bearing(
                length = 23.95,
                inner_diameter = 8,
                outer_diameter = 15,
                groove_distance = 15.3,
                groove_width = 1,
                groove_depth = 0.5,
                wall_size = 2.5,
                inserts = true,
                cabletie_width = 3
            ) {
    module bearing_insert() {
                translate([outer_diameter/2+1,0,0])
                    cube([2, outer_diameter+5, cabletie_width], center=true);
                translate([-outer_diameter/2-1,0,0])
                    cube([2, outer_diameter+5, cabletie_width], center=true);
                difference() {
                    cube([outer_diameter+4, outer_diameter+16, cabletie_width ], center=true);
                    cylinder(h=cabletie_width+1, r=outer_diameter/2+wall_size, center=true, $fn = 100);                
                }
        }
    ends_length = length/2-groove_distance/2-groove_width;
    difference() {
        union() {

            cylinder(h=length, r=outer_diameter/2-groove_depth, center=true, $fn = 100);                
            cylinder(h=groove_distance, r=outer_diameter/2, center=true, $fn = 100);
            translate([0,0,groove_distance/2+groove_width+ends_length/2])
                cylinder(h=ends_length, r=outer_diameter/2, center=true, $fn = 100);
            translate([0,0,-groove_distance/2-groove_width-ends_length/2])
                cylinder(h=ends_length, r=outer_diameter/2, center=true, $fn = 100);
        }
        cylinder(h=length+1, r=inner_diameter/2, center=true, $fn = 100);                

    }
    if(inserts) {
        translate([0,0,groove_distance/2])
            bearing_insert();
        translate([0,0,-groove_distance/2])
            bearing_insert();
    }
}


bearing();
//bearing_holder(bearing_diameter=15, 
//                        wall_size = 2.5, 
//                        height = 60, 
//                        y_offset=10, 
//                        gap_width=1.5, 
//                        tab_width=4, 
//                        n_holes=2, 
//                        hole_size=2
//               );