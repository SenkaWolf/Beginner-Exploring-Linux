**[![ ](https://github.com/senkawolf/Software-List/blob/main/media/icons/prev25.png?raw=true) Back](/README.md)**

<div align="center">

<img src="../media/openSUSE.png" />

<br>

[![Author](https://img.shields.io/badge/Author-Senka_Wolf-4044ee?style=for-the-badge)](https://github.com/silentz)
[![License](https://img.shields.io/badge/License-Apache--2.0-blue?style=for-the-badge)](./LICENSE.md)
![GitHub last commit](https://img.shields.io/github/last-commit/senkawolf/Software-List?style=for-the-badge)

</div>

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

## Table of Contents

<details>
 <summary>Expand Table Here</summary>
  
  - [openSUSE-based Distributions](#openSUSE-based-Distributions)
  - [openSUSE Tumbleweed Install Process](#openSUSE-Tumbleweed-Install-Process)
        - [Troubleshooting](#Troubleshooting)
        - [Tweaks and Improvements](#Tweaks-and-Improvements)
  - [Guides](#Guides)
  - [Miscellaneous](#Miscellaneous)
</details>

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">openSUSE-based Distributions</h1>

This list is OS distributions which are derived from openSUSE Linux either in whole or in part. The version you use is down to preference, taste in distros and use case.
   
<sub>In alphabetical order.<sub>

- [GeckoLinux](https://geckolinux.github.io/)
- [openSUSE](https://get.opensuse.org/)
- [openSUSE MicroOS](https://microos.opensuse.org/)


![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">openSUSE Tumbleweed Install Process</h2>

Now we will be going through the install process of openSUSE Tumbleweed, this will feel very familiar to a Windows setup.

- Select your language & keybaord layout then press next.
- Select your network interface then press next.
- Select your System Role a.k.a your desktop environment then press next. I prefer KDE Plasma.
- On the Suggested Partitioning screen you want to select "Expert Partitioner" then "Start with Existing Paritions".
- On the left hand side their will be a list of installed drives. Select the one you wish to use. 
- Now we need to create three partitions, so we will need to go through the "Add Partition..." screen three times using the following settings:
    - EFI Boot Partition
        - New Partition Size: Select Custom Size and type 1 GiB.
        - Role: EFI Boot Partition
        - Formatting Options: Filesystem: "FAT" & Mounting Options: Mount Point "/boot/efi"
    - Swap
            - New Partition Size: Select Custom Size and type 8 GiB. - If your PC has 8GB of RAM then put 8GiB. If you have more then half your RAM amount and that should be the number you use. E.g. 32GB RAM you would put 16GiB. 
            - Role: Operating System
            - Formatting Options: Filesystem: "Swap" & Mounting Options: Mount Point "swap"
    - Operating System
            - New Partition Size: Select Custom Size and type 50 GiB. - Choose between 30GiB-50GiB.
            - Role: Operating System
            - Formatting Options: Filesystem: "btrfs" & Mounting Options: Mount Point "/"
    - Data and ISV Applications
            - New Partition Size: Select Custom Size and type (amount) GiB. - Use all the free space left on your drive.
            - Role: Operating System
            - Formatting Options: Filesystem: "btrfs" & Mounting Options: Mount Point "/"
- Now pick your region and time zone.
- Create your user account.
- On the Installation Settings overview page make sure that "Secure Boot" is enabled. It should be by default but it is recommended to double check!
- Now install the operating system.
- Once it restarts remove the USB key/pendrive/memory stick.

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Troubleshooting</h2>

#### Install hanging on "Starting udev"
If the installer gets stuck on `Starting udev...`, reboot your PC and restart the install following the above steps.

When you get to the GRUB menu during the boot process you will need to edit the boot parameters. This can be done by highlighting the boot entry, pressing "e" to edit, finding the line starting with `linux` and adding `nomodeset` at the end of that line.

Then press Ctrl + X or F10 to continue.

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Tweaks and Improvements</h2>

#### Increase GRUB timeout limit
- Open the terminal
- Type in:
```console
$ sudo nano /etc/default/grub
```
- Input your users password
- You will then see the content of the grub file which will look simular to this. Look for the `GRUB_TIMEOUT=8` and change it to `GRUB_TIMEOUT=30`.
```console
GRUB_DISTRIBUTOR=
GRUB_DEFAULT=saved
GRUB_HIDDEN_TIMEOUT=0
GRUB_HIDDEN_TIMEOUT_QUIET=true
GRUB_TIMEOUT=8
GRUB_CMDLINE_LINIX_DEFAULT="splash=silent mitigations=auto quiett security=apparmor"
GRUB_CMDLINE_LINUX=""
```
- Then save changes by pressing `Ctrl + O`.
- Then exit by pressing `Ctrl + X`.
- The type the following command to update the grub configuration.
```console
$ sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```
- Then reboot your system.

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">Guides</h1>

> [!CAUTION]
> All links here unless specified are NOT affiliated with me.

- [openSUSE Tumbleweed Official Install Guide](https://en.opensuse.org/openSUSE:Tumbleweed_installation)
- [Dual Booting/Secure Boot Setup](https://superuser.com/questions/1851143/dual-booting-opensuse-tumbleweed-with-windows-11-and-secure-boot)
- [YouTube Video: How to dual boot and install openSUSE](https://youtu.be/JT5dbJ3AkDo?si=X3yDCNzLNBahQ7KY)

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">Miscellaneous</h1>

<details>
 <summary>Sources</summary>
  
  - [openSUSE Tumbleweed](https://get.opensuse.org/tumbleweed/)
  - [openSUSE Tumbleweed portal](https://en.opensuse.org/Portal:Tumbleweed)
</details>

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

**[![ ](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/up25.png) Back to Top](#Table-of-Contents)**