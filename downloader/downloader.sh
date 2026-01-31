#!/bin/bash


copy_sources_to_disk() {
    mount_devices
    mkdir -pv $LFS/sources
    chmod -v a+wt $LFS/sources
    cp -vr $DOWNLOAD_DIR/* $LFS/sources/
    umount_devices
}

download_source_packages() {
    . $WORK_DIR/downloader/manifest.sh
    cd $DOWNLOAD_DIR
    mkdir -pv temp
    cd temp
    for package_json in "${source_packages[@]}"; do
        url=$(echo "$package_json" | jq -r '.url')
        package_name=$(echo "$package_json" | jq -r '.package')
        md5=$(echo "$package_json" | jq -r '.Md5')
	file=$(basename $url)
        echo "Downloading $file from $url"
        # Check if file already exists
        if [ -f "../$file" ]; then
            echo "File $file already exists, skipping download"
            continue
        fi
        wget -v --show-progress "$url"
        echo "Downloaded $package_name"
        # Verify MD5 checksum
        if command -v md5sum >/dev/null 2>&1; then
            actual_md5=$(md5sum "${file}" | cut -d' ' -f1)
        elif command -v md5 >/dev/null 2>&1; then
            actual_md5=$(md5 -q "${file}")
        else
            echo "Warning: No md5 command found"
            exit
        fi
        if [ "$actual_md5" = "$md5" ]; then
            echo "MD5 checksum verified for $package_name"
	    mv $file ../
        else
            echo "ERROR: MD5 checksum mismatch for $package_name"
            echo "Expected: $md5"
            echo "Actual: $actual_md5"
            exit 1
        fi
    done
    cd $WORK_DIR
}
