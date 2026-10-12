// EU2040 printable transition between real 20 x 40 mm aluminum sections.
// All six single-key slots are open along the full axial length.
// Each slot has an entry/exit lead-in at BOTH axial faces.
// Millimeters. Experimental geometry, not a dimensional certification.
// License: see ../LICENSE.

// Derived from the *embedded portion* of key_2040_003.
// Do not include its 4.8 mm exposed extension or its screw holes.
module _eu2040_keyway_2d() {
    polygon(points=[
        [-2.0, -3.1],
        [3.7, -3.1],
        [3.7, -5.5],
        [4.8, -5.5],
        [8.0, -2.7],
        [8.0,  2.7],
        [4.8,  5.5],
        [3.7,  5.5],
        [3.7,  3.1],
        [-2.0, 3.1]
    ]);
}

// 20 x 40 envelope, six slots:
// one on each 20 mm end, two on each 40 mm side.
module _eu2040_six_keyways_2d() {
    translate([0, -20])
        rotate(90) _eu2040_keyway_2d();
    translate([0, 20])
        rotate(-90) _eu2040_keyway_2d();

    for (side_y=[-10, 10]) {
        translate([-10, side_y])
            _eu2040_keyway_2d();
        translate([10, side_y])
            rotate(180) _eu2040_keyway_2d();
    }
}

// A local axial chamfer cut: enlarged slot opening at the end face,
// merging into the exact nominal keyway after lead_in mm.
module _eu2040_slot_lead_in(lead_in, flare) {
    hull() {
        linear_extrude(height=0.01)
            offset(delta=flare)
                _eu2040_six_keyways_2d();
        translate([0,0,lead_in])
            linear_extrude(height=0.01)
                _eu2040_six_keyways_2d();
    }
}

// Full-size outer outline; no approximation of aluminum internal webs.
// Two-sided axial bevels apply to all six keyways.
// Fixed lead-in geometry is recorded as version 001, not global tolerance.
module transition_2040_001(cut_len) {
    assert(!is_undef(cut_len) && is_num(cut_len) && cut_len > 0,
        "transition_2040_001: cut_len must be a positive number");

    lead_in = 0.8;
    flare = 0.4;

    assert(cut_len > 2*lead_in,
        "transition_2040_001: cut_len too short for two lead-ins");

    difference() {
        linear_extrude(height=cut_len)
            square([20,40], center=true);

        // Continuous six-slot paths.
        translate([0,0,-0.02])
            linear_extrude(height=cut_len+0.04)
                _eu2040_six_keyways_2d();

        // Lead-in at z=0.
        translate([0,0,-0.01])
            _eu2040_slot_lead_in(lead_in, flare);

        // Matching lead-in at z=cut_len.
        translate([0,0,cut_len+0.01])
            mirror([0,0,1])
                _eu2040_slot_lead_in(lead_in, flare);
    }
}
