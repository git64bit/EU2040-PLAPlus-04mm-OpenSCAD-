# EU2040 PLA+ OpenSCAD library

A small, open-source library of printable parts for **European 20 × 40 mm T-slot aluminum extrusion**, using OpenSCAD and a **0.4 mm nozzle / PLA+** manufacturing baseline.

The trailing dash in the repository name is intentional: actual manufacturing results also depend on printer, slicer, filament, orientation, temperature, support strategy, and intended fit.

## Why

Own and maintain the design; manufacture parts on demand instead of maintaining physical inventory; use existing equipment economically for low-volume production; and retain designs that can be adapted to new materials and processes.

## Scope and limitations

- COTS EU2040 components, starting with a **single-slot sliding key**.
- Millimeters throughout. No global printer clearance or shrinkage parameter.
- Public source defines nominal or historically recorded geometry, **not universal print calibration**.
- Individual printers, slicers, materials, nozzle configurations, and load cases must be calibrated and tested locally; keep those manufacturing recipes separate.
- Functional load capacity, screw engagement and long-term performance are **not certified**.
- A 0.4 mm nozzle is the baseline; 0.2 mm layer height is the current test reference, not an invariant of every part.
- Profiles sold as “2040” may have incompatible slot cross-sections. Test a short section against your particular extrusion before committing to a long print.

## Quick start

```openscad
include <std.scad>;
key2040(cutLen=25.4);
```

The library modules do not create geometry unless invoked. See `examples/key_sample.scad` for a standalone example.

## Geometry status

`key2040()` implements the latest photographed/slicer-inspected **experimental** profile, with the raised shoulder and seven blind holes. It has not yet been established as a universal fit. Preserve earlier implementations through Git history; when a tested geometry changes, create a new numbered version instead of silently changing a published, validated geometry.

## Manufacturing notes

The 1.8 mm pilot holes are intentionally small relative to the approximately 3.4 mm screws used in initial experiments; **do not assume they will accept those screws without cracking or stripping**. Verify on a short specimen and adjust in a separate, locally calibrated model. A 15 mm screw with a 3 mm mounting stack nominally enters the key 12 mm, leaving 0.8 mm before the modeled bottom; actual countersink seating and screw-tip geometry must be checked.

## License

BSD 2-Clause; see [LICENSE](LICENSE). Project style follows the practical conventions of BOSL2 where helpful. BOSL2 is not required to use this library.
