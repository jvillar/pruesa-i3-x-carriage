module belt_clamp(
    depth = 6
    ){
    $fn=32 * 4;
    module frame(){
        hull(){
            translate([3,2.5,0]) cylinder(h = depth, r = 3);
            translate([14,2.5,0]) cylinder(h = depth, r = 3);
            translate([14,14,0]) cylinder(h = depth, r = 3);
            translate([3,14,0]) cylinder(h = depth, r = 3);
        }    
    }
    module belt_loop(){
        difference(){
                hull(){
                translate([6.5,1,-1]) cylinder(h = depth*2, r = 1);
                translate([13.5,5.5,-1]) cylinder(h = depth*2, r = 5.5);
            }
            belt_loop_hole();
        }
        translate([-1, 0,-1]) cube([8,2,depth*2]);
    }
    
    module belt_loop_hole(){    
        hull(){
            translate([9,2.5,0]) cylinder(h = depth, r = 1);
            translate([13.5,5.5,0]) cylinder(h = depth, r = 4);
        }
    }
    mirror([0,1,0])
        translate([-13.5,-12,0])
        difference(){
            union() {
                frame();
                translate([0,6.5,0]) belt_loop_hole();
                }
            translate([0,6.5,0]) belt_loop();
            }
}


belt_clamp();

