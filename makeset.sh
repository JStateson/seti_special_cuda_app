#!/bin/bash
# josephy@stateson.net for comments
# place this bash script in the client folder of Tbar's Xbranch
# this script uses your defined folder locations to create  "setvars.sh"
# setvars.sh first renames the Makefile to Makefile.bu then sets your locations into it
# first run "setvars.sh" then run "make" to build the 10.2 libraries
# edit the following two lines to locate your own folders
BOINCDIR="/home/jstateson/Projects/BoincMasterSlave"
SETI_DIR="/home/jstateson/Projects/Xbranch"
echo "\
#!/bin/bash
FILE=Makefile.bu
if [ ! -f "$FILE" ]; then
  cp Makefile Makefile.bu
fi
sed 's=/home/tbar/boinc/="$BOINCDIR"/=g' Makefile.bu | \
	sed 's=/home/tbar/boinc="$BOINCDIR"=g' | \
	sed 's=/home/tbar/sah_v7_opt/Xbranch="$SETI_DIR"=g' | \
	sed 's/CUDA_VERSION = 101/CUDA_VERSON = 102/=g' | \
	sed 's/cuda-10.1/cuda-10.2/g' > Makefile
" > setvars.sh
chmod +x setvars.sh

