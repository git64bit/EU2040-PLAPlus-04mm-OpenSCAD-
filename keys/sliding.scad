// EU2040 single-slot sliding keys. Millimeters.
// Reference geometry and historic experimental geometry are distinct.
// License: see ../LICENSE.

// Geometry engine. Feature deltas are zero for the published CAD reference.
// Private process wrappers may supply their own measured feature adjustments.
module _key_2040_geometry(cut_len, wedge_adjust, shoulder_raise) {
    assert(!is_undef(cut_len) && is_num(cut_len) && cut_len > 0,
        "_key_2040_geometry: cut_len must be positive");
    assert(is_num(wedge_adjust) && is_num(shoulder_raise),
        "_key_2040_geometry: feature adjustments must be numbers");

    extension = 4.8;
    hole_diameter = 1.8;
    hole_depth = 12.0;
    hole_count = 7;
    shoulder_x = 4.3 - shoulder_raise;

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
            translate([-extension, 0, cut_len*i/(hole_count+1)])
                rotate([0,90,0])
                    cylinder(h=hole_depth, d=hole_diameter, $fn=32);
        }
    }
}

// Nominal published-CAD shape. Functional extension and hole layout are
// intentionally retained; no printer-specific fit corrections are applied.
module key_2040_001(cut_len) {
    _key_2040_geometry(cut_len=cut_len, wedge_adjust=0, shoulder_raise=0);
}

// Historical experimental geometry preserved for reproducibility.
// Wedge enlargement 0.5 mm each side; shoulder X raised by 0.6 mm.
module key_2040_003(cut_len) {
    _key_2040_geometry(cut_len=cut_len, wedge_adjust=0.5, shoulder_raise=0.6);
}

// Historical prototype call signature, retained for compatibility.
module key2040(cutLen) {
    key_2040_003(cut_len=cutLen);
}
