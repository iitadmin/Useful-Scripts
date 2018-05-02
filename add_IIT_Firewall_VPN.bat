

REM Allow IIT to ping the workstation
netsh advfirewall firewall add rule name="IIT ICMP" dir=in action=allow remoteip=128.100.81.0/24 protocol=icmpv4

REM Delete from default rules
netsh advfirewall firewall del rule name="Remote Desktop (TCP-In)"
netsh advfirewall firewall del rule name="Remote Desktop - RemoteFX (TCP-In)"

REM Allow IIT to RDP to workstation
netsh advfirewall firewall add rule name="IIT RDP" dir=in action=allow remoteip=128.100.81.0/24 protocol=tcp localport=3389

REM Allow UtorVPN network to RDP to workstation
netsh advfirewall firewall add rule name="UtorVPN" dir=in action=allow remoteip=142.150.248.0/24 protocol=tcp localport=3389


REM Set registry key to enable RDP service
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

powercfg -change -standby-timeout-ac 0
