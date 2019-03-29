:: set directories
set toRootDir=..
set targetDirName=sd2snes
set binDirName=%toRootDir%\bin
set utilsDirName=%toRootDir%\utils
set snesDirName=%toRootDir%\snes
set srcDirName=%toRootDir%\src
set verilogDirName=%toRootDir%\verilog\sd2snes


:: make target directory
mkdir %targetDirName%


:: bs-x binary and (and others)
copy %binDirName%\*.bin %targetDirName%\.


:: FPGA files (generate main.bit files with Xilinx ISE design tools in advanced)
del /f %utilsDirName%\rle.exe

gcc -o %utilsDirName%\rle %utilsDirName%\rle.c

set rle_cmd=%utilsDirName%\rle.exe
set bitFile=main.bit

%rle_cmd% %verilogDirName%\%bitFile% %targetDirName%\fpga_base.bit
%rle_cmd% %verilogDirName%_cx4\%bitFile% %targetDirName%\fpga_cx4.bit
%rle_cmd% %verilogDirName%_obc1\%bitFile% %targetDirName%\fpga_obc1.bit
%rle_cmd% %verilogDirName%_gsu\%bitFile% %targetDirName%\fpga_gsu.bit
%rle_cmd% %verilogDirName%_sa1\%bitFile% %targetDirName%\fpga_sa1.bit
%rle_cmd% %verilogDirName%_sdd1\%bitFile% %targetDirName%\fpga_sdd1.bit


:: firmware
make -C %srcDirName%\utils
make clean -C %srcDirName%
make -C %srcDirName%

copy %srcDirName%\obj\firmware.img %targetDirName%\.


:: snes menu
make clean -C %srcDirName%
make -C %snesDirName%

copy %snesDirName%\menu.bin %targetDirName%\.
