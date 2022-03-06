---
layout: post
title: Urchinsec 2022
excerpt_separator: <!--more-->
---

# URCHINSEC CTF 2022

![image](https://user-images.githubusercontent.com/96860148/156925746-84bb59c1-ca95-4b50-96ed-1a3dc4fdaa8e.png)

Overall it was an easy ctf, very easy. I do not do know anything about rev but I was able to solve some. This should tell you something.

This was a jeopardy type CTF that was hosted by UrchinSec. It was not a team event and I went solo with some of my teammates.
Aim was for the team [@fr44aksmini](https://twitter.com/fr334aksmini) to lead the scoreboard :). I bagged the 6th positon with 2840 points.

<!--more-->

![image](https://user-images.githubusercontent.com/96860148/156926106-1d668701-f434-4a53-9c5e-00cd1df8ae54.png)

As  usual I took web security but due to competition 😸 I had to do other challs but the focus of this writeup is only on WebSec .
In total there were eight challs in total and I was able to solve all except the eighth one.

## Challs
* Around 100-points
* Panel 100-points
* En-Code 100-points
* HeadStart 150-points
* Route 150-points
* Login 150-points
* Route II 150-points
* Refer 150-points(Unable to solve)

### Chall 1: Around 100-points
The site says....

![image](https://user-images.githubusercontent.com/96860148/156926398-7fc6d873-9491-49d0-9cff-73db7552c964.png)

This was a really straight-forward hint. When I'm told to look around the first thing I look is the **robots.txt** file.

![image](https://user-images.githubusercontent.com/96860148/156926468-bd8dba79-8ccc-4b5a-8561-bd05b0a998e0.png)

We've got a part of the flag. Next checking the source code, there is nothing interesting apart from two files : main.css and js/main.js.
Checking them out gives me the last parts of the flag.

**main.css**

![image](https://user-images.githubusercontent.com/96860148/156926535-fa93aa82-daf5-4e16-922a-44760e52229c.png)

**js/main.js**

![image](https://user-images.githubusercontent.com/96860148/156926555-11b64144-baa8-4fe4-90ee-7e0dbb62420b.png)

And that is how you get a 100 points flag. :rofl:

### Chall 2: Panel 100-points
A login...

![image](https://user-images.githubusercontent.com/96860148/156926712-e26d2346-dce0-4245-b6d3-c46591a91d72.png)

As usual the first thing to check is the **robots.txt** and I'm not disappointed 😀

![image](https://user-images.githubusercontent.com/96860148/156926970-b7cd4778-6634-43fd-8295-180a2071a61f.png)

We are not supposed to see **secret.php** but what the heck. Forbidden fruits are sweeter. 😈
secret.php says

![image](https://user-images.githubusercontent.com/96860148/156927088-166a38f5-c1c2-4cc2-8b31-03a5e9123f91.png)

From the script we get that the username is **admin** and the pass is a base64 encoded string **$pass_string = "V1ZkU2RHRlhOV2hrUjFaclRWUkplazVCYnowSwo=";**
which has been encoded three times. So we decode for them...

![image](https://user-images.githubusercontent.com/96860148/156927239-0f663223-b5e6-4eb8-974f-301bd62fea9f.png)

Logging in we get the flag

![image](https://user-images.githubusercontent.com/96860148/156927273-77d4c7be-055e-4aae-a3c2-05d7b9a25199.png)

### Chall 3: En-Code 100-points.
Site says...

![image](https://user-images.githubusercontent.com/96860148/156930507-f6a7f0ad-3ac4-4732-9019-54979607b239.png)

source code:

![image](https://user-images.githubusercontent.com/96860148/156930541-d858cf6b-18c2-483f-bae7-eb271ce76a8f.png)

The part in green looks like a flag. Using [dcode's](https://www.dcode.fr/cipher-identifier) cipher identifier we get know the flag is encoded in ASCII85.

![image](https://user-images.githubusercontent.com/96860148/156930635-eb8b61c0-a712-4be7-83dd-34b22696e1eb.png)

Decoding it we get the flag:

![image](https://user-images.githubusercontent.com/96860148/156930676-025031b6-9d90-4f5a-bd4d-b3941a74dcd2.png)

### Chall 4: HeadStart 150-points
Visiting the site we get an API endpoint error..

![image](https://user-images.githubusercontent.com/96860148/156930769-6a939874-c2f1-423a-b666-c934963bb525.png)

This automatically shifts my brain for directory bruteforcing. Here comes Mr.Dirsearch.

![image](https://user-images.githubusercontent.com/96860148/156931309-e9d93adf-fba8-4a17-83f5-8cb7c622170c.png)

We can see two valid directories: **/console** and **/source**. The subdirectory /console is a rabbit hole and source is where I hit gold:

~~~
@app.route('/getflag', methods=["PEWPEW"])
def getflag():
    if request.method != 'PEWPEW':
        data = {'error':'something went wrong'}
        return jsonify(data)
    else:
        data = {'success':f'{flag}'}
        return jsonify(data)
~~~

There is an API endpoint **/getflag** and it uses http method "PEWPEW" (seriously who thought of the name!!!!). So I head out and using the network tab in developer tools change the method to PEWPEW to get the flag:

![image](https://user-images.githubusercontent.com/96860148/156931220-15bcb7e2-9eb3-41dc-ac58-580c9eaf0ab9.png)

### Chall 5: Route 150-points
![image](https://user-images.githubusercontent.com/96860148/156931388-138a376a-afaa-4fbd-87de-ef38d92e89b9.png)

Clicking around to get a feel of how the site behaves, the download button prompts you to download a file..

![image](https://user-images.githubusercontent.com/96860148/156931443-ce6e6545-a2ae-4e4d-8203-1a9e457dce99.png)

This could lead to something sweeter. Checking out the source code where the download button is we get..

~~~
<nav>
                <ul class="nav-links">
                    <li><a href="#">About</a></li>
                    <li><a href="#">Service</a></li>
                    <li><a href="download.php?file=document.txt">Download</a>
                    <li><a href="#">Capture The Flag</a></li>
                </ul
~~~

On clicking the docunent part while in source code changes the url to..

![image](https://user-images.githubusercontent.com/96860148/156931560-783b97c2-25de-4499-a5b7-65537aff0711.png)

...and we can be able to view the contents. What if we changed the url to flag.txt... 😈

![image](https://user-images.githubusercontent.com/96860148/156931625-e66e77d2-f441-4f27-9732-2a4dc52dc8a8.png)

### Chall 6: Login 150-points
Website says..

![image](https://user-images.githubusercontent.com/96860148/156931678-06a21d41-8296-4f70-9c3b-4fa6105ee1da.png)

The source code reveals a js file that is obfuscated. Seriously people, the obfuscation automatically tells me that there is something juicy here

~~~
var _0x18b3=["\x6C\x6F\x61\x64","\x61\x64\x64\x45\x76\x65\x6E\x74\x4C\x69\x73\x74\x65\x6E\x65\x72",
"\x73\x75\x62\x6D\x69\x74","\x70\x72\x65\x76\x65\x6E\x74\x44\x65\x66\x61\x75\x6C\x74","\x69\x6E\x70\
x75\x74\x5B\x6E\x61\x6D\x65\x3D\x75\x73\x65\x72\x6E\x61\x6D\x65\x5D","\x69\x6E\x70\x75\x74\x5B\x6E\x61\
x6D\x65\x3D\x70\x61\x73\x73\x77\x6F\x72\x64\x5D","","\x72\x65\x70\x6C\x61\x63\x65","\x76\x61\x6C
\x75\x65","\x71\x75\x65\x72\x79\x53\x65\x6C\x65\x63\x74\x6F\x72","\x59\x57\x52\x74\x61\x57\x34","\x75","
\x49\x6E\x63\x6F\x72\x72\x65\x63\x74\x20\x55\x73\x65\x72\x6E\x61\x6D\x65","\x64\x58\x4A\x6A\x61\x47\x6C\
x75\x65\x33\x42\x6C\x64\x31\x39\x77\x5A\x58\x64\x66\x63\x47\x56\x33\x58\x33\x42\x6C\x64\x31\x39\x77\x5A\x5
8\x64\x66\x63\x47\x56\x33\x66\x51\x6F","\x70","\x49\x6E\x63\x6F\x72\x72\x65\x63\x74\x20\x50\x61\x73\x73\x7
7\x6F\x72\x64","\x43\x6F\x72\x72\x65\x63\x74\x20\x50\x61\x73\x73\x77\x6F\x72\x64\x21\x20\x59\x6F\x75\x72\x
20\x66\x6C\x61\x67\x20\x69\x73\x20","\x2E","\x66\x6F\x72\x6D"];(async ()=>{ await  new Promise(((_0x1f3ax1)=>
{return window[_0x18b3[1]](_0x18b3[0],_0x1f3ax1)})),document[_0x18b3[9]](_0x18b3[18])[_0x18b3[1]](_0x18b3[2],(
(_0x1f3ax1)=>{_0x1f3ax1[_0x18b3[3]]();const _0x1f3ax2={u:_0x18b3[4],p:_0x18b3[5]},_0x1f3ax3={};for(const _0x1f
3ax1 in _0x1f3ax2){_0x1f3ax3[_0x1f3ax1]= btoa(document[_0x18b3[9]](_0x1f3ax2[_0x1f3ax1])[_0x18b3[8]])[_0x18b3[
7]](/=/g,_0x18b3[6])};return _0x18b3[10]!== _0x1f3ax3[_0x18b3[11]]?alert(_0x18b3[12]):_0x18b3[13]!== _0x1f3ax3
[_0x18b3[14]]?alert(_0x18b3[15]):void(alert(`${_0x18b3[16]}${atob(_0x1f3ax3[_0x18b3[14]])}${_0x18b3[17]}`))}))})()
~~~

Heading to [deobfuscate.io](https://deobfuscate.io/) I'm able to know what the js is doing. 

~~~
(async () => {
  await new Promise(vandan => {
    return window.addEventListener("load", vandan);
  }), document.querySelector("form").addEventListener("submit", yanelie => {
    yanelie.preventDefault();
    const reshaud = {u: "input[name=username]", p: "input[name=password]"}, predrag = {};
    for (const alene in reshaud) {
      predrag[alene] = btoa(document.querySelector(reshaud[alene]).value).replace(/=/g, "");
    }
    ;
    return "YWRtaW4" !== predrag.u ? alert("Incorrect Username") : "dXJjaGlue3Bld19wZXdfcGV3X3Bld19wZXdfcGV3fQo" !== predrag.p ? alert("Incorrect Password") : void alert(`${"Correct Password! Your flag is "}${atob(predrag.p)}${"."}`);
  });
})();
~~~

The username and pass are base64 encoded and the pass is the flag. As usual I help these guys break their site.. 😈

![image](https://user-images.githubusercontent.com/96860148/156931934-b2f946dd-a9e7-4477-a973-85433c6192ac.png)

### Chall 7: Route II 150-points

The challenge description says this

![image](https://user-images.githubusercontent.com/96860148/156932003-4dd39c5e-68a1-42c1-999f-14b6f18176bc.png)

This made my head to lock on LFI and RFI. This is how the page looks like..

![image](https://user-images.githubusercontent.com/96860148/156932089-932e5c29-e442-4d9a-b6e7-5dd759df581f.png)

With some form of LFI...

![image](https://user-images.githubusercontent.com/96860148/156932154-bbb91a1d-98ca-4319-a8ac-98322e9a12cb.png)

Trying LFI and RFI proved useless and then I realized that the description was some sort of subliminal persuation. I was thinking the way the author wanted me
to think, not how i should think think...bingo 😸. Mr.Dirsearch sorted me out....again..

![image](https://user-images.githubusercontent.com/96860148/156932380-83ce3ae5-9f9d-4dd5-9321-9c1253f5f862.png)

So i go for my flag

![image](https://user-images.githubusercontent.com/96860148/156932409-649cca0b-d77a-4044-ba0f-680b8703ea39.png)

There it is folks..the flags for all challs except the eighth one. Nobody was able to solve it and I would like to ask the organizers to post the write-up for it.
It's been a pleasure folks.

Till next CTF,
Par5z.

