FROM centos:7
MAINTAINER Bill.Conn@usd.edu

# Set up OneAPI repo for Intel Compiler
COPY oneAPI.repo /etc/yum.repos.d/oneAPI.repo
RUN rpm --import https://yum.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB

# Install Dev tools and packages we need to build OpenFOAM
# yum complains about group installs unless you do this
RUN yum groups -y mark convert 
RUN yum group install -y "Development Tools" && yum clean all
RUN yum install -y intel-hpckit environment-modules tcl git python3-devel && yum clean all

# Make intel modules
RUN /opt/intel/oneapi/modulefiles-setup.sh --force --output-dir=/etc/modulefiles

# Get and build OpenMPI 
ADD https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.2.tar.gz /tmp
RUN source /etc/profile.d/modules.sh && module load icc/2021.4.0 && cd /tmp && tar xf openmpi-4.1.2.tar.gz && cd openmpi-4.1.2 && ./configure --prefix=/opt/openmpi-4.1.2/icc/2021.4.0 && make && make install

# Copy in the module file
COPY openmpi-4.1.1.modulefile /etc/modulefiles/openmpi/4.1.2/icc-2021.4.0

# Add build files
RUN mkdir -p /opt/OpenFOAM/
COPY build-openfoam-9.sh /opt/OpenFOAM/
COPY prefs.9.sh /opt/OpenFOAM/

# Do Build
WORKDIR /opt/OpenFOAM
RUN bash build-openfoam-9.sh
