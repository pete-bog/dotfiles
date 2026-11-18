# Save the generic OS name (eg. Darwin/Linux) to the PLATFORM variable.
# Save the Linux distribution name to the DISTRO variable.
export PLATFORM="$(uname -s)"

# Translate the windows uname to more friendly name.
if [[ "$PLATFORM" == MINGW64_NT* ]]; then
    export PLATFORM="Windows"
fi

# If we're in WSL, then record this in a variable.
if [[ -n "$WSLENV" ]]; then
    export WSL="true"
fi

# Find the linux distribution name, and save to variable.
if [[ -f /etc/os-release ]]; then
    export DISTRO=$(sed -n 's/^NAME="\([A-Za-z0-9_]*\)"$/\1/p' /etc/os-release)
fi
