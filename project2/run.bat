@echo off
setlocal

if "%~1"=="" (
    echo Usage: run.bat ^<module_name^>
    echo Example: run.bat counter4
    exit /b 1
)

set NAME=%~1

echo.
echo === Compiling RTL: rtl\%NAME%.vhd ===
ghdl -a --std=08 "rtl\%NAME%.vhd"
if errorlevel 1 (
    echo.
    echo ERROR: Failed to compile RTL.
    exit /b 1
)

echo.
echo === Compiling testbench: tb\%NAME%_tb.vhd ===
ghdl -a --std=08 "tb\%NAME%_tb.vhd"
if errorlevel 1 (
    echo.
    echo ERROR: Failed to compile testbench.
    exit /b 1
)

echo.
echo === Elaborating: %NAME%_tb ===
ghdl -e --std=08 "%NAME%_tb"
if errorlevel 1 (
    echo.
    echo ERROR: Failed to elaborate testbench.
    exit /b 1
)

if not exist "sim" mkdir "sim"

echo.
echo === Running simulation ===
ghdl -r --std=08 "%NAME%_tb" --vcd="sim\%NAME%.vcd"
if errorlevel 1 (
    echo.
    echo ERROR: Simulation failed.
    exit /b 1
)

echo.
echo === Simulation successful ===
echo VCD: sim\%NAME%.vcd
echo.

gtkwave "sim\%NAME%.vcd"

endlocal