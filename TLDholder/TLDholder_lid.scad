
wall_thickness=0.5+(0.2/3);
height=1;
length=34 - 6*wall_thickness;
width=34 - 6*wall_thickness;

use <./MLAB_logo.scad>


difference() {
    union() {
        translate([-3*wall_thickness, -3*wall_thickness, -height]){
            cube([length+6*wall_thickness, width+6*wall_thickness, height]);
        }
        cube([length, width, height]);
    }
    union (){
        translate ([length/2, width/2, -0.5])  // ODROIDs passive components hole.
            rotate([0,180,0])
            scale(v = [0.13, 0.13, 0.13])
                MLAB_logo_short();
    }
}