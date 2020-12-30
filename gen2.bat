REM Automatically generated batch file to generate compiler and project configurations for PC-lint Plus

REM Temporary filename for imposter log
SET "IMPOSTER_LOG=C:\Users\13706\AppData\Local\Temp\tmp1A56.tmp"
REM Clear temporary file
BREAK > "%IMPOSTER_LOG%"
REM Activate Visual Studio developer tools environment
CALL "D:\software\VS14.0\\VC\vcvarsall.bat" amd64
@echo on
REM Set path to cl.exe
FOR /F "tokens=* USEBACKQ" %%F IN (`where cl`) DO (SET "PCLP_CFG_CL_PATH=%%F" & GOTO AFTER_FIRST_CL)
:AFTER_FIRST_CL
REM Generate compiler configuration
python "D:\software\PC-lint\windows\config\pclp_config.py" --compiler=vs2015_64 --compiler-bin="%PCLP_CFG_CL_PATH%" --config-output-lnt-file="E:\C++test\ConsoleApplication1\compiler2.lnt" --config-output-header-file="E:\C++test\ConsoleApplication1\compiler2.h" --generate-compiler-config
REM build imposter.c
cl "/FeD:\software\PC-lint\windows\config\\" "D:\software\PC-lint\windows\config\imposter.c"
REM generate project configuration
msbuild "E:\C++test\ConsoleApplication1\ConsoleApplication1\ConsoleApplication1.vcxproj" /t:clean
SET IMPOSTER_MODULES_IN_WORKING_DIR=1
SET "IMPOSTER_COMPILER=%PCLP_CFG_CL_PATH%"
REM Clear temporary file
BREAK > "%IMPOSTER_LOG%"
msbuild "E:\C++test\ConsoleApplication1\ConsoleApplication1\ConsoleApplication1.vcxproj" /p:CLToolEXE=imposter.exe /p:CLToolPath="D:\software\PC-lint\windows\config"
python "D:\software\PC-lint\windows\config\pclp_config.py" --compiler=vs2015_64 --imposter-file="%IMPOSTER_LOG%" --config-output-lnt-file="E:\C++test\ConsoleApplication1\pro2.lnt" --generate-project-config
REM done

