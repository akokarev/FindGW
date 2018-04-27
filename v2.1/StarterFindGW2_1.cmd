@ECHO OFF
title Starter FindGW v2.1 by AKokarev (mailto:FindGW@ogurcom.ru https://github.com/akokarev/FindGW)
echo.
echo FindGW v2.1 by AKokarev (mailto:FindGW@ogurcom.ru https://github.com/akokarev/FindGW)
echo. 
echo Pered zapuskom prover'te znacheniya peremennih:
echo a - pervaya cifra ip
echo b - vtoraya cifra ip
echo start_c, end_c - diapazon proverki tret'ey cifri ip
echo start_d, end_d - diapazon proverki chetvertoy cifri ip
echo v versii FindGW 2.1 diapazon start_d-end_d zamenen dlya kazhdogo hosta
echo host1-10 - ip adressa dlya proverki interneta, poumolchaniyu eto 8.8.4.4, 8.8.8.8, 213.180.204.213, 93.158.134.21, 77.88.8.8, 93.158.134.3, 93.158.134.11, 93.158.134.1
echo Na vsyakiy sluchay proverte ping do etih hostov!
echo delay - vremya ozhidaniya hosta, poumolchaniyu = 400, men'she - bistree, bol'she - nadezhnee
echo mydir - directoriya dlya fayla gw2.txt
echo.
echo Tekushie nastroyki:


set a=10
set b=110
set start_c=0
set end_c=255

set host1=8.8.4.4
set host2=8.8.8.8
set host3=213.180.204.213
set host4=93.158.134.21
set host5=77.88.8.8
set host6=93.158.134.3
set host7=93.158.134.11
set host8=93.158.134.1

set delay=400

set mydir=%~dp0%

echo a=%a%
echo b=%b%
echo Scan IP array: %a%.%b%.[%start_c%-%end_c%].[%start_d%-%end_d%]
echo hosts: %host1%, %host2%, %host3%, %host4%, %host5%, %host6%, %host7%, %host8%
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
cd %mydir%

echo FindGW v2.0 by AKokarev (mailto:FindGW@ogurcom.ru https://github.com/akokarev/FindGW)
echo FindGW v2.0 by AKokarev (mailto:FindGW@ogurcom.ru https://github.com/akokarev/FindGW) > gw2_1.txt


start call FindGW2_1.cmd 1 %a% %b% %start_c% %end_c% 0 31 %host1% %delay% %mydir%&timeout 3
start call FindGW2_1.cmd 2 %a% %b% %start_c% %end_c% 32 63 %host2% %delay% %mydir%&timeout 3
start call FindGW2_1.cmd 3 %a% %b% %start_c% %end_c% 64 95 %host3% %delay% %mydir%&timeout 3
start call FindGW2_1.cmd 4 %a% %b% %start_c% %end_c% 96 127 %host4% %delay% %mydir%&timeout 3
start call FindGW2_1.cmd 5 %a% %b% %start_c% %end_c% 128 159 %host5% %delay% %mydir%&timeout 3
start call FindGW2_1.cmd 6 %a% %b% %start_c% %end_c% 160 191 %host6% %delay% %mydir%&timeout 3
start call FindGW2_1.cmd 7 %a% %b% %start_c% %end_c% 192 223 %host7% %delay% %mydir%&timeout 3
start call FindGW2_1.cmd 8 %a% %b% %start_c% %end_c% 224 255 %host8% %delay% %mydir%&timeout 3


echo.
echo.
echo FindGW 2.1 teper' zapushen v novih oknah.
echo Ozhidayte, okna zakroyuts'a avtomaticheski.
echo Resultat budet v fayle gw2_1.txt
echo Eto okno teper' mozhno zakrit'
timeout 10
exit
