# Save the generic OS name (eg. Darwin/Linux) to the PLATFORM variable.
# Save the Linux distribution name to the DISTRO variable.
export PLATFORM="$(uname -s)"
if [[ -f /etc/os-release ]]; then
    export DISTRO=$(grep --color=no -oP '(?<=^NAME=")\w*(?=")' /etc/os-release)
fi
