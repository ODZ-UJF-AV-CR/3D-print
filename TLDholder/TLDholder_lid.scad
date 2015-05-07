length=50;
width=50;
height=1;
wall_thickness=0.5;
union() {
    translate([-3*wall_thickness, -3*wall_thickness, -height]){
    cube([length+6*wall_thickness, width+6*wall_thickness, height]);
    }
    cube([length, width, height]);
    }