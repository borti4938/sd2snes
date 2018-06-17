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


:: bs-x binary (and others)
copy %binDirName%\*.bin %targetDirName%\.


:: firmware (run make in src folder in advance)
copy %srcDirName%\obj\firmware.img %targetDirName%\.


:: snes menu (run make in snes folder in advance)
copy %snesDirName%\menu.bin %targetDirName%\.


:: FPGA files (generate main.bit files with Xilinx ISE design tools in advanced)
set rle_cmd=%utilsDirName%\rle.exe
set bitFile=main.bit

%rle_cmd% %verilogDirName%\%bitFile% %targetDirName%\fpga_base.bit
%rle_cmd% %verilogDirName%_cx4\%bitFile% %targetDirName%\fpga_cx4.bit
%rle_cmd% %verilogDirName%_obc1\%bitFile% %targetDirName%\fpga_obc1.bit
%rle_cmd% %verilogDirName%_gsu\%bitFile% %targetDirName%\fpga_gsu.bit
