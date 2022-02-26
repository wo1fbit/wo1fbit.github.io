layout: post
title: "Windows File System"
excerpt_separator: <!--more-->

# File System.
A file system is simply a way to oragnize and store files on a storage device.

## Windows has five file systems.

<!--more-->

**File allocation table (FAT)**

* FAT12 (no longer used)
* FAT16 (no longer used)
* FAT32
* NTFS
* exFAT

Ww will be focusing on the NTFS file system (New Technology File System).

# NTFS

It is the default Windows File System since Windows NT 3.1.

## Permissions.

The NTFS file system has many basic Permissions that some include:

1. Full Control - read, write, change, delete
2. Modify - red, write, delete
3. Read and EXecute

Files and folders inherit the permission of the parent folders.

## Integrity Control Access Control List (icacls)

This is a utility that helps in managing Permissions on files and folder.

We can list out the NTFS permissions on a specific directory by running either **icacls** from within the working directory or **icacls C:\Windows** against a directory not currently in.

The resource access level is list after each user in the output. The possible inheritance settings are:

* (CI): container inherit
* (OI): object inherit
* (IO): inherit only
* (NP): do not propagate inherit
* (I): permission inherited from parent container

Basic access permissions are as follows:

* F : full access
* D :  delete access
* N :  no access
* M :  modify access
* RX :  read and execute access
* R :  read-only access
* W :  write-only access

A full listing of icacls command-line arguments and detailed permission settings can be found [here](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/icacls).
