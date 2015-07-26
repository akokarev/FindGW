@ECHO OFF
title FindGW v2.1 by AKokarev (mailto:FindGW@ogurcom.ru https://github.com/akokarev/FindGW)
echo.

set mydir=%~dp0%

if "%1"=="" goto error

set i=%1%
shift
set a=%1%
shift
set b=%1%
shift
set start_c=%1%
shift
set end_c=%1%
shift
set start_d=%1%
shift
set end_d=%1%
shift
set host=%1%
shift
set delay=%1%
shift
set mydir=%1%

cd %mydir%
title [%i%\%host%]FindGWv2.1 
echo a=%a%
echo b=%b%
echo Scan IP array: %a%.%b%.[%start_c%-%end_c%].[%start_d%-%end_d%]
echo host: %host%
echo delay=%delay%
echo dir=%mydir%
timeout 3
route -4 ADD %host% %a%.%b%.%end_c%.%end_d% METRIC 1>nul
for /L %%c in (%start_c%,1,%end_c%) do for /L %%d in (%start_d%,1,%end_d%) do (echo TRY %a%.%b%.%%c.%%d&route DELETE %host%>nul&route -4 ADD %host% %a%.%b%.%%c.%%d METRIC 1>nul&ping %host% -n 1 -w %delay%|find "TTL"&&echo %a%.%b%.%%c.%%d>>gw2_1.txt)
route delete %host%>nul
echo DONE.
timeout 5
goto end

:error
echo Dlya zapuska ispol'zuyte StarterFindGW.cmd!
cd %mydir%
timeout 5
echo.
call %mydir%\StarterFindGW2_1.cmd
goto end

:end
exit
