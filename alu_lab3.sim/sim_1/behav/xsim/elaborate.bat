@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.1 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Mon Nov 09 20:15:43 -0500 2020
REM SW Build 2902540 on Wed May 27 19:54:49 MDT 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto fec12dec64b247a6a71c9d3978da08e8 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Circuito_TB_behav xil_defaultlib.Circuito_TB -log elaborate.log"
call xelab  -wto fec12dec64b247a6a71c9d3978da08e8 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Circuito_TB_behav xil_defaultlib.Circuito_TB -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
