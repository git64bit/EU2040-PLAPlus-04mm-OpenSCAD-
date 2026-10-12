# Calibration workflow

EU2040's published `key_2040_001(cut_len)` always uses the nominal CAD-based mating profile. It is not calibrated automatically.

## Manufacture locally

1. Print a short nominal reference specimen using `key_2040_001(cut_len=25.4)`.
2. Observe fit, screw engagement, orientation and dimensional accuracy on the actual hardware.
3. Place a manufacturing wrapper in `private-calibration/`, which is excluded by `.gitignore`.
4. In the private wrapper, import `EU2040.scad` and call `_key_2040_geometry(cut_len, wedge_adjust, shoulder_raise)` with measured feature adjustments.
5. Verify and record the physical result. Freeze that local wrapper once satisfactory. A change in printer, nozzle, material, filament, slicer, or print orientation warrants another private wrapper and repeat testing.

Example call after extracting the separate private calibration archive into the repository root:

```openscad
include <private-calibration/ender5plus_asset001_04mm_pla_plus_cura5.scad>;
ender5plus_asset001_04mm_pla_plus_cura5_tight_fit(cut_len=100);
```

The private calibration archive contains the observed +0.5 mm lower-wedge adjustment per side and 0.6 mm raised retaining shoulder, still marked experimental. No unmeasured physical qualification is asserted.

The public `key_2040_003` remains as a historical record of that experimental shape and is **not** the nominal model. `transition_2040_001` currently uses the experimental profile for its six slots and has not been independently fit-validated.

No automatic printer detection or universal shrinkage value is used. Private scripts and data must never be published. The internal geometry helper's named arguments are an implementation interface; pin your library commit when freezing a manufacturing wrapper.
