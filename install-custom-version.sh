#!/bin/bash

TMPDIR=/tmp/AutoRaise
INSTALLDIR=/opt/homebrew/opt/autoraise/bin/

mkdir -p $TMPDIR && \
echo "Created a temporal directory $TMPDIR" && \
cd $TMPDIR && \
git clone git@github.com:brisbanewebdeveloper/AutoRaise.git --single-branch -b latest . && \
make clean && make CXXFLAGS=-DALTERNATIVE_TASK_SWITCHER && \
echo "Overwritting the existing version in $INSTALLDIR" && \
echo "(You are going to be asked your login password)" && \
chmod 555 AutoRaise && \
sudo ditto AutoRaise $INSTALLDIR && \
cd - && \
rm -fr $TMPDIR && \
echo "Removed the temporal directory $TMPDIR" && \
brew services restart autoraise && \
echo "All Done!"
