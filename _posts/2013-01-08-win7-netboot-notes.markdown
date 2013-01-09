---
layout: post
title: Windows 7 Netboot/Netinstall notes
---

# {{ page.title }}

I recently went through the trouble to get one of my machines without a
hard drive to boot the Windows 7 install over the network, install to a
network based ISCSI drive, and then boot over the network off that
drive.  Here's my notes on what I did. A full post may follow later. The
whole procedure is documented in many other places so you won't find
that here.

## Initial setup

I used dnsmasq, samba, and iPXE on the server side. The server was
running Arch Linux with a 3.6 kernel, so it had all the iSCSI stuff
built in already. There's [instructions on the Arch
wiki](https://wiki.archlinux.org/index.php/ISCSI_Target) on how to set
up an iSCSI target.

I used the Windows AIK on a 64 bit virtual machine in order to prep the
install image. 

## Don't chainload iPXE

I could not for the life of me get the Windows 7 Install program to use
my iSCSI drive. If I tried to set up iSCSI manually, it would see the
drive, but not install to it. If I tried to use iPXE to sanboot from the
drive, then the install would hang.

This all came down to the fact that I was chainloading iPXE from the
NIC's original firmware. I fixed the issue by using an iPXE kernel image
instead.

## Use Gregory Strike's instructions for modifying the WinPE image

[Gregory Strike's iSCSI WinPE
customizations](http://www.gregorystrike.com/2010/01/08/winpe-v3-0-and-microsoft-iscsi-initiator/)
are great for getting iSCSI going in the WinPE image you boot to get
your Windows 7 install running. 

However, using his registry hacks verbatim made it so that the network
didn't work out of the box. I took out the following section of his
registry hack and had no problems.

    [HKEY_LOCAL_MACHINE\PE_Sys\ControlSet001\Services\netbt]
    "Start"=dword:00000000
 
    [HKEY_LOCAL_MACHINE\PE_Sys\ControlSet001\Services\AFD]
    "Start"=dword:00000000

    [HKEY_LOCAL_MACHINE\PE_Sys\ControlSet001\Services\Tcpip]
    "Start"=dword:00000001

