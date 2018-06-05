set toRootDir=..
set targetDirName=sd2snes

mkdir %targetDirName%


:: bs-x bin
copy %toRootDir%\bin\bsxpage.bin %targetDirName%\.


:: FPGA files (generate main.bit files with Xilinx ISE design tools in advanced)
set utilsDirName=%toRootDir%\utils
del /f %utilsDirName%\rle.exe

gcc -o %utilsDirName%\rle %utilsDirName%\rle.c

set rle_cmd=%toRootDir%\utils\rle.exe
set verilogDirName=%toRootDir%\verilog\sd2snes
set bitFile=main.bit

%rle_cmd% %verilogDirName%\%bitFile% %targetDirName%\fpga_base.bit
%rle_cmd% %verilogDirName%_cx4\%bitFile% %targetDirName%\fpga_cx4.bit
%rle_cmd% %verilogDirName%_obc1\%bitFile% %targetDirName%\fpga_obc1.bit
%rle_cmd% %verilogDirName%_gsu\%bitFile% %targetDirName%\fpga_gsu.bit


:: firmware
set srcDirName=%toRootDir%\src

make -C %srcDirName%\utils
make clean -C %srcDirName%
make -C %srcDirName%

copy %srcDirName%\obj\firmware.img %targetDirName%\.


:: snes menu
set snesDirName=%toRootDir%\snes

make clean -C %srcDirName%
make -C %snesDirName%

copy %snesDirName%\menu.bin %targetDirName%\.