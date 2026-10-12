// EU2040 single-slot sliding key.
// Units: mm. Experimental geometry from an iterative physical fit test.
// Print process calibration and strength qualification are NOT included.
// BSD 2-Clause License; see ../LICENSE.

// Experimental geometry snapshot with a raised 0.6 mm retaining shoulder.
// Seven blind transverse pilot holes, evenly spaced along cutLen.
// X points into the extrusion; Z is the length of the key.
// A subsequent validated change should be introduced under a new identifier.
module key_2040_003(cut_len=100) {
    extension = 4.8;
    hole_diameter = 1.8;
    hole_depth = 12.0;
    hole_count = 7;
    wedge_adjust = 0.5;
    shoulder_raise = 0.6;
    shoulder_x = 4.3 - shoulder_raise;

    assert(cut_len > 0, "cut_len must be positive");

    difference() {
        linear_extrude(height=cut_len)
            polygon(points=[
                [-extension, -3.1],
                [shoulder_x, -3.1],
                [shoulder_x, -5.5],
                [4.8, -5.5],
                [8.0, -2.2-wedge_adjust],
                [8.0,  2.2+wedge_adjust],
                [4.8,  5.5],
                [shoulder_x, 5.5],
                [shoulder_x, 3.1],
                [-extension, 3.1]
            ]);

        for (i = [1:hole_count]) {
            translate([
                -extension,
                0,
                cut_len * i / (hole_count+1)
            ])
                rotate([0,90,0])
                    cylinder(h=hole_depth, d=hole_diameter, $fn=32);
        }
    }
}

// Compatibility entry point for the original prototype's call signature.
module key2040(cutLen=100) {
    key_2040_003(cut_len=cutLen);
}
