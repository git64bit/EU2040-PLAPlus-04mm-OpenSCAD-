# Sliding Key — `key_2040_003()`

**Status:** Experimental; physically iterated prototype. Not load-qualified.

## Invocation

```openscad
include <EU2040.scad>;
key_2040_003(cut_len=100);
```

To test a short piece:

```openscad
include <EU2040.scad>;
key_2040_003(cut_len=25.4);
```

## Parameters

| Name | Required | Unit | Description |
|---|---|---|---|
| `cut_len` | Yes | mm | Extrusion length along Z; must be positive |

## Geometry

- Cross-section based on the tested 2040 slot fit, including the raised retaining collar.
- Seven evenly distributed transverse **blind** pilot holes, diameter 1.8 mm, depth 12.0 mm.
- Nominal 0.8 mm remaining wall at the modeled deep end of each hole.
- The key includes a 4.8 mm exposed extension beyond the slot.
- Hole centers are at `cut_len*i/8`, for `i=1..7`.

The hole diameter is not a validated threaded fit for every screw or print. Inspect screw engagement, cracking, and penetration before assembling instruments.

## Orientation

Z follows the length of the metal slot; the key cross-section lies in XY. The blind screw axes follow +X, from the outward-facing extension toward the embedded foot.

## Source and example

[`keys/sliding.scad`](../../keys/sliding.scad) · [`examples/key_sample.scad`](../../examples/key_sample.scad)

Documentation is based on source geometry; verified rendered screenshots have not yet been published in this page.
