#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'timezone' Feature with no options.
#
# For more information, see: https://github.com/devcontainers/cli/blob/main/docs/features/test.md
#
# Eg:
# {
#    "image": "<..some-base-image...>",
#    "features": {
#      "timezone": {}
#    },
#    "remoteUser": "root"
# }
#
# Thus, the value of all options will fall back to the default value in 
# the Feature's 'devcontainer-feature.json'.
# For the 'timezone' feature, that means the fallback timezone is 'UTC',
# but the actual timezone applied will likely be from the host's /etc/localtime.
# When testing in a devcontainer, that in turn is likely to be UTC anyway,
# unless the devcontainer itself is already using this timezone feature.
#
# These scripts are run as 'root' by default. Although that can be changed
# with the '--remote-user' flag.
# 
# This test can be run with the following command:
#
#    devcontainer features test \ 
#                   --features timezone   \
#                   --remote-user root \
#                   --skip-scenarios   \
#                   --base-image mcr.microsoft.com/devcontainers/base:ubuntu \
#                   /path/to/this/repo

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]
check "devcontainer-timezone-set script present" bash -c "[ -x /usr/local/bin/devcontainer-timezone-set ]"
check "timezone matches host" bash -c "LANG=C date --date=@0 | grep '$(LANG=C date --date=@0)'"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults