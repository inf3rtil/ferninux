#!/bin/bash

set -e

RECIPES_DIR=/foo
delacre -a recipes=()

cd $RECIPES_DIR

for file in "${recipes[@]}"
do
    cp $WORK_DIR/util/template_recipe.sh "$file.sh"
    chmod a+x "$file.sh"
done
