
SOURCES_ROOT_DIR=/sources
RECIPES_DIR=$SCRIPT_PATH/recipes/$FERNINUX_TARGET_ARCH

#TODO: get version from recipes
#TODO: reinstall flag

if [ ! -f $INSTALLED_PACKAGES_FILE ]; then
   touch $INSTALLED_PACKAGES_FILE
fi

function install_package_list() {
    cd $RECIPES_DIR
    for recipe in "${recipes[@]}"
    do
        . ./"$recipe.sh"
	if [ $(grep -c "$recipe" $INSTALLED_PACKAGES_FILE) -eq 0 ]; then
	    if [[ -v SRC_COMPRESSED_FILE ]]; then
		pushd $SOURCES_ROOT_DIR
		src_folder=$(tar tf $SRC_COMPRESSED_FILE | head -1 | sed -e 's/\/.*//')
		echo "extracting files from $SRC_COMPRESSED_FILE"
		rm -rf $src_folder
		tar xvf $SRC_COMPRESSED_FILE
		cd $src_folder
	    fi
	    config_source_package
	    build_source_package
	    install_source_package
	    if [[ -v SRC_COMPRESSED_FILE ]]; then
		rm -rf $src_folder
		popd
	    fi
	    echo "$recipe" >> $INSTALLED_PACKAGES_FILE
	else
	    echo "$recipe already installed, skipping"
	fi
    done
}
