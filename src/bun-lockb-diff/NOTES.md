## Context

See the documentation at [the bun website](https://bun.sh/docs/install/lockfile).

## Implementation

This feature adds git config and attributes to files in `~/.config/git/` for the dev container user during container build. Naturally, to be useful `bun` must be available in the dev container (how else do you get a `.lockb` file in the first place?) but, as there are several available devcontainer features for installing bun, a particular prerequisite is not specified.