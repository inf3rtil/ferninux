# Project spec
Create a didatic full Linux distro for use in virtual and physical machines 
Work concepts based on Linux from scratch, Slackware, Gentoo and many other systems

# TODO
- [ ] Isolated virtual disk for system
- [ ] Isolated env for build
- [ ] Base system, with small package set
- [ ] Flexible source download and manager system
- [ ] Recipe system for build packages

# Environment
 - Raw disk image created with dd
 - Mounted as loop device
 - Ready to run with qemu or copied to disk after build done

# Software recipes
organized by subprojects, each subproject has a master script that contains a list of all recipes to build
 - Cross toolchain
 - Basic system
 - General software, divided by categories
 
 path format: subproject/recipes/arch/optional_category/software-version.sh

## Recipe metadata
 - download urls
 - md5 checksums
 - compressed file
 - src folder
 
## Recipe functions
 - config
 - build
 - test
 - install
 
# Downloads
 - Extract urls from recipes to generate download list
 
