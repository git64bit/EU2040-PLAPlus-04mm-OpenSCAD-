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
include <EU2040.scad>;
key_2040_001(cut_len=25.4);
```

The library entry point is `EU2040.scad` (not `std.scad`). Browse the [module documentation](https://github.com/git64bit/EU2040-PLAPlus-04mm-OpenSCAD-/wiki). The GitHub Wiki is maintained as a separate Git repository. See the [Wiki media convention](docs/wiki-media.md) for standardized views and Revision 1 illustration policy.

The library modules do not create geometry unless invoked. See `examples/key_sample.scad` for a standalone example.

## Geometry status

`key_2040_001(cut_len)` is the public nominal CAD-based key; it applies no empirical fit adjustments. `key_2040_003(cut_len)` and its compatibility alias `key2040(cutLen)` preserve the photographed experimental version (+0.5 mm wedge per side and 0.6 mm raised shoulder). The nominal model still contains functional extension and blind-hole features. Keep printer-specific manufacturing wrappers in ignored `private-calibration/`, never in the public library. See [calibration workflow](docs/calibration.md).

## Six-slot printed transition

`transition_2040_001(cut_len=5);` generates a full 20 × 40 mm outline with six continuous slots: two along each 40 mm side and one along each 20 mm end. The six slot openings have matching axial bevels **at both ends** of the printed piece. Version 001 currently uses the experimental key-derived slot geometry, **not** an independently verified published nominal slot. Its physical fit remains to be tested. It uses a fixed 0.8 mm lead-in and 0.4 mm enlargement at each axial end. These are experimental design coordinates, not printer calibration.

The printed transition is intended between real aluminum extrusion sections. Its outer envelope stays nominally full size; it does not by itself force misaligned aluminum sections into alignment. Print and test a short specimen before relying on a key crossing the junction. The internal shape of the commercial aluminum extrusion is deliberately not reproduced.

All length parameters are required and explicitly checked; no defaults.

## Repository maintenance

This repository is single-maintainer. External pull requests and contributions are not accepted; independent forks are welcome under the LICENSE terms. The checked-in geometry intentionally omits printer-specific calibration recipes.

## Manufacturing notes

The 1.8 mm pilot holes are intentionally small relative to the approximately 3.4 mm screws used in initial experiments; **do not assume they will accept those screws without cracking or stripping**. Verify on a short specimen and adjust in a separate, locally calibrated model. A 15 mm screw with a 3 mm mounting stack nominally enters the key 12 mm, leaving 0.8 mm before the modeled bottom; actual countersink seating and screw-tip geometry must be checked.

## License

BSD 2-Clause; see [LICENSE](LICENSE). Project style follows the practical conventions of BOSL2 where helpful. BOSL2 is not required to use this library.
