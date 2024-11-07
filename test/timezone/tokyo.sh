#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'timezone' feature with "fallbackTimezone": "Australia/Adelaide" option,
# and a container environment variable "DEVTZ": "Asia/Tokyo"

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "Unix epoch in Tokyo" bash -c "LANG=C date --date=@0 | grep 'Thu Jan  1 09:00:00 JST 1970'"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
