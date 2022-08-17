---
layout: page
title: Privesc
permalink: /Privesc/
---

# Sudo -l
Might require a password

# Suid & Sgid
1. find / -perm /4000 - suid
2. find / -perm /2000 - sgid bit set
3. find / -perm /6000 - both suid and sgid

# Capabilities
1. getcap - get capabilities e.g getcap -r / 2>/dev/null
2. setcap - set capabilities e.g setcap "Capabilites to set" /path/to/file

To see all linux capabilities use **man 7 capabilities**

# World-Writable Files
1. find / -type f -perm /0777 2>/dev/null
2. find / -type d -perm /0777 2>/dev/null
3. find / -xdev -user root -perm -a+w -name hello 

# /etc
1. /etc/crontab
2. /etc/cron.d
3. /etc/doas.conf
