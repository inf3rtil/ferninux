
SOURCES_ROOT_DIR=/sources
RECIPES_DIR=$SCRIPT_PATH/recipes/$FERNINUX_TARGET_ARCH

#TODO: get version from recipes
#TODO: reinstall flag

function install_package_list() {
    cd $RECIPES_DIR
    for recipe in "${recipes[@]}"
    do
        . ./"$recipe.sh"
	if [ $(grep -c "$recipe" $INSTALLED_PACKAGES_FILE) -eq 0 ]; then
	    src_folder=$(tar tf $SOURCES_ROOT_DIR/$SRC_COMPRESSED_FILE | head -1 | sed -e 's/\/.*//')
	    echo "extracting files from $SRC_COMPRESSED_FILE"
	    rm -rf $SOURCES_ROOT_DIR/$src_folder
	    if [[ -v SRC_COMPRESSED_FILE ]]; then
		tar xvf $SOURCES_ROOT_DIR/$SRC_COMPRESSED_FILE -C $SOURCES_ROOT_DIR
		cd $SOURCES_ROOT_DIR/$src_folder
	    fi
	    config_source_package
	    build_source_package
	    install_source_package
	    if [[ -v SRC_COMPRESSED_FILE ]]; then
		rm -rf $SOURCES_ROOT_DIR/$src_folder
		cd $RECIPES_DIR
	    fi
	    echo "$recipe" >> $INSTALLED_PACKAGES_FILE
	else
	    echo "$recipe already installed, skipping"
	fi
    done
}
