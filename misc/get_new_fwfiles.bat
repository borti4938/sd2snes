set toRootDir=..
set targetDirName=sd2snes


:: bs-x bin
copy %toRootDir%\bin\bsxpage.bin %targetDirName%\.

:: firmware (run make in src folder in advance)
copy %toRootDir%\src\obj\firmware.img %targetDirName%\.

:: snes menu (run make in snes folder in advance)
copy %toRootDir%\snes\menu.bin %targetDirName%\.


:: FPGA files (generate main.bit files with Xilinx ISE design tools in advanced)
set rle_cmd=%toRootDir%\utils\rle.exe
set verilogDirName=%toRootDir%\verilog\sd2snes
set bitFile=main.bit

%rle_cmd% %verilogDirName%\%bitFile% %targetDirName%\fpga_base.bit
%rle_cmd% %verilogDirName%_cx4\%bitFile% %targetDirName%\fpga_cx4.bit
%rle_cmd% %verilogDirName%_obc1\%bitFile% %targetDirName%\fpga_obc1.bit