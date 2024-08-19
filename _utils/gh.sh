if [ -z "${__GH:-}" ]; then

SRC=$(cd $(dirname $BASH_SOURCE); pwd)
source "${SRC}/utils.sh"

function _gh_get_local_metadata() {
	local destination="$1"
	local out="$2"
	
	echo "=> Getting local metadata..."
	if [ -d "${destination}" ]; then
		eval ${out}=$(jq --raw-output ".tag_name" ${DESTINATION}/release.json)
		echo "i> Found ${!out} locally"
	else
		eval ${out}="v0.0.0"
		echo "!> No local version found."
	fi
}

function _gh_get_remote_metadata() {
	local repo="$1"
	local search="$2"
	local out="$3"
	
	__gh_tmp=""
	utils_get_tmp "${repo}" "__gh_tmp"
	local tmp="${__gh_tmp}"
	
	echo "=> Getting remote metadata..."
	curl --fail  --silent --show-error --location \
		https://api.github.com/repos/${repo}/releases/latest | \
		jq --raw-output "
			 .assets = (.assets |
			map(select(${search})) |
			first)" > ${tmp}/release.json
	eval ${out}=$(jq --raw-output ".tag_name" ${tmp}/release.json)
	echo "i> Found ${!out} remotely"
}

function _gh_download_remote() {
	local url="$1"
	local destination="$2"
	
	echo -e "=> Downloading file\n\tfrom ${url}\n\tto ${destination}"
	curl --fail  --silent --show-error --location --output ${destination} ${url}
}

function gh_download() {
	local repo="$1"
	local search="$2"
	local destination="$3"
	local out="$4"
	
	__gh_tmp=""
	utils_get_tmp "${repo}" "__gh_tmp"
	local tmp="${__gh_tmp}"
	
	__gh_local_version=""
	__gh_remote_version=""
	_gh_get_local_metadata ${destination} "__gh_local_version"
	_gh_get_remote_metadata "${repo}" "${search}" "__gh_remote_version"
	if [ "$(utils_version_compare ${__gh_local_version} ${__gh_remote_version})" -eq 1 ]; then
		echo "i> Up to date; Nothing to do."
		return
	fi
	echo "!> New version required; Downloading from remote..."
	
	local url=$(jq --raw-output '.assets.browser_download_url' ${tmp}/release.json)
	local name=$(jq --raw-output '.assets.name' ${tmp}/release.json)
	_gh_download_remote "${url}" "${tmp}/${name}"
	
	if [ -e "${destination}" ]; then
		echo "!> Destination exists, cleaning..."
		rm --force --recursive ${destination}
	fi
	mkdir --parents $(dirname ${destination})
	mv ${tmp} ${destination}
	eval ${out}="${destination}/${name}"
}

__GH=1
fi

