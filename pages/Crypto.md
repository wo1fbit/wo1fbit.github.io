---
layout: page
title: Crypto
permalink: /Cryptography/
---

###### Cryptography Notes

# <mark> CRYPTOLOGY </mark>
---
**Classification**
~~~
* Cryptography.
* Cryptanalysis.
~~~

## <mark> 1. Cryptography. </mark>
---

**Classification**
~~~
* Symmetric Encryption
* Assymetric Encryption
* Protocols
~~~

**<mark>Kerckhoff's Principle</mark>** - a cryptosystem should remain secure even if the attacker knows all the details about the system, except the key.

### <mark> 1.1 Symmetric Cryptography. </mark>
In Symmetric encryption the same key is used to encrypt and decrypt the message.

~~~
                                        ### Basic Symmetric Encryption ###
                                                    ---
                                                  -     -
        Plaintext-|    ==================        -        -         ========================
                  |----= encryption alg =--------  Channel ---------= decryption algorithm =-----> Plaintext
              Key-|    ==================        -        -         ========================
                                                   -    -                      ^
                                                     ---                       |
                                                                              key
~~~

#### 1.1.1 Substition cipher.
- historical cipher
- operates on letters
- replaces every letter with another one which is fixed

~~~
Examples
--------
a --> l
b --> d
c --> w
e(abc)--> ldw
~~~

#### Possible Attakcs
1. Bruteforce
2. Letter Frequency Analysis.\

### <mark> 1.2 Asymmetric Cryptography. </mark>

---

## Index
---
~~~
* Channel - medium of communication. Examples: internet, airwaves, GSM, WiFi
* p = plaintext
* c = ciphertext
* e = encryption algorithm
* d - decryption algorithm
* k/key = key, |k| = keyspace (number of keys)
~~~

### <mark>2 Cryptanalysis </mark>
**Cryptanalysis** is study of ciphers, ciphertext and cryptosystems to better understand of how they work with th aim of finding ways to defeat/weaken them.

There are often many possible attack approaches (attack vectors)
#### Classes of Cryptanalysis
~~~
* Classical --Bruteforce.
            |_Analytical Attacks.
~~~
