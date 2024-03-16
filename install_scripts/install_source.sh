
SOURCES_ROOT_DIR=/sources
RECIPES_DIR=$SCRIPT_PATH/recipes/$FERNINUX_TARGET_ARCH
. $SCRIPT_PATH/packages_index.sh

declare -a build_list=()

function install_package_list() {
    cd $RECIPES_DIR
    for recipe in "${recipes[@]}"
    do
	version=${packages_index[$recipe]}
	package_name=$recipe-$version.sh
	if [ -x "$package_name" ]; then
            . ./"$package_name"
	    if [ $(grep -c "$recipe;$VERSION" $INSTALLED_PACKAGES_FILE) -eq 0 ]; then
		echo "extracting files from $SRC_COMPRESSED_FILE"
		rm -rf $SOURCES_ROOT_DIR/$SRC_FOLDER
		if [[ -v SRC_COMPRESSED_FILE ]]; then
		    tar xvf $SOURCES_ROOT_DIR/$SRC_COMPRESSED_FILE -C $SOURCES_ROOT_DIR
		    cd $SOURCES_ROOT_DIR/$SRC_FOLDER
		fi
		config_source_package
		build_source_package
		install_source_package
		if [[ -v SRC_COMPRESSED_FILE ]]; then
		    rm -rf $SOURCES_ROOT_DIR/$SRC_FOLDER
		    cd $RECIPES_DIR
		fi
		echo "$recipe;$VERSION" >> $INSTALLED_PACKAGES_FILE
	    else
		echo "$recipe-$VERSION already installed, skipping"
	    fi
	else
	    echo "File $file is not executable or not exists."
	    exit 2
	fi
    done
}
