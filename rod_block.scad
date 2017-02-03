module rod_block(width=60, height=10, depth=10, rod_diameter=8)
    {
    // x rod gaps  
    rotate([0,-90,0])

    difference(){
        cube([height, depth, width], center=true);
        cylinder(h=2*width, r=rod_diameter/2, center=true, $fn=100);
        cube([rod_diameter, rod_diameter/2, 2*width], center=true);
    }
}