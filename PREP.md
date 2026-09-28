# Workshop prep checklist

Everything the slides assume that is not yet true, in priority order.
Slides with a matching `TODO` in their speaker notes are marked (§).

## Release blockers

The hands-on cannot happen without these.

- [ ] **appose-java 0.12.0** released. `scripting-appose-python` pins
      `appose.version` 0.12.0; appose-java is still at `0.12.0-SNAPSHOT`.
- [ ] **scripting-appose-python 0.1.0** released, and shipped to the Fiji
      update site so that a fully updated Fiji *Latest* has it. The abstract
      promises this "debut".
- [ ] **Script directory on `sys.path`** in scripting-appose-python, so a
      script can `import` a helper module sitting next to it (§ Step 3). A
      one-liner in `wrapper.py`, e.g. prepend
      `os.path.dirname(_appose_script_path)` when it is a real path. Without
      it, attendees need a hardcoded `sys.path.insert(...)`.

## Hands-on verification

Run through the whole hands-on on a clean machine (ideally Linux, macOS and Windows).

- [ ] `pixi.toml` on the Step 1 slide builds, including `appose>=0.12` on Python 3.9.
- [ ] Sample image shape and dtype printed in Step 2 match the slide (§).
- [ ] Step 3 works with upstream `unseg.py`, unmodified. The algorithm
      output dtype (int64?) converts back to an `Img` cleanly.
- [ ] Step 4: `#@ String (choices=...)` and the other parameters reach Python as expected.
- [ ] Step 5: placing `unseg.py` beside the script in `scripts/Plugins/UNSEG/`
      does **not** also register `unseg.py` as a (Jython!) menu command (§).
      If it does, move the helper into a subfolder or a `lib` location, and
      update the slide.
- [ ] Status-bar progress is visible during the first environment build.
- [ ] Push a `2026` branch with step checkpoints to
      https://github.com/ctrueden/unseg-fiji (referenced on the Step 0 slide).
- [ ] Pre-download: consider a USB stick / local mirror of the pixi cache
      for conference Wi-Fi.

## scikit-ops section

- [ ] **scikit-ops 0.1.0** and **skop-napari 0.1.0** on PyPI (§ "Try It
      Yourself"). Otherwise the slide becomes "coming soon" and the demo
      runs from a checkout.
- [ ] Confirm the `unseg` op works from a *pip-installed* skop (its env
      cannot install scikit-ops; it relies on `sys.path` injection).
- [ ] **skop-fiji 0.1.0** plus an update site (§ "And in Fiji"). If not
      ready, retitle the slide to "Coming soon: skop-fiji". Verify the menu
      path of the `unseg` op.
- [ ] Demo machine: pre-build `stardist-tf`, `cellpose3`, `unseg-cv` envs.
      Pick the 3D dataset for the StarDist + Cellpose slicewise demo (§).

## Demos and news

- [ ] **appose-swing** status: update or drop the "Coming Soon" slide, and add a screenshot (§).
- [ ] Pick 1–2 Appose-Playground plugins to demo live; pre-build their envs.
- [ ] Verify the Big-FISH description (`BigFish_Appose` is on the update
      site but not yet listed on the Image-Analysis-Hub page).
- [ ] Check TrackMate's current Appose status: still the `v9-appose` branch?
- [ ] Fill in the appose-java 0.12.0 release date on the Releases slide.
- [ ] Double-check the Python-mode snippet (`ij.py.from_java` /
      `ij.py.to_dataset`) in a live Python-mode Fiji.

## Publishing

- [ ] Create `fiji/i2k-2026-fiji-python` on GitHub and enable Pages
      (Settings › Pages › Source: GitHub Actions). The slides already link to
      `https://fiji.github.io/i2k-2026-fiji-python/`.
- [ ] Add the recording link to the title slide afterward, as last year.
