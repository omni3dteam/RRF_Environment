SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo $SCRIPT_DIR

mkdir -p firmware_1.0-1_arm64/opt/dsf/sd/omni_firmware
cp ../OmniRRF3/Duet3_MB6XD/Duet3Firmware_MB6XD.bin     opt/dsf/sd/omni_firmware/
cp ../Duet3Expansion/TOOL1LC/Duet3Firmware_TOOL1LC.bin opt/dsf/sd/omni_firmware/

cd rfid_middleware_1.1-1_arm64
DIR_NAME=$(basename $PWD)
echo $DIR_NAME
cd ..

dpkg-deb --build --root-owner-group $DIR_NAME 
cd $SCRIPT_DIR
rm -r rfid_middleware_1.1-1_arm64/opt
