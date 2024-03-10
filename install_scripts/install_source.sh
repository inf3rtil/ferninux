
SOURCES_ROOT_DIR=/sources
RECIPES_DIR=$SCRIPT_PATH/recipes/$FERNINUX_TARGET_ARCH
. $SCRIPT_PATH/packages_index.sh

declare -a build_list=()

function build_package() {
    if [ $(grep -c "$file;$VERSION" $INSTALLED_PACKAGES_FILE) -eq 0 ]; then
	echo "extracting files from $SRC_COMPRESSED_FILE"
	rm -rf $SOURCES_ROOT_DIR/$SRC_FOLDER
	tar xvf $SOURCES_ROOT_DIR/$SRC_COMPRESSED_FILE -C $SOURCES_ROOT_DIR
	cd $SOURCES_ROOT_DIR/$SRC_FOLDER
	config_source_package
	build_source_package
	install_source_package
	rm -rf $SOURCES_ROOT_DIR/$SRC_FOLDER
	cd $RECIPES_DIR
	echo "$file;$VERSION" >> $INSTALLED_PACKAGES_FILE
    else
	echo "$file-$VERSION already installed, skipping"
    fi
}	    


function install_package_list() {
    cd $RECIPES_DIR
    for recipe in "${recipes[@]}"
    do
	version=${packages_index[$recipe]}
	package_name=$recipe-$version.sh
	if [ -x "$package_name" ]; then
            . ./"$package_name"
	    build_package
	else
	    echo "File $file is not executable or not exists."
	    exit 2
	fi
    done
}
