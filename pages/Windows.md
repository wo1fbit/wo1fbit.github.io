---
layout: page
title: Windows
permalink: /windows/
---

# Windows Commands
---
## User Related
~~~
net user <user> <user password> /add --> create user
net localgroup administrators <user> /add --> add user to administrators
~~~

## File Related
---
~~~
type <file> --> read file
~~~

# Meterpreter Useful Commands (Windows)
---
~~~
use priv + getsystem ---> run session with system priviledges

ps --> see processes running
steal_token <process id> --> steal token of a process running as Administrator 
shell --> drop into system shell
~~~
