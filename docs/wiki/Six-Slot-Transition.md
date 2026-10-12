# Six-Slot Transition — `transition_2040_001()`

**Status:** Experimental, pending physical fit and junction testing.

## Invocation

```openscad
include <EU2040.scad>;
transition_2040_001(cut_len=5);
```

## Parameters

| Name | Required | Unit | Description |
|---|---|---|---|
| `cut_len` | Yes | mm | Axial section length; must be greater than 1.6 mm |

## What this makes

- A **full-size 20 × 40 mm** external rectangular envelope.
- Six continuous single-key slots: two on each 40 mm face and one on each 20 mm face.
- At **both axial ends**, each of the six slots has an entry/exit chamfer region.
- The current fixed geometry uses a 0.8 mm lead-in and 0.4 mm slot flare. These are version-specific geometric choices, not global print tolerances.
- The internal cavities and webs of aluminum extrusion are intentionally not reproduced. The physical role is to form a short transition at a junction between actual metal sections.

The lead-ins are placed at `Z=0` and `Z=cut_len`. The middle of the printed slot retains its intended cross-section.

## Intended test

Use a short specimen between two real aluminum extrusions. Verify dimensions, alignment, and whether the established sliding key passes across **both junctions** on each of the six slot paths. A thin intermediate part alone cannot structurally align poorly secured metal sections.

## Source and example

[`profiles/transition_2040.scad`](../../profiles/transition_2040.scad) · [`examples/transition_sample.scad`](../../examples/transition_sample.scad)

Documentation is based on source geometry; verified rendered screenshots have not yet been published in this page.
