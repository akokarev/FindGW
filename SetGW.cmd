timeout /t 3
set mylan="lan"
set myip=10.110.6.168
set mymask=255.255.0.0
set mydefaultgw=10.110.0.1
set myfreegw=10.110.0.89
set mydns=8.8.8.8

set a=10
set b=110

netsh interface ip set address name=%mylan% source=static addr=%myip% mask=%mymask% gateway=%mygw% gwmetric=100
netsh interface ip set dnsservers name=%mylan% source=static address=%mydns% validate=no
timeout /t 5


route add 0.0.0.0 %myfreegw% METRIC 1
