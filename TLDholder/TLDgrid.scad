//// Bottom part of TLD holder with rectangular grid
$fn = 100;

/// Parameters
A = 8;  // Number of rows
B = 8;  // Number of columns

a = 5.5;  // width of one compartment
b = 5.5;  // length of one compartment

h = 2;  // Inner depth of the compartment

twb = 1.2; // thickness of the bottom wall
tw = 0.7;  // thickness of inner walls
TW = 1.5;  // thickness of outer walls

W = A*a + (A-1)*tw + 2*TW;   // Total width of holder
L = B*b + (B-1)*tw + 2*TW;  // Total length of holder
H = h + twb + 1.2;  // Total heigth of bottom part of the holder

union() {
difference() {
    translate([-TW, -TW, -twb]) cube([W, L, H]);
    
    cube([W-2*TW, L-2*TW, H]);
}

 for (i = [0 : A]) {
                                translate([i * (a+tw)-tw, 0, 0])
                                        cube([tw, B*b + B*tw, h]);
                        }


 for (i = [0 : B]) {
                                translate([0, i * (b+tw)-tw, 0])
                                        cube([A*a+A*tw, tw, h]);
                        }



}
