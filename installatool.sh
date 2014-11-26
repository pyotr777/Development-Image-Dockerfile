#!/bin/bash

# installatool.sh
#
# Install Omni XMP suite
# Adopted for Ubuntu 14.04 trusty in Docker 1.1 container
# 
#
# Created by Bryzgalov Peter
# Copyright (c) 2014 RIKEN AICS. All rights reserved.

echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe" >> /etc/apt/sources.list
apt-get update
apt-get -y install build-essential
apt-get install g++

echo -e "\n\nPrepare for Java\n"
sleep 2
apt-get -y install python-software-properties
apt-get -y install software-properties-common
# apt-add-repository -y ppa:webupd8team/java
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections


echo -e "\n\nInstalling Java 7\n"
sleep 2
apt-get -y install oracle-java7-installer
java -version

echo -e "\n\nInstall ant, libxml2 & g++\n"
sleep 1
apt-get -y install ant
apt-get -y install libxml2-dev
apt-get -y install g++

echo -e "\n\ninstall make\n"
sleep 1
apt-get -y install make

# (byacc not available in Ubuntu "saucy")
echo -e "\n\nInstall byacc\n"
sleep 1
apt-get -y install byacc
#mkdir byacc
#cd byacc
#wget http://invisible-island.net/datafiles/release/byacc.tar.gz
#gzip -dc < byacc.tar.gz | tar -xf -
#cd byacc-20130925
#./configure
#make
#make install
#cd ../..


echo -e "\n\nInstall bzip, flex, bison, gfortran \n"
sleep 2
apt-get -y install bzip2
apt-get -y install flex
apt-get -y install bison
apt-get -y install gfortran
#apt-get -y install mpich2



# install openMPI
echo -e "\n\nInstall openMPI\n"
sleep 2
apt-get -y install openmpi-bin openmpi-dev libopenmpi-dev

#mkdir openmpi
#cd openmpi
#wget http://www.open-mpi.org/software/ompi/v1.6/downloads/openmpi-1.6.5.tar.gz
#tar xzvf openmpi-1.6.5.tar.gz
#cd openmpi-1.6.5
#mkdir -p /usr/lib/openmpi
#./configure --prefix=/usr/lib/openmpi
#make
#make install
#cd ../..


# install omnixmp
echo -e "\n\nInstall omnixmp\n. . . . . . . . \n"
sleep 3
cd /tmp
#wget http://downloads.sourceforge.net/project/xcalablemp/omnixmp-0.6.1.tar.bz2
#tar -xjf omnixmp-0.6.1.tar.bz2
#cd omnixmp-0.6.1
wget http://downloads.sourceforge.net/project/xcalablemp/omnixmp-0.8.0.tar.bz2
tar -xjf omnixmp-0.8.0.tar.bz2
cd omnixmp-0.8.0
./configure --prefix=/opt/omnixmp
make
make install
cd ..

echo -e "\n\n\n------------\nInstall atool\n------------\n"
sleep 3
wget http://www.aics.riken.jp/ungi/soft/kscope/dist/atool.tgz
tar -zxf atool.tgz
cd tool
./configure --prefix=/opt/omnixmp
make
make install
cd ..

export PATH=$PATH:/opt/omnixmp/bin
echo "export PATH=$PATH:/opt/omnixmp/bin" > /etc/profile.d/omnipath.sh

