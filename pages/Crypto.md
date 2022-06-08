---
layout: page
title: Crypto
permalink: /Cryptography/
---

## Cryptography Notes

# CRYPTOLOGY
---
**Classification**
~~~
* Cryptography.
* Cryptanalysis.
~~~

## 1. Cryptography
---
Cryptography is the study of secure communications techniques that allow only the sender and intended recipient of a message to view its contents.

**Classification**
~~~
* Symmetric Encryption
* Assymetric Encryption
* Protocols
~~~

**<mark>Kerckhoff's Principle</mark>** - a cryptosystem should remain secure even if the attacker knows all the details about the system, except the key.

### 1.1 Symmetric Cryptography.
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

### 1.2 Asymmetric Cryptography

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

### 2 Cryptanalysis
---
**Cryptanalysis** is study of ciphers, ciphertext and cryptosystems to better understand of how they work with the aim of finding ways to defeat/weaken them.

There are often many possible attack approaches (attack vectors)
#### Classes of Cryptanalysis
~~~
* Classical --Bruteforce
            |_Analytical Attacks
* Social Engineering
* Implementation
~~~
