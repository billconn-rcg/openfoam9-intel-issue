#----------------------------------*-sh-*--------------------------------------
# =========                 |
# \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox
#  \\    /   O peration     | Website:  https://openfoam.org
#   \\  /    A nd           | Copyright (C) 2011-2018 OpenFOAM Foundation
#    \\/     M anipulation  |
#------------------------------------------------------------------------------
# License
#     This file is part of OpenFOAM.
#
#     OpenFOAM is free software: you can redistribute it and/or modify it
#     under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     OpenFOAM is distributed in the hope that it will be useful, but WITHOUT
#     ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#     FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
#     for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with OpenFOAM.  If not, see <http://www.gnu.org/licenses/>.
#
# File
#     config.sh/example/prefs.sh
#
# Description
#     Preset variables for the OpenFOAM configuration - POSIX shell syntax.
#
#     The prefs.sh file will be sourced by the OpenFOAM etc/bashrc when it is
#     found by foamEtcFile.
#
# See also
#     'foamEtcFile -help' or 'foamEtcFile -list' for information about the
#     paths searched
#
#------------------------------------------------------------------------------

## Specify OpenFOAM ThirdParty compiler
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#WM_COMPILER_TYPE=ThirdParty

## Specify compiler type
## ~~~~~~~~~~~~~~~~~~~~~
export WM_COMPILER=Icc

## Specify system openmpi
## ~~~~~~~~~~~~~~~~~~~~~~
export WM_MPLIB=SYSTEMOPENMPI
export MPI_ROOT=/opt/openmpi-4.1.2/icc/2021.4.0

## Specify path
## ~~~~~~~~~~~~~~~~~~~~~
export FOAM_INST_DIR=/opt/$WM_PROJECT

#------------------------------------------------------------------------------

