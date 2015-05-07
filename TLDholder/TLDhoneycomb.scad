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

module honeycomb (length, width, height, cell_size, wall_thickness) {
   no_of_rows = floor(1.75 * length / (cell_size + wall_thickness)) ;

   tr_mod = cell_size + wall_thickness;
   tr_x = sqrt(3)/2 * tr_mod;
   tr_y = tr_mod / 2;
        off_x = -1 * wall_thickness / 2;
        off_y = wall_thickness / 2;
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
}
//honeycomb(length, width, height, cell_size, wall_thickness);
honeycomb(50, 50, 1, 5.5, 0.5);