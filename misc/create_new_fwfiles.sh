#!/bin/bash

toRootDir=".."
targetDirName="sd2snes"

mkdir ${targetDirName}


# bs-x bin
cp ${toRootDir}/bin/bsxpage.bin ${targetDirName}/.


# FPGA files (generate main.bit files with Xilinx ISE design tools in advanced)
utilsDirName="${toRootDir}/utils"
rm -f ${utilsDirName}/rle

gcc -o ${utilsDirName}/rle ${utilsDirName}/rle.c

rle_cmd="${utilsDirName}/rle"
verilogDirName="${toRootDir}/verilog/sd2snes"
bitFile="main.bit"

${rle_cmd} ${verilogDirName}/${bitFile} ${targetDirName}/fpga_base.bit
${rle_cmd} ${verilogDirName}_cx4/${bitFile} ${targetDirName}/fpga_cx4.bit
${rle_cmd} ${verilogDirName}_obc1/${bitFile} ${targetDirName}/fpga_obc1.bit
${rle_cmd} ${verilogDirName}_gsu/${bitFile} ${targetDirName}/fpga_gsu.bit


# firmware
srcDirName="${toRootDir}/src"

make -C ${srcDirName}/utils
make clean -C ${srcDirName}
make -C ${srcDirName}

cp ${srcDirName}/obj/firmware.img ${targetDirName}/.


# snes menu
snesDirName="${toRootDir}/snes"

make clean -C ${srcDirName}
make -C ${snesDirName}

cp ${snesDirName}/menu.bin ${targetDirName}/.