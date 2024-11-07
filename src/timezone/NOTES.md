## Choose the timezone used in your Dev Container

### Developers get their local timezone

If you want to allow developers to override their host's timezone using
an environment variable (e.g. `TZ`), add this line to `devcontainer.json`

```
"containerEnv" : { "DEVTZ": "${localEnv:TZ}" }
```

If the above line is not used, or the relevant environment variable is
unset or empty, this feature will attempt to determine the host machine's
timezone by reading `/etc/localtime`.

If unable to determine a timezone from `/etc/localtime`, the fallback
timezone specified in the feature option will be used. If that is not
set, no timezone setting will be performed, and the dev container will
retain its original timezone configuration - often, but not always, UTC.

### All developers forced to the same timezone

Add a line like this to `devcontainer.json`

```
"containerEnv" : { "DEVTZ": "Australia/Sydney" }
```