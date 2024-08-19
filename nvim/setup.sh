#!/usr/bin/env bash

HERE="$(cd $(dirname $0); pwd)"
DESTINATION="${XDG_CONFIG_HOME:-${HOME}/.config}/nvim"
OS_ID="$(lsb_release --id --short)"
MISSING=()

${HERE}/../font.sh

echo "i> Ensure all components are installed"
case "${OS_ID}" in
	"Arch")
		sudo pacman --sync --needed --noconfirm gcc make git lazygit ripgrep fd unzip lua51 luarocks neovim
		;;
	*)
		echo "!!> Unsupported OS..."
		echo "!!> Do what you need to, to install: gcc, make, git, lazygit, ripgrep, fd, unzip, lua (5.1), luarocks and neovim"
		;;
esac

# Link configuration
if [ -e "${DESTINATION}" ]; then
	echo "!> ${DESTINATION} already exists, removing old content."
	rm -fr ${DESTINATION}
fi
echo "i> Linking configuration..."
ln --symbolic --verbose ${HERE} ${DESTINATION}

