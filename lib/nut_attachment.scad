module nut_attachment(inner_diameter=10.2, outer_diameter=24, height=10, y_offset=10, hole_radial_separation=8, n_holes=4, hole_size=3.5, left_fill=15, right_fill=10, side_fill_depth = 10) {
    difference(){
        union(){
            cylinder(h=height, r=outer_diameter/2, center=false, $fn = 100);
            // nut cylinder back fill
            translate([-outer_diameter/2, 0, 0])
                cube([outer_diameter, outer_diameter/2+y_offset , height], center=false);
            //sides fill
            translate([-outer_diameter/2-left_fill, outer_diameter/2+y_offset-side_fill_depth, 0])
                cube([outer_diameter+left_fill+right_fill, side_fill_depth , height], center=false);
            }
        // nut hole
        cylinder(h=3*height, r=inner_diameter/2, center=true, $fn = 100);
        // screw_holes
        if(n_holes > 0) {
            rotation_step = 360/n_holes;
            for (i = [0:n_holes-1]) {
            rotate([0,0,i*rotation_step])
                translate([0,hole_radial_separation,0])
                    cylinder(h=3*height, r=hole_size/2, center=true, $fn = 100);    
            }
        }
    }
}

nut_attachment(
                 inner_diameter=10.2,
                 outer_diameter=24,
                 height=10,
                 y_offset=10,
                 hole_radial_separation=8,
                 n_holes=4,
                 hole_size=3.5,
                 left_fill=15,
                 right_fill=10,
                 side_fill_depth = 10);