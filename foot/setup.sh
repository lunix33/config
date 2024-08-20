#!/usr/bin/env bash

HERE="$(cd $(dirname $0); pwd)"
DESTINATION="${XDG_CONFIG_HOME:-${HOME}/.config}/foot"

set -euo pipefail

echo "i> Ensure 'foot' is installed..."
case "$(lsb_release --id --short)" in
	"Arch")
		sudo pacman --sync --needed --noconfirm foot
		;;
	"Pop")
		sudo apt install --yes foot
		;;
	*)
		echo "Unsupported OS..."
		echo "Do what you need to, to install: foot"
		;;
esac

if [ -e "${DESTINATION}" ]; then
	echo "!> ${DESTINATION} already exists, removing old content."
	rm -fr ${DESTINATION}
fi
echo "i> Linking configuration..."
mkdir --parents $(dirname ${DESTINATION})
ln --symbolic --verbose ${HERE} ${DESTINATION}

