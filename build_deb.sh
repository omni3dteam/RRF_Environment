#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo $SCRIPT_DIR

PACKAGE_NAME="omnirrf_3.6.0-1.0_arm64"
echo $PACKAGE_NAME

mkdir -p $PACKAGE_NAME/opt/dsf/sd/firmware_omni
cp bin/* $PACKAGE_NAME/opt/dsf/sd/firmware_omni

cd $PACKAGE_NAME
DIR_NAME=$(basename $PWD)
echo $DIR_NAME
cd ..

dpkg-deb --build --root-owner-group $DIR_NAME 
rm -r $PACKAGE_NAME/opt/dsf/sd/firmware_omni

cd $SCRIPT_DIR
