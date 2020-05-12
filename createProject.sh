#!/bin/bash

set -e

if [[ "$#" -ne 2 ]]; 
    then echo "Usage: createProject.sh subdir prjname"
         echo "       where subdir is a subdirectory of the localdirectory"
    exit
fi


SKEL_SCRIPT="$(realpath "$0")/"
SKEL_DIR=$(dirname "$SKEL_SCRIPT")
pushd .
DEST_DIR="$(pwd)/"$1""
cd $SKEL_DIR

if [[ -e "$DEST_DIR" ]];
    then echo "Destinantion Path Exist: aborting"
    exit
fi    



find . | grep -v .git | grep -v createProject.sh | grep -v .vscode | cpio -pmd $DEST_DIR

cd $DEST_DIR

sed -i "s/SKEL_PROJECT/$2_prj/g" "CMakeLists.txt"
sed -i "s/SKEL_EXECUTABLE/$2/g" "CMakeLists.txt"
cd src
sed -i "s/SKEL_EXECUTABLE/$2/g" "CMakeLists.txt"

popd

 