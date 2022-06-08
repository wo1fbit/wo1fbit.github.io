---
layout: page
title: Forensics
permalink: /Forensics/
---

# Forensic Notes
---

These are notes that I take while doing Forensics challenges on BTLO (Blue team Labs Online) and other platforms. I will use them in the future as a reference. I hope they will be of use to anyone interested in computer Forensics.

## Using Hashcat To Break Password Protected Files
---
## Veracrypt Containers (.vc)
What is veracrypt?
~~~
Veracrypt is an encryption program that performs various functions.
The most basic veracrypt implementation is encrypted volumes. These volumes are just folders
encrypted with unbreakable Passwords.
The only way to access them is by mounting them as an encrypted disk.

Extracting .vc password hashes
------------------------------
dd if=container.vc of=container.img bs=512 count=1
~~~

---

# DD images
---
~~~
1. Create a folder.
   mkdir tmp
2. Mount the image in the folder.
   sudo mount -o loop image.dd tmp
3. To umnount the image
   sudo umount tmp
~~~

# Crack Zip files with fcrackzip
---
~~~
fcrackzip -b -v -u file.zip -D -p /home/wolf/Wordlists/rockyou.txt
~~~
---
# References
* Extracting veracrypt password hashes - https://hashcat.net/wiki/doku.php?id=frequently_asked_questions#how_do_i_extract_the_hashes_from_truecrypt_volumes
