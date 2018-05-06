#!/bin/bash

toRootDir=".."
targetDirName="sd2snes"


# bs-x bin
cp ${toRootDir}/bin/bsxpage.bin ${targetDirName}/.


# firmware (run make in src folder in advance)
cp ${toRootDir}/src/obj/firmware.img ${targetDirName}/.


# snes menu (run make in snes folder in advance)
cp ${toRootDir}/snes/menu.bin ${targetDirName}/.


# FPGA files (generate main.bit files with Xilinx ISE design tools in advanced)
rle_cmd="${toRootDir}/utils/rle"
verilogDirName="${toRootDir}/verilog/sd2snes"
bitFile="main.bit"

${rle_cmd} ${verilogDirName}/${bitFile} ${targetDirName}/fpga_base.bit
${rle_cmd} ${verilogDirName}_cx4/${bitFile} ${targetDirName}/fpga_cx4.bit
${rle_cmd} ${verilogDirName}_obc1/${bitFile} ${targetDirName}/fpga_obc1.bit