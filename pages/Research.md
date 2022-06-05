---
layout: page
title: Research
permalink: /windows/
---

# Cracking files with John the Ripper
Run the following against its corresponding file fomart to get the password hash and save them to another file. 
~~~
zip files --> zip2john zipfile > hash
rar files --> rar2john rarfile > hash
pfx files --> pfx2john pfxfile > hash
~~~

###  getting the password
~~~
john hash --wordlist=path-to-wordlist
~~~

### showing the password
~~~
john hash --show
~~~

# Evil-winrm
~~~
https://linuxcommandlibrary.com/man/evil-winrm
evil-winrm -S -c <.cer/.crt file> -k private.key --> login to winrm using ssl, ssl certificate file and private key
~~~
# Extracting the certificate and keys from a .pfx file
~~~
openssl pkcs12 -in [yourfile.pfx] -nocerts -out [private.key] --> private key
openssl pkcs12 -in [yourfile.pfx] -clcerts -nokeys -out [drlive.crt] --> certificate
openssl pkcs12 -in [yourfile.pfx] -nocerts -nodes -out [key_pair.key] --> combined private and public key
openssl rsa -in [key_pair.key] -pubout -out [public.key] --> public key from combined private and public key
~~~

# Windows Commands
---
### Users
~~~
net user <user> <user password> /add --> create user
net localgroup administrators <user> /add --> add user to administrators
~~~

### Files
~~~
type <file> --> read file
C:\Users\*user*\AppData\Roaming\Microsoft\Windows\Poweshell\PSReadLine --> user command history folder
dir /s /b -->  get a list of files recursively in a single list with o split between each subfolder
dir /s /b /a-d --> The /a option is an attribute filter. Then the -d option means “minus folders”, then the folder are not displayed in the command prompt.
~~~

### Meterpreter
~~~
use priv + getsystem --> run session with Adminisrator priviledges
ps --> see processes running
steal_token <process id> --> steal token of a process running as Administrator 
shell --> drop into system shell
~~~

### Security
#### SID
~~~
Windows uses SID(security identifier)which is a unique identifier of a person, user group  or other security principal.
Impacket's lookupsid.py can be used to bruteforce Windows SID's to identify users. --> https://github.com/SecureAuthCorp/impacket/blob/master/examples/lookupsid.py
https://en.wikipedia.org/wiki/Security_Identifier
~~~
