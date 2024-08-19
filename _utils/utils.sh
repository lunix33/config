if [ -z "${__UTILS:-}" ]; then

declare -gA _utils_TMP
_utils_TMP_INIT=0
function _tmp_cleanup() {
	for key in "${!_utils_TMP[@]}"; do
		local path="${_utils_TMP[${key}]}"
		[ ! -e "${path}" ] && continue ||:
		rm -fr ${path}
	done
}
function utils_get_tmp() {
	local key="$1"
	local out="$2"
	
	if [ -z "${_utils_TMP[${key}]:-}" ]; then
		_utils_TMP[${key}]="$(mktemp --directory --tmpdir=/tmp)"
		echo "i> Created temporary file location (${_utils_TMP[${key}]})."
	fi
	
	if [ ${_utils_TMP_INIT} -eq 0 ]; then
		echo "i> Temporary file cleanup planned..."
		_utils_TMP_INIT=1
		trap _tmp_cleanup EXIT
	fi
	eval ${out}="${_utils_TMP[${key}]}"
}

function utils_version_compare() {
	local lhs="$1"
	local rhs="$2"
	
	local newest="$(echo -e "${lhs}\n${rhs}" | sort --version-sort | tail -n1)"
	[ "${newest}" == "${lhs}" ] && echo "1" || echo "-1"
}

function utils_extract() {
	local dir="$(dirname $1)"
	local archive="$(basename $1)"
	local remove="${2:-}"
	
	echo "=> Extracting content from $1..."
	pushd ${dir}
	case "${archive#*.}" in
		"tar.xz")
			echo "i> Using tar (xz)"
			tar -xJf ${archive}
			;;
		"zip")
			echo "i> Using unzip"
			unzip ${archive}
			;;
		*)
			echo "!> Possibly unsupported container"
			return 1
			;;
	esac
	popd
	
	if [ -n "${remove}" ]; then
		echo "i> Removing original archive..."
		rm $1
	fi
}

__UTILS=1
fi

