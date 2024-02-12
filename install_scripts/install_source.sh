
SOURCES_ROOT_DIR=/sources
RECIPES_DIR=$SCRIPT_PATH/recipes/$FERNINUX_TARGET_ARCH

function install_package_list() {
    cd $RECIPES_DIR
    for file in "${recipes[@]}"
    do
	if [ -x "$file.sh" ]; then
            . ./"$file.sh"
	    if [ $(grep -c "$file;$VERSION" $INSTALLED_PACKAGES_FILE) -eq 0 ]; then
		echo "extracting files from $SRC_COMPRESSED_FILE"
		rm -rf $SOURCES_ROOT_DIR/$SRC_FOLDER
		tar xvf $SOURCES_ROOT_DIR/$SRC_COMPRESSED_FILE -C $SOURCES_ROOT_DIR
		cd $SOURCES_ROOT_DIR/$SRC_FOLDER
		build_source_package
		rm -rf $SOURCES_ROOT_DIR/$SRC_FOLDER
		cd $RECIPES_DIR
		echo "$file;$VERSION" >> $INSTALLED_PACKAGES_FILE
	    else
		echo "$file-$VERSION already installed, skipping"
	    fi
	else
	    echo "File $file is not executable or not exists."
	    exit 2
	fi
    done
}
