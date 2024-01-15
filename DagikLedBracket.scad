include <./usagi.scad-master/usagi.scad>

module quarter_hemisphere(diameter, thick){
    difference(){ 
        color("lightgray")
        sphere(d=diameter+thick);
        color("lightgray")
        sphere(d=diameter);
        translate([0,0,-diameter/2])
        cube([diameter+thick,diameter+thick,diameter], center = true);
        //
        translate([-diameter/2,0,0+2])
        cube([diameter+thick,diameter+thick,diameter], center = true);
        translate([0,-diameter/2,0+2])
        cube([diameter+thick,diameter+thick,diameter], center = true);
    }
}

module quarter_led(){
    color("yellow")
    rotate_extrude(angle=90) {
    translate([50-5/2,-1.9,0])
    square(size=[5,1.9]);
    }
}

module quarter_substrate(){
    color("green")
    rotate_extrude(angle=90) {
        translate([50-5/2,-1.9-1.6,0])
        square(size=[5,1.6]);
    }    
}

module quarter_bracket(){  
    color("blue")
    rotate([0,0,-5])
    rotate_extrude(angle=90) {
        translate([50+5/2,-1.6-1.9,0])
        square(size=[3,1.6+1.9]);
    }
    
    difference(){
        color("blue")
        rotate_extrude(angle=90) {
            translate([50+3+5/2,-1.6-1.9,0])
            square(size=[8,1.6+1.9]);
        }
        // vertical hole
        translate([(50+3+5/2+4)*cos(0+15),(50+3+5/2+4)*sin(0+15),-2])
        cylinder(h=6, r1=3/2, r2=3/2, center = true);   
        translate([(50+3+5/2+4)*cos(30+15),(50+3+5/2+4)*sin(30+15),-2])
        cylinder(h=6, r1=3/2, r2=3/2, center = true);   
        translate([(50+3+5/2+4)*cos(60+15),(50+3+5/2+4)*sin(60+15),-2])
        cylinder(h=6, r1=3/2, r2=3/2, center = true);   
        // nut
        translate([(50+3+5/2+4)*cos(0+15),(50+3+5/2+4)*sin(0+15),-2])
        nut( diameter = 2.5, style = 1, has_washer_face = false,        resolution = RESOLUTION ); 
        translate([(50+3+5/2+4)*cos(30+15),(50+3+5/2+4)*sin(30+15),-2])
        nut( diameter = 2.5, style = 1, has_washer_face = false,        resolution = RESOLUTION );   
        translate([(50+3+5/2+4)*cos(60+15),(50+3+5/2+4)*sin(60+15),-2])
        nut( diameter = 2.5, style = 1, has_washer_face = false,        resolution = RESOLUTION );     
    }

    difference(){
        color("blue")
        rotate_extrude(angle=90) {
            translate([50,0,0])
            square(size=[3+5/2,8]);
        }
        quarter_hemisphere();

        // horizontal hole
        color("gray")
//        translate([57*cos(45/2),57*sin(45/2),4])      
        translate([57*cos(45/2+2),57*sin(45/2),4])      
        rotate([-30,90,0])
        cylinder(h=15, r1=3/2, r2=3/2, center = true);
//        translate([57*cos(45/2+45),57*sin(45/2+45),4])
        translate([57*cos(45/2+45-0.5),57*sin(45/2+45),4])
        rotate([-60,90,0])
        cylinder(h=15, r1=3/2, r2=3/2, center = true);  
        
        // nut
        translate([54*cos(45/2),54*sin(45/2),4])
        rotate([-30,90,0])
        nut( diameter = 2.5, style = 1, has_washer_face = false,        resolution = RESOLUTION );  
    
        translate([54*cos(45/2+45),54*sin(45/2+45),4])
        rotate([-60,90,0])
        nut( diameter = 2.5, style = 1, has_washer_face = false,        resolution = RESOLUTION );  
   
        // horizontal hole for cable   
        color("gray")
        translate([57*cos(0),57*sin(0),4])        
        rotate([0,90,0])
        cylinder(h=15, r1=2, r2=2, center = true);  
        
        color("gray")
        translate([57*cos(90),57*sin(90),4])        
        rotate([90,90,0])
        cylinder(h=15, r1=2, r2=2, center = true);  
    }
}

//quarter_hemisphere(diameter=100, thick=3);
//quarter_led();
//quarter_substrate();
quarter_bracket();






