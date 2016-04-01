#!/bin/bash

die() {
	echo "$@"
	exit 1
}

onexit() {
	rm -f "${repo_file}"
}
trap onexit EXIT

repo_file=$(mktemp)

curl --silent --output "${repo_file}" https://storage.googleapis.com/git-repo-downloads/repo

repo_version=$(sed -nre '/^VERSION/s/.*\(([0-9]+),\s+([0-9]+)\).*/\1.\2/p' "${repo_file}")

case "${repo_version}" in
	1.17) expect_shasum=ddd79b6d5a7807e911b524cb223bc3544b661c28 ;;
	1.19) expect_shasum=92cbad8c880f697b58ed83e348d06619f8098e6c ;;
	1.20) expect_shasum=e197cb48ff4ddda4d11f23940d316e323b29671c ;;
	1.21) expect_shasum=b8bd1804f432ecf1bab730949c82b93b0fc5fede ;;
	1.22) expect_shasum=da0514e484f74648a890c0467d61ca415379f791 ;;
	*) die "Unexpected version: $repo_version" ;;
esac

echo "${expect_shasum}  ${repo_file}" | shasum -sc || die "Downloaded file does not match SHA-1 checksum: ${expect_shasum}"

echo "Installing repo in ~/bin ..."

mkdir -p ~/bin
mv "${repo_file}" ~/bin
chmod a+x ~/bin/repo
