# Wiki media convention

The GitHub Wiki is a **separate Git repository**; do not duplicate Wiki pages here. It is maintained locally in `~/EU2040/EU2040-wiki/` by the repository owner.

Every model page starts with a compact 2 x 2 visual gallery:

| Top-left | Top-right |
|---|---|
| Isometric | Cross-section / End |
| Top / Side | Animation |

Technical commentary follows **below** the gallery, as Markdown prose. Use fixed 4:3 media cells with common 640 x 480 source dimensions; display each at approximately 300 px maximum width. The first three are still PNG; the fourth may be an animated GIF when released.

During development use view-specific shared PNG placeholders marked `Rendering pending — Revision 1`. If a view is genuinely not applicable, use a different placeholder marked `No rendering for this view`. Do not confuse *pending* with *not applicable*.

Released illustrations are captured only after the physical model is mature and frozen as Revision 1. The three static views are isometric, cross-section/end, and top/side. Animation can show rotation or the model's mechanical movement when available. Keep all images and GIFs in the Wiki Git repository, not the source repo. **Do not change source CAD solely to prepare documentation screenshots.**

A Wiki gallery references files in `images/common/` while pending, and eventually versioned files in `images/<module_name>/`; updating released media must not alter the page layout. No renderer is run automatically or in CI. All images are reviewed by the maintainer before publication.

Private printer calibration must stay in `private-calibration/`, as specified in `docs/calibration.md`.
