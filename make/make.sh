#!/bin/bash

BUILD_DIR="../builds/"
RENDER_DIR="../renders/"

rm $BUILD_DIR -rf
mkdir $BUILD_DIR

for file in $(ls $RENDER_DIR/*.scad); do
    file=$(basename $file)
    openscad $RENDER_DIR/$file -o $BUILD_DIR/$file.stl
    openscad $RENDER_DIR/$file -o $BUILD_DIR/$file.dxf
done
