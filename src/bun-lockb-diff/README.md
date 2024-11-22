
# Bun lockb diff (bun-lockb-diff)

Better git diff behaviour for Bun's lockb file.

## Example Usage

```json
"features": {
    "ghcr.io/tgoz/devcontainer-features/bun-lockb-diff:0": {}
}
```



## Context

See the documentation at [the bun website](https://bun.sh/docs/install/lockfile).

## Implementation

This feature adds git config and attributes to files in `~/.config/git/` for the dev container user during container build. Naturally, to be useful `bun` must be available in the dev container (how else do you get a `.lockb` file in the first place?) but, as there are several available devcontainer features for installing bun, a particular prerequisite is not specified.

---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/tgoz/devcontainer-features/blob/main/src/bun-lockb-diff/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
