---
layout: Page
title: Priviledge Escalation
permalink: /Privesc/
---

# Sudo -l
Run this command to see what the current user can run as root. You might find something misconfigured (the wrong program given the right permissions :laughing: )

# Setuid & Setgid
The setuid(set user identity) and setgid(set group identity) are flags that allow users to run an executable with the permissions of the owner or group.

1. find / -perm /4000 - find files with the suid bit set
2. find / -perm /2000 - find files with the sgid bit set
3. find / -perm /6000 - find files with both the suid and sgid bit set

# Capabilities
Linux capabilities are special attributes in the Linux kernel that grant processes and binary executables specific privileges that are normally reserved for processes whose effective user ID is 0.

1. getcap - get capabilities e.g getcap -r / 2>/dev/null
2. setcap - set capabilities e.g setcap "Capabilites to set" /path/to/file

To see all linux capabilities use **man 7 capabilities**

# World-Writable Files
Sometimes you want to look for files that you can edit. You might discover that you can edit /etc/passwd or /etc/shadow.

1. find / -type f -perm /0777 2>/dev/null - find world-writeable files in the whole system
2. find / -type d -perm /0777 2>/dev/null - find world-writeable directories in the whole system

# Cron Jobs
Find automated jobs that run with priviledged permissions.

1. cat /etc/crontab - check for cronjobs
