module hc_hexagon(size, height) {
	box_width = size/1.75;
	for (r = [-60, 0, 60]) rotate([0,0,r]) cube([box_width, size, height],
true);
}

module hc_column(length, height, cell_size, wall_thickness) {
   no_of_cells = floor(1 + length / (cell_size + wall_thickness)) ;

        for (i = [0 : no_of_cells]) {
                translate([0,(i * (cell_size + wall_thickness)),0])
                        hc_hexagon(cell_size, height + 1);
        }
}

module honeycomb (length, width, height, cell_size, wall_thickness, sample_length, sample_width) {
    length = length - 6*wall_thickness;
    width = width - 6*wall_thickness;
    difference(){
        union(){
            no_of_rows = floor(1.75 * length / (cell_size + wall_thickness)) ;

            tr_mod = cell_size + wall_thickness;
            tr_x = sqrt(3)/2 * tr_mod;
            tr_y = tr_mod / 2;
            off_x = -cell_size/2 + 2 * wall_thickness;
            off_y = -wall_thickness/2;
            difference(){
                        cube([length, width, height]);
                        for (i = [0 : no_of_rows]) {
                                translate([i * tr_x + off_x, (i % 2) * tr_y + off_y, (height) / 2])
                                        hc_column(width, height, cell_size, wall_thickness);
                        }
            }
            difference() {
                translate([-3*wall_thickness, -3*wall_thickness, -2*wall_thickness]){
                    cube([length+6*wall_thickness, width+6*wall_thickness, height+4*wall_thickness]);
                }
                cube([length, width, 3*height]);
            }
        translate([0,width-sample_width-1*wall_thickness, 0]) cube([length, sample_width+1*wall_thickness, 1*height]);
        }
       translate([(length-sample_length)/2,width-sample_width, 0]) cube([sample_length, sample_width, 5]);
    }
}
//honeycomb(length, width, height, cell_size, wall_thickness, sample_length, sample_width);
honeycomb(34, 34, 2, 5.2, 0.5, 30, 15);
