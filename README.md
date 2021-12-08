Reproducable build error with intel compiler for OpenFOAM 9
===========================================================

## Info

I've put together a Dockerfile and a couple of scripts based on how we build 
OpenFOAM for our cluster.

This will build a centos7 docker image with everything needed to build
OpenFOAM 9 which includes Intel's oneAPI compiler and compiled version of
OpenMPI compiled with with icc.

Then the build script loads up the environment to build ThirdParty and
OpenFOAM, and builds them.

Note: this produces large docker images (thought I felt the reproducability
was worth it).  My docker images end up around 23 GB.

## Instructions

build the dockerfile: `docker build -t openfoam-9 .`

Wait a while for it to spit out an error to console when it's compiling
OpenFOAM.

## Error

```
icpc -std=c++14 -fp-trap=common -fp-model precise -Dlinux64 -DWM_ARCH_OPTION=64 -DWM_DP -DWM_LABEL_SIZE=32 -Wall -Wextra -Wnon-virtual-dtor -Wno-unused-parameter -Wno-invalid-offsetof -diag-disable 327,654,1125,1292,2289,2304,11062,11074,11076 -O3  -DNoRepository -I/opt/OpenFOAM/OpenFOAM-9/platforms/linux64IccDPInt32Opt/src/OpenFOAM -IlnInclude -I. -I/opt/OpenFOAM/OpenFOAM-9/src/OpenFOAM/lnInclude -I/opt/OpenFOAM/OpenFOAM-9/src/OSspecific/POSIX/lnInclude   -fPIC -c global/fileOperations/uncollatedFileOperation/uncollatedFileOperation.C -o /opt/OpenFOAM/OpenFOAM-9/platforms/linux64IccDPInt32Opt/src/OpenFOAM/global/fileOperations/uncollatedFileOperation/uncollatedFileOperation.o
global/fileOperations/uncollatedFileOperation/uncollatedFileOperation.C(665): error: namespace "std" has no member "underlying_type_t"
              std::underlying_type_t<IOstream::streamFormat> formatValue(format);
                   ^

global/fileOperations/uncollatedFileOperation/uncollatedFileOperation.C(665): error: type name is not allowed
              std::underlying_type_t<IOstream::streamFormat> formatValue(format);
                                     ^

global/fileOperations/uncollatedFileOperation/uncollatedFileOperation.C(665): error: identifier "formatValue" is undefined
              std::underlying_type_t<IOstream::streamFormat> formatValue(format);
                                                             ^

global/fileOperations/uncollatedFileOperation/uncollatedFileOperation.C(667): error: invalid type conversion: "<error-type> (*)(...)" to "Foam::IOstream::streamFormat"
              format = IOstream::streamFormat(formatValue);
                       ^

compilation aborted for global/fileOperations/uncollatedFileOperation/uncollatedFileOperation.C (code 2)
make: *** [/opt/OpenFOAM/OpenFOAM-9/platforms/linux64IccDPInt32Opt/src/OpenFOAM/global/fileOperations/uncollatedFileOperation/uncollatedFileOperation.o] Error 2
make: *** Waiting for unfinished jobs....
```
