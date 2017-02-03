
module chamfered_cube(width=60, height=200, depth=28, chamfer=20){
    difference(){
        translate(v=[0,0,0]) cube(size = [width, depth, height], center = true);
        // Nice edges
        translate(v=[+width/2,0,+height/2]) rotate([0,-45,0])cube(size = [2*chamfer, 2*depth, 2*chamfer], center = true);
        translate(v=[-width/2,0,+height/2]) rotate([0,45,0]) cube(size = [2*chamfer, 2*depth, 2*chamfer], center = true);
        translate(v=[+width/2,0,-height/2]) rotate([0,-45,0])cube(size = [2*chamfer, 2*depth, 2*chamfer], center = true);
        translate(v=[-width/2,0,-height/2]) rotate([0,45,0]) cube(size = [2*chamfer, 2*depth, 2*chamfer], center = true);
    }

}

width=60; 
height=200;
depth=28;
chamfer=width/2/sqrt(2);
chamfered_cube(width=width, height=height, depth=depth, chamfer=chamfer);


