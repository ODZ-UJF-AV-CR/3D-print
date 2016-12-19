
wall_thickness=0.5+0.05;
height=1;
length=34 - 6*wall_thickness;
width=34 - 6*wall_thickness;

union() {
    translate([-3*wall_thickness, -3*wall_thickness, -height]){
        cube([length+6*wall_thickness, width+6*wall_thickness, height]);
    }
    cube([length, width, height]);
}
    