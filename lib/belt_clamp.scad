module belt_clamp(){
    $fn=32 * 4;
    module frame(){
        hull(){
            translate([1,5,0]) cylinder(h = 12, r = 1);
            translate([6.5,3,0]) cylinder(h = 12, r = 1);
            translate([12,5,0]) cylinder(h = 12, r = 1);
            translate([12,12,0]) cylinder(h = 12, r = 1);
            translate([6.5,12,0]) cylinder(h = 12, r = 1);
            translate([1,10,0]) cylinder(h = 12, r = 1);
        }    
    }
    module belt_loop(){
        difference(){
            hull(){
                translate([6.5,1,-1]) cylinder(h = 14, r = 1);
                translate([13.5,5.5,-1]) cylinder(h = 14, r = 5.5);
            }
            belt_loop_hole();
        }
        translate([-1, 0,-1]) cube([8,2,14]);
    }
    
    module belt_loop_hole(){    
        hull(){
            translate([9,2.5,0]) cylinder(h = 12, r = 1);
            translate([13.5,5.5,0]) cylinder(h = 12, r = 4);
        }
    }
    
    
    difference(){
        union() {
            frame();
            translate([0,6.5,0]) belt_loop_hole();
            }
        translate([0,6.5,0]) belt_loop();
        }
}


belt_clamp();

