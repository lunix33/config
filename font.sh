#!/usr/bin/env bash

FONT_REPO="ryanoasis/nerd-fonts"
FONT_NAME="${FONT_NAME:-Recursive}"
DESTINATION="${HOME}/.local/share/fonts/${FONT_NAME}"
UPTODATE=0
TMP=$(mktemp --directory --tmpdir=/tmp font.XXXXX)

function on_exit() {
	if [ -d ${TMP} ]; then
		rm --force --recursive ${TMP}
	fi
}
trap on_exit EXIT

function get_local_metadata() {
	echo "Getting local metadata..."
	if [ -d "${DESTINATION}" ]; then
		LOCAL_VERSION=$(jq --raw-output ".tag_name" ${DESTINATION}/release.json)
		echo "i> Found ${FONT_NAME} ${LOCAL_VERSION} locally"
	else
		LOCAL_VERSION="v0.0.0"
		echo "!> No local version found."
	fi
}

function get_remote_metadata() {
	echo "Getting remote metadata..."
	curl --fail  --silent --show-error --location \
		https://api.github.com/repos/${FONT_REPO}/releases | \
		jq --raw-output "
			sort_by(.published_at) | reverse |
			map(select(.prerelease == false)) |
			first | .assets = (.assets |
				map(select(.name | startswith(\"${FONT_NAME}\"))) |
				first)" > ${TMP}/release.json
	REMOTE_VERSION=$(jq --raw-output ".tag_name" ${TMP}/release.json)
	echo "i> Found ${FONT_NAME} ${REMOTE_VERSION} remotely"
}

function version_compare() {
	VERSION_NEWEST="$(echo -e "${LOCAL_VERSION}\n${REMOTE_VERSION}" | sort --version-sort | tail -n1)"
	[ "${VERSION_NEWEST}" == "${LOCAL_VERSION}" ] && UPTODATE=1 || UPTODATE=0
}

function download_remote() {
	DL=$(jq --raw-output '.assets.browser_download_url' ${TMP}/release.json)
	FILE=$(jq --raw-output '.assets.name' ${TMP}/release.json)
	echo -e "Downloading ${FONT_NAME} font\n\tfrom ${DL}\n\tto ${TMP}/${FILE}"
	curl --fail  --silent --show-error --location --output ${TMP}/${FILE} ${DL}
}

function extract() {
	echo "Extracting font from ${TMP}/${FILE}..."
	pushd ${TMP}
	case "${FILE#*.}" in
		"tar.xz")
			echo "i> Using tar (xz)"
			tar -xJf ${FILE}
			;;
		"zip")
			echo "i> Using unzip"
			unzip ${FILE}
			;;
		*)
			echo "!> Unsupported container"
			exit 1
			;;
	esac
	popd
	rm ${TMP}/${FILE}
}

function install() {
	mkdir --parents "$(dirname ${DESTINATION})"
	if [ -d "${DESTINATION}" ]; then
		echo "!> Removing old font..."
		rm --force --recursive ${DESTINATION}
	fi

	echo "Installing font into ${DESTINATION}..."
	mv ${TMP} ${DESTINATION}
	fc-cache --force --verbose
	echo "Font ${FONT_NAME} (${REMOTE_VERSION}) installed at ${DESTINATION}"
}

function main() {
	get_local_metadata
	get_remote_metadata
	
	version_compare
	if [ ${UPTODATE} -eq 1 ]; then
		echo "i> Up to date; Nothing to do. Exiting."
		exit 0
	fi
	echo "!> Remote install required."

	download_remote
	extract
	install
}

set -euo pipefail
main

