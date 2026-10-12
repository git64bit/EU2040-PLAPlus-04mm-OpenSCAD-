# EU2040 OpenSCAD Module Catalog

**European 20 × 40 mm six-slot COTS extrusion.** Public baseline: PLA+ with a 0.4 mm nozzle. All dimensions are millimeters.

This documentation is maintained alongside source files so module calls and geometric definitions can be reviewed together.

## Usage

Put the repository where OpenSCAD can resolve its library path, then:

```openscad
include <EU2040.scad>;
key_2040_003(cut_len=25.4);
```

Use **F5** to preview or **F6** to render the selected module. Importing the library by itself creates no geometry. Required lengths have no default.

## Module catalog

| Module | Purpose | Details |
|---|---|---|
| [`key_2040_003(cut_len)`](Sliding-Key.md) | Single-slot sliding PLA+ anchor; seven blind holes | [Source](../../keys/sliding.scad) |
| [`transition_2040_001(cut_len)`](Six-Slot-Transition.md) | Full-outline 20 × 40 mm short junction, six slots with lead-ins on both axial faces | [Source](../../profiles/transition_2040.scad) |

## Validation

These modules are **experimental**. Visual renders are not evidence of mechanical fit. Test short prints against the actual metal extrusion, with the chosen material and equipment. No external manufacturer calibration or load rating is implied.

## Repository policy

Single-maintainer repository. Contributions and pull requests are not accepted. Forking is permitted under the repository's LICENSE. Printer-specific calibration is not part of the public model definitions.

[Examples](../../examples/) · [Library entry point](../../EU2040.scad) · [Main README](../../README.md)
