@ECHO OFF
title FindGW v2.0 by AKokarev (https://github.com/akokarev/FindGW)
echo.
echo FindGW v2.0 by AKokarev (https://github.com/akokarev/FindGW)
echo. 
echo Pered zapuskom prover'te znacheniya peremennih:
echo a - pervaya cifra ip
echo b - vtoraya cifra ip
echo start_c, end_c - diapazon proverki tret'ey cifri ip
echo start_d, end_d - diapazon proverki chetvertoy cifri ip
echo host - ip adress dlya proverki interneta, poumolchaniyu eto google-dns = 8.8.4.4
echo delay - vremya ozhidaniya hosta, poumolchaniyu = 400, men'she - bistree, bol'she - nadezhnee
echo mydir - directoriya dlya fayla gw2.txt
echo.
echo Tekushie nastroyki:


set a=10
set b=110
set start_c=0
set end_c=255
set start_d=0
set end_d=255

set host=8.8.4.4
set delay=400

set mydir=%0%
set mydir=%mydir:FindGW2.cmd=%

echo a=%a%
echo b=%b%
echo Scan IP array: %a%.%b%.[%start_c%-%end_c%].[%start_d%-%end_d%]
echo host=%host%
echo delay=%delay%
echo dir=%mydir%
echo.
echo Dlya vihoda najmite CTRL+C ili zakroyte okno
pause

echo.&&echo.&&echo ================================================================================
echo VNIMANIE!!! WARNING!!! AHTUNG!!!
echo Pri rabotayushem internete FindGW2 mojet sobrat' mnogo nepravil'nih shluzov!
echo Dlya luchego rezultata otkluchites' ot interneta!
echo Esli u vas WiFi router, to vkluchite internet kabel' v komputer, otkluchite router iz rozetki.
echo ================================================================================&&echo.&&echo.
pause

cls
echo FindGW v2.0 by AKokarev (mailto:FindGW@ogurcom.ru https://github.com/akokarev/FindGW)

cd %mydir%
echo FindGW v2.0 by AKokarev (mailto:FindGW@ogurcom.ru https://github.com/akokarev/FindGW) > gw2.txt

route -4 ADD %host% %a%.%b%.0.1>nul

for /L %%c in (%start_c%,1,%end_c%) do for /L %%d in (%start_d%,1,%end_d%) do (echo TRY %a%.%b%.%%c.%%d&&route DELETE %host%>nul&&route -4 ADD %host% %a%.%b%.%%c.%%d METRIC 1 >nul&&ping %host% -n 1 -w %delay%|find "TTL"&&echo %a%.%b%.%%c.%%d >> gw2.txt)

route delete %host%>nul

echo DONE.
pause
@ECHO ON
