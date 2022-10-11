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
4. /etc/exports
5. /etc/apache2/sites-enabled/000-default.conf
6. /etc/apache2/.htpasswd

# NFS Shares
The Network File System (NFS) is a mechanism for storing files on a network. It is a distributed file system that allows users to access files and directories located on remote computers and treat those files and directories as if they were local.

By default, NFS shares change the root user to the nfsnobody user, an unprivileged user account.
In this way, all root-created files are owned by nfsnobody, which prevents uploading of programs with the setuid bit set.

## no_root_squash
Allows root users on client computers to have root access on the server. Mount requests for root are not be mounted to the anonomous user. This option is needed for diskless clients. This is a good privesc vector if vuln is found.

## root_squash
Requests from root clients are mapped to the nobody user and group ID so they will only have file privileges associated with other.

ro - read only access
rw - read write access 
