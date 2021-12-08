#!/bin/bash

VERS=9

#Make sure modules are set for intel
source /etc/profile.d/modules.sh
module purge
module load icc/2021.4.0
module load openmpi/4.1.2/icc-2021.4.0

git clone https://github.com/OpenFOAM/OpenFOAM-9.git
git clone https://github.com/OpenFOAM/ThirdParty-9.git

# Set prefs/paths for openmpi for OpenFOAM
cp prefs.${VERS}.sh OpenFOAM-${VERS}/etc/prefs.sh
chmod 644 OpenFOAM-${VERS}/etc/prefs.sh

# source bashrc
source OpenFOAM-${VERS}/etc/bashrc

# Make ThirdParty
cd ThirdParty-${VERS} && ./Allwmake
wmRefresh
cd ../

# build OpenFOAM
cd OpenFOAM-${VERS} && ./Allwmake -j

