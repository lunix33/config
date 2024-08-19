#!/usr/bin/env bash

HERE="$(cd $(dirname $0);pwd)"
FONT_REPO="ryanoasis/nerd-fonts"
FONT_NAME="${FONT_NAME:-Recursive}"
DESTINATION="${HOME}/.local/share/fonts/${FONT_NAME}"

source "${HERE}/_utils/gh.sh"
source "${HERE}/_utils/utils.sh"

function main() {
	__font_dl=""
	gh_download "${FONT_REPO}" ".name | startswith(\"${FONT_NAME}\")" "${DESTINATION}" "__font_dl"
	if [ -z "${__font_dl}" ]; then
		exit 0
	fi

	utils_extract "${__font_dl}" "1"
	echo "=> Updating font cache..."
	fc-cache --force --verbose
	
	echo "Font ${FONT_NAME} installed at ${DESTINATION}"
}

set -euo pipefail
main

