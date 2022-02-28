# A01: Broken Access Control.

From the title I can see that something is broken. **Access control** is broken. Maybe it shouldn't be broken Let's go and check out what is Access Control.

### Access Contro;.
Access control is regulating the way a resources is accessed. When you want to control how people can get in your house or compound you use a door or a gate. The access control is the door or gate.

#### How does access control work?
Access control identifies people by use of credentials such as usernames, passwords, physical door keys, biometrics, security tokens to mention but a few. Access control makes sure that people or users perform actions they're supposed to do.

This is achieved by using:
* Authentication - making sure they're what or who say they are. Use of logins, passwords ......
* Session Management - identifying which actions are performed by who. Use of cookies, session id ......

From what I have gathered above, if access control is broken, then the wrong people can get access to resources or priviledges they shouldn't have and this could lead to modification or deletion of data, disclosure of sensitive data, performing dangerous actions e.t.c

### Types of Access Control Models.
Portswigger - An access control security model is a formally defined definition of a set of access control rules that is independent of technology or implementation platform.

**Mandatory Access Control (MAC)** - this type of access control works by people's identities. For example, in military and security organizations where people can only access resources that are in the level of their clearance. Strictest and most secure but it is also inlexible.

**Role-Based Access Control (RBAC)** - as the name of the model says. Access is granted according to the role a person plays. Admins can delete or create users while normal users can't do that sort of thing.

**Discretionary Access Control (DAC)** - in this model, owners of resources have the ability to assignn access permissions to users.

**Rule-Based Access Control (RBAC')** - this model kind of like is an add-on to the other models. The security administartor defines rules which are based on conditions, such as the time of day or location. For example, after closing work, there is no need for anyone to have access to the main office even the managers. With rule-based access control, you can set a rule to deny access to everyone from 5 p.m. to 9 a.m. the next morning. Rules can be created for just about any occasion.

**Access control links.**
[portswigger](https://portswigger.net/web-security/access-control)
[wikipedia](https://en.wikipedia.org/wiki/Access_control)
[techtarget](https://www.techtarget.com/searchsecurity/definition/access-control)
[citrix](https://www.citrix.com/solutions/secure-access/what-is-access-control.html)
[owasp](https://owasp.org/Top10/A01_2021-Broken_Access_Control/)
