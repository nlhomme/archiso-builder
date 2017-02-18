#!/bin/sh

#Placing terminal to the starting folder
cd /root/

#Ask the user where are the archiso files
echo "Type the repo URL where the archiso files are, followed by [ENTER]"
echo "Example: https://github.com/nlhomme/lhoslite"
read repository

#Clone the lhos repo
git clone $repository

#Go to this new working folder
cd $(ls|grep -Ev 'buildscript.sh')

#Run the script to build the ISO
./build.sh -v

#Move the final ISO to /tmp to be accessible from the host
mv out/*.iso /tmp
