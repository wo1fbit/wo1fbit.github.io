---
layout: post
title: Privesc Notes
excerpt_separator: <!--more-->
---

<!--more-->

# Setuid & Setgid
The setuid(set user identity) and setgid(set group identity) are flags that allow users to run an executable with the permissions of the owner or group.

1. find / -perm /4000  - find files with the suid bit set
2. find / -perm /2000 - find files with the sgid bit set

# Capabilities
Linux capabilities are special attributes in the Linux kernel that grant processes and binary executables specific privileges that are normally reserved for processes whose effective user ID is 0.

1. getcap - get capabilities
2. setcap - set capabilities

To see all linux capabilities use **man 7 capabilities**
