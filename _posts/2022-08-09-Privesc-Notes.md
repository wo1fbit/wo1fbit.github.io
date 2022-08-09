---
layout: post
title: Privesc Notes
excerpt_separator: <!--more-->
---

# Setuid & Setgid
The setid(set user identity) and setgid(set group identity) are flags that allow users to run an executable with the permissions of the owner or group.

<!--more-->

# Capabilities
Linux capabilities are special attributes in the Linux kernel that grant processes and binary executables specific privileges that are normally reserved for processes whose effective user ID is 0.

getcap - get capabilities
setcap - set capabilities

To see all linux capabilities use **man 7 capabilities**
