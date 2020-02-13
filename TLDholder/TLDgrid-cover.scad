//// Upper part of TLD holder with rectangular grid
$fn = 100;

/// Parameters
RED = 0.15;   // Reduction of some parts because of the print properties

A = 8;  // Number of rows
B = 8;  // Number of columns

a = 5.5;  // width of one compartment
b = 5.5;  // length of one compartment

h = 2;  // Inner depth of the compartment

twb = 1.2; // thickness of the bottom/upper wall
tw = 0.7;  // thickness of inner walls
TW = 1.5;  // thickness of outer walls

W = A*a + (A-1)*tw + 2*TW;   // Total width of holder
L = B*b + (B-1)*tw + 2*TW;  // Total length of holder
H = h + twb + 1.2;  // Total heigth of bottom part of the holder


union() {
    translate([-TW-RED, -TW-RED, -twb]) cube([W, L, twb]);
    cube([W-2*TW-RED, L-2*TW-RED, H-h-twb-RED]);
    
}