/* [Fan Duct General] */
//Dimensions of fan duct outlet
outlet_width = 30;
outlet_height = 3;
automatic_outlet_angle = true;
outlet_angle = 0;
// Choose outlet angle
// How far from elbow is the tip?
tip_length = 15;
// How far from elbow is the fan outlet?
fan_elevation = 0;
// Choose duct angle
angle = 90;
/* [Fan Duct Advanced] */
elbow_radius = 0.5;
// thickess of printed duct
thickness = 1.2;
// Level of detail
fn=300;
/* [5015 Fan characteristics] */
// Width of the outlet on the fan itself
fan_outlet_width  = 20;
// Height of the outlet on the fan itself
fan_outlet_height = 15.15;
// Location and dimensions of notch for snap fit.  Don't change unless different fan type
notch_height = 11.35; 
notch_width = 2.4;
// Notch is not centered, this value represents how far from center it is
notch_offset = 0.91; 
// How far from edge is the notch
notch_elevation = 0.75;

// Offsets for center of fan for relief cut into fan duct
cy = 25;
cz = 25;
r = 22.5;




fan_duct(
    outlet_width = outlet_width,
    outlet_height = outlet_height,
    automatic_outlet_angle = automatic_outlet_angle,
    outlet_angle = outlet_angle,
    tip_length = tip_length,
    angle = angle,
    fan_elevation = fan_elevation,
    elbow_radius = elbow_radius,
    thickness = thickness,
    fan_outlet_width  = fan_outlet_width ,
    fan_outlet_height = fan_outlet_height,
    notch_height = notch_height, 
    notch_width = notch_width,
    notch_offset = notch_offset, 
    notch_elevation = notch_elevation,
    cy = cy,
    cz = cz,
    r = r,
    $fn = fn);

module fan_duct(
    outlet_width = 30,
    outlet_height = 3,
    automatic_outlet_angle = true,
    outlet_angle = 0,
    tip_length = 30,
    angle = 90,
    elbow_radius = 0.01,
    thickness = 1.2,
    fan_outlet_width  = 20,
    fan_outlet_height = 15.15,
    fan_elevation = 0,
    notch_height = 10.85, 
    notch_width = 1.9,
    notch_offset = 0.91, 
    notch_elevation = 1,
    tip_angle = undef,
    cy = 25,
    cz = 25,
    r = 22.5,
    $fn=300)
{

    module duct_inner() {
      square([fan_outlet_height, fan_outlet_width ]);  
    }

    module duct_outer() {
      translate([-thickness,-thickness]) square([fan_outlet_height + thickness*2, fan_outlet_width  + thickness * 2]);  
    }

    module fan_nozzle_tip_inner() {
      translate([-outlet_height/2,0]) square([outlet_height, outlet_width]);  
    }

    module fan_nozzle_tip_outer() {
      th = thickness / cos(tip_angle);
      translate([-outlet_height/2-th,-thickness]) square([outlet_height + th*2, outlet_width + thickness*2]);  
    }

    module fan_fit() {
      fit_heigth = fan_elevation+notch_elevation+notch_height+2;
      difference(){
        translate([-fan_outlet_height/2,0]) 
            difference() {
                translate([-thickness,-thickness]) 
                    cube([fan_outlet_height + thickness*2, fan_outlet_width  + thickness * 2, fit_heigth]);
                translate([0,0,-1]) 
                    cube([fan_outlet_height, fan_outlet_width , fit_heigth+2]);
            }
        translate([-notch_width/2-notch_offset,-notch_height/2,fan_elevation+notch_elevation]) 
          cube([notch_width,fan_outlet_width /2,notch_height]);
        translate([0,cy,fan_elevation+cz]) 
          rotate([0,90,0]) cylinder(r=r, h=fan_outlet_height*2,center=true);
      }
    }

    module fan_elbow() {
      x = (fan_outlet_height+thickness*2+elbow_radius)*2;
      translate([-elbow_radius-fan_outlet_height/2-thickness,0]) 
        difference() {
          rotate([-90,0,0])
            rotate_extrude(convexity=10) 
              translate([elbow_radius+thickness,0,0]) difference() {
                  duct_outer();
                  duct_inner();
                }
          translate([0,0,x/2]) cube([x,(fan_outlet_width +thickness*2)*2,x], center=true);
          rotate([0,angle-90,0]) translate([-x/2,0,0]) cube([x,(fan_outlet_width +thickness*2)*2,x], center=true);
        }
    }

    module fan_nozzle() {
        translate([-elbow_radius-thickness-fan_outlet_height/2,0])
            rotate([0,angle,0])
                translate([elbow_radius+thickness,0,0])   
                    difference() {
                        hull() {
                            linear_extrude(0.02)
                                duct_outer();
                            translate([fan_outlet_height-cos(tip_angle)*(outlet_height)/2,(fan_outlet_width -outlet_width)/2,-tip_length]) 
                                rotate([0,-tip_angle,0]) 
                                    linear_extrude(0.02) fan_nozzle_tip_outer();
                        }
                        hull() {
                            linear_extrude(0.02)
                                duct_inner();
                            translate([fan_outlet_height-cos(tip_angle)*outlet_height/2,(fan_outlet_width -outlet_width)/2,-tip_length]) 
                                rotate([0,-tip_angle,0]) // angle the tip
                                    translate([0,0,-0.01]) linear_extrude(0.02) 
                                        fan_nozzle_tip_inner();
                        }
      }
    }
   tip_angle = (automatic_outlet_angle) ? asin((fan_outlet_height - outlet_height) / tip_length) : outlet_angle;

  rotate([0,90-angle,0]) {
    translate([0,0,-fan_elevation]) {
        fan_fit();
        fan_elbow();
        fan_nozzle();
    }
  }

}




