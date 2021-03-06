#!/bin/bash
#rm -rf FALCON-integrate

#git clone https://github.com/PacificBiosciences/FALCON-integrate
#cd FALCON-integrate
pwd
ls -l
git submodule
git --version
type module >& /dev/null || . /mnt/software/Modules/current/init/bash
module unload git gcc ccache
module load git/2.8.3
module load gcc/4.9.2
module load ccache/3.2.3
#module load make

set -vex
git --version
which gcc
which g++
gcc --version
# We cannot use /bin/python without /bin/gcc.
export PATH=/mnt/software/a/anaconda2/4.2.0/bin:$PATH
which python

export CCACHE_DIR=/mnt/secondary/Share/tmp/bamboo.mobs.ccachedir

git remote -v
ls -larth
pwd
#git submodule update --init #No! We must use BB for some,
# and rel URLs do not work for file://nothing
env | sort
MY_BRANCH=${bamboo_planRepository_branch}
#git submodule foreach git pull origin ${MY_BRANCH}
git submodule foreach git checkout ${MY_BRANCH}
#git submodule update --init git-sym FALCON-make FALCON-examples
git submodule
./travis.sh
ls -l $HOME/.ccache
cat $HOME/.ccache/ccache.conf
date --utc
