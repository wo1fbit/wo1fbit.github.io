---
layout: post
title: MHSCTF 2022
excerpt_separator: <!--more-->
---

# KnightCTF Jan 2022

![knightctf](https://user-images.githubusercontent.com/96860148/155820593-46b5ba1a-336e-427d-b5fb-084a1da1b304.png)

This is one of the CTFs that start the year and took place on 20th Jan 2022 and ended on 21st Jan 2022. It was a jeorpady style CTF.

This was my first international CTF and I belonged to the team:

<!--more-->

![mini](https://user-images.githubusercontent.com/96860148/155820670-5b679164-172f-4fad-942b-6f73052a67a5.png)

I decided to tackle the web category and was able to do at least three of the eleven challenges which was not impressive(Will do better captain @Winter XD).
Hope I will solve more challenges in upcoming events.The challenges required at least some knowledge in PHP and were :

1. Find Pass Code -1.

This challenge required a pass code to get the flag. However this was not the case.

![pass](https://user-images.githubusercontent.com/96860148/155820926-e41a8fdf-68d7-44e9-8207-0ba23d84aafd.png)

On interacting with the page, I tried different words and numbers but kept getting the same thing on every occasion.

![pass2](https://user-images.githubusercontent.com/96860148/155820977-37030a51-3bb0-4975-b011-7e17f67c252e.png)

When viewing the source code, this came up.
```
    <div class="title-text">Welcome to Pass Code Verification</div><br>
    <!-- Hi Serafin, I learned something new today. 
I build this website for you to verify our KnightCTF 2022 pass code. You can view the source code by sending the source param
-->
    <form action="" method="POST">
        <label>Pass Code</label>
        <input class="form-control" type="text" placeholder="Enter Pass Code" name="pass_code">
        <input class="form-control" type="submit" value="Verify" />
    </form>
```
One of the site’s builders left a note to their partner advising them that to view the original source code they had to send the source parameter. 
We do exactly that →http://find-pass-code-one.kshackzone.com/?source. This brings us to this which explains why I kept getting the wrong pass code error.

![strcmp](https://user-images.githubusercontent.com/96860148/155821095-4d8c5341-1e00-45d7-ba67-b13af61472db.png)

The PHP code compares the pass_code we enter to $flag by using strcmp().
SYNTAX: strcmp( $string1, $string2 ) where $string1 and $string2 are the strings to be compared.

Return Values: strcmp() returns a random integer value depending on the condition of the match, which is given by:

* Returns 0 if the strings are equal.
* Returns a negative value (< 0), if $string2 is greater than $string1.
* Returns a positive value (> 0) if $string1 is greater than $string2.

After a bit of research, it seemed that strcmp() had some issues when comparing a string to something else. 
In PHP, a variable is considered to be null if:it has been assigned the constant null, it has not been set to any value yet. 
So NULL == 0 . If we could make strcmp() result be NULL will bypass it. We give post request like this pass_code[]=lol then the $pass_code becomes an array.
Now comparing this, instead of throwing an error, it returns NULL and in PHP NULL == 0, which means string comparison passed and we got the flag :)

![flag](https://user-images.githubusercontent.com/96860148/155821431-0730b5ec-8000-4dc0-9504-aa8d222ca5af.png)






