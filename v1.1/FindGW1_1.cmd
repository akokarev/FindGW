@ECHO OFF
set ver=FindGW v1.1 by AKokarev
set info=(https://github.com/akokarev/FindGW)

REM ===========================================================================================
REM ===\SETTINGS/====

set mylan="lan"
set myip=10.110.6.168
set mymask=255.255.0.0
set mygw=10.110.0.89
set mydns=8.8.8.8

set host=8.8.4.4
set delay1=400

set a=10
set b=110
set start_c=0
set end_c=255
set start_d=0
set end_d=255
set delay2=5

set mydir=%~dp0%
set h=%TIME:~0,2%&set m=%TIME:~3,2%&set dd=%DATE:~0,2%&set mm=%DATE:~3,2%&&set yyyy=%DATE:~6,4%
set log=gw_%h%%m%_%dd%%mm%%yyyy%.txt

set backto=static

REM ===/SETTINGS\===
REM ===========================================================================================



REM ====HELP====
REM =DO NOT EDIT!=
cls
title %ver%
echo %ver%
echo %info%
timeout /t 3 /nobreak>nul
echo. 
echo Pered zapuskom prover'te znacheniya v sekcii SETTINGS:
echo.
echo [mylan] - imya setevogo podkl'ucheniya, pereimenuyte v nstroykah setevogo podkl'ucheniya!!!
echo [myip] - ip adress
echo [mymask] - maska seti
echo [mygw] - shluz poumolchaniyu
echo [mydns] - adres dns servera
echo a takje ukajite [a] - pervaya cifra iz (myip)
echo i [b] - vtoraya cifra iz (myip)
echo [start_c], [start_d] - nachalo diapazona perebora po 3-ey i 4-oy cifre ip adressa
echo [end_c], [end_d] - konec diapazona perebora po 3-ey i 4-oy cifre ip adressa
echo [delay2] - zaderjka mezhdu proverkami. Po umolchaniyu =5. Dlya WindowsXP mojno =0, Dlya Windows7,8 vozmojno nado uvelichit'
echo [host] - ip adress dlya proverki interneta, (po umolchaniyu eto google-public-dns-a.google.com = 8.8.4.4)
echo [delay1] - vremya ozhidaniya otveta oy hosta (ping, po umolchaniyu =400)
echo [mydir] - direktoriya raspolozheniya scripta
echo [log] - imya fayla dlya sbora shlyuzov
echo [backto]=dhcp\static - po zavershenii ustanovit' nastroyki auto(DHCP) ili staticheskiy ip,gw,dns
echo.
timeout /t 3 /nobreak>nul
pause
cls
echo %ver%
echo %info%
echo.
echo Tekushie nastroyki:
echo.
echo mylan=%mylan%
echo myip=%myip%
echo mymask=%mymask%
echo mygw=%mygw%
echo mydns=%mydns%
echo.
echo host=%host%
echo delay1=%delay1%
echo.
echo Scan IP array: %a%.%b%.[%start_c%-%end_c%].[%start_d%-%end_d%]
echo delay2=%delay2%
echo.
echo mydir=%mydir%
echo log=%log%
echo backto=%backto%
echo.
timeout /t 3 /nobreak>nul
echo Dlya vihoda najmite CTRL+C ili zakroyte okno
pause



REM ==== WORK ====
REM =DO NOT EDIT!=
cls
echo %ver%
echo %info%
echo.

cd %mydir%
%mydir:~0,2%

echo %ver% > %log%
echo %info% >> %log%


for /L %%c in (%start_c%,1,%end_c%) do ( ^
for /L %%d in (%start_d%,1,%end_d%) do ( ^
echo TRY %a%.%b%.%%c.%%d &^
netsh interface ip set address name=%mylan% source=static addr=%myip% mask=%mymask% gateway=%a%.%b%.%%c.%%d gwmetric=1 &^
timeout /t %delay2% /nobreak>nul &^
ping %host% -n 1 -w %delay1% | find "TTL" && echo %a%.%b%.%%c.%%d>>%log% ^
))

if %backto% == static ^
netsh interface ip set address name=%mylan% source=static addr=%myip% mask=%mymask% gateway=%mygw% &^
netsh interface ip set dnsservers name=%mylan% source=static address=%mydns% validate=no

if %backto% == dhcp ^
netsh interface ip set address name=%mylan% source=dhcp &^
netsh interface ip set dnsservers name=%mylan% source=dhcp

echo DONE.
pause
@ECHO ON
