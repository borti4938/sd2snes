#!/bin/bash


# set directories
toRootDir=".."
targetDirName="sd2snes"
binDirName="${toRootDir}/bin"
utilsDirName="${toRootDir}/utils"
snesDirName="${toRootDir}/snes"
srcDirName="${toRootDir}/src"
verilogDirName="${toRootDir}/verilog/sd2snes"


# make target directory
mkdir ${targetDirName}


# bs-x bin (and others)
cp ${binDirName}/*.bin ${targetDirName}/.


# FPGA files (generate main.bit files with Xilinx ISE design tools in advanced)
rm -f ${utilsDirName}/rle

gcc -o ${utilsDirName}/rle ${utilsDirName}/rle.c

rle_cmd="${utilsDirName}/rle"
bitFile="main.bit"

${rle_cmd} ${verilogDirName}/${bitFile} ${targetDirName}/fpga_base.bit
${rle_cmd} ${verilogDirName}_cx4/${bitFile} ${targetDirName}/fpga_cx4.bit
${rle_cmd} ${verilogDirName}_obc1/${bitFile} ${targetDirName}/fpga_obc1.bit
${rle_cmd} ${verilogDirName}_gsu/${bitFile} ${targetDirName}/fpga_gsu.bit
${rle_cmd} ${verilogDirName}_sa1/${bitFile} ${targetDirName}/fpga_sa1.bit
${rle_cmd} ${verilogDirName}_sdd1/${bitFile} ${targetDirName}/fpga_sdd1.bit


# firmware
make -C ${srcDirName}/utils
make clean -C ${srcDirName}
make -C ${srcDirName}

cp ${srcDirName}/obj/firmware.img ${targetDirName}/.


# snes menu
make clean -C ${srcDirName}
make -C ${snesDirName}

cp ${snesDirName}/menu.bin ${targetDirName}/.
