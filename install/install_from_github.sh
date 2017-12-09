#!/bin/bash

#######################################
# Downloads latest release
# Arguments:
#   DOWNLOAD_URL
#   DOWNLOAD_PATH
#   DEST_DIR_NAME
#   RELEASE_NAME
#######################################
function download_gh_release() {
    echo "Downloading package"

    curl -s "$1" \
        | grep browser_download_url \
        | grep "$4" \
        | cut -d '"' -f 4 \
        | xargs curl -#Lo "$2/$3.tar.gz"

    mkdir -p "$2/$3"
    cd "$2/$3" || exit
    tar -xf "$2/$3.tar.gz" \
        --strip=1
}
