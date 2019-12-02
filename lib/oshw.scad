
module oshw_symbol(d=10, height=5) {
    linear_extrude(height)
        difference() {
            union() {
                circle(r=d/1.3, $fn=100);
                for(i=[-1:5]) 
                    rotate(45*i) 
                        polygon( points=[[0.0,0.35*d], [d,0.15*d], [d,-0.15*d], [0.0,-0.35*d]]);
                }
                circle(r=d/3, $fn=100);
                intersection() {
                    rotate(200) square([d,d]);
                    rotate(250)  square([d,d]);
                }
    		}
  	
}

oshw_symbol(d=10, height=5);

