# A few handy dev container features

## bun-lockb-diff

Configure git to show a useful diff for [bun's lockb file](https://bun.sh/docs/install/lockfile).

## supabase

The [supabase command line interface](https://supabase.com/docs/guides/local-development)

## timezone

Set your dev container's timezone from one of these sources. First available and valid source will be used; if a source is not set, blank, or not a valid timezone, the feature will go on to the next source.

- The `DEVTZ` container environment variable, defined in `devcontainer.json`; this can be sourced from the host environment by `${localEnv:TZ}`, or set to a fixed string (e.g. `Australia/Sydney`) if all users of the dev container should have the same timezone.
- The host's `/etc/localtime`.
- The feature's `fallbackTimezone` option; this can only be a fixed string.
- The timezone built in to the container - usually, but not always, UTC.
