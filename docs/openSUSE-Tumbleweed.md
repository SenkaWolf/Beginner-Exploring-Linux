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
    - [chroot Environment](#chroot-Environment)
    - [Fix Discover app backend](#Fix-Discover-app-backend)
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

- Connecting to the internet.
    - If you are using a ethernet cable you can use the ping command to check the connection. Type `ping google.com` and you should see a ping return.
        - To stop the pings press `Ctrl + C`.
    - If you are using Wi-Fi then you will need to use iwctl to connect to the internet. Type `iwctl` to enter the iwd shell.
        - The type `device list` to see a list of network interfaces.
        - Look for 'wlan0' then type `device wlan0 show` to see more information.
        - Then type `station wlan0 get-networks` to see a list of Wi-Fi networks.
        - Then type `station wlan0 connect [name of Wi-Fi network]` replace [] with the name of your Wi-Fi network.
        - It will then ask for your Wi-Fi password.
        - Now exit the iwd shell by typing `exit`.
        - Try using ping command to check the connection by typing `ping google.com`.
            - To stop the pings press `Ctrl + C`.
- Syncing system packages and updating.
    - Type `pacman -Sy` to sync and upgrade system packages.
- Formatting Disk
    - Now type `lsblk` to show a list of all the connect drives to the computer.
    - If you're unsure what drive you need to use, you can type `fdisk -l` to see more information.
    - **Make sure you are careful as it's important you format the correct drive otherwise you could lose important data.**
        - If you are using a virtual machine then the drive will most likely be named 'sda'.
    - Once you have confirmed the correct drive (I'm using sda in this instance) run the command `gdisk /dev/[drive name]` e.g. `gdisk /dev/sda` to enter the gdisk tool.
    - Once in gdisk press `x` to enter expert mode.
    - Then press `z` to erase the drive.
    - Follow the prompts by typing `y` to finish the process.
    - Now in my case the 'sda' drive should be free of nay partitions and files.
- Install Script
    - Now type the command `pacman -Sy archlinux-keyring` which contains the public keys used to verify the authenticity and integrity of Arch Linux packages ensuring they come from trusted sources.
        - Make sure you press `y` for any prompts.
    - Now type `pacman -Sy archinstall` to setup the arch install script.
        - Make sure you press `y` for any prompts.
    - Now type `archinstall`.
        - Use the arrow keys to navigate through the options.
    - Set the system language.
    - Go into Locales and set the options which best suit you, for me I will configure it for the United Kingdom.
        - Keyboard layout: uk
        - Locale language: en_GB
    - Select Disk Configuration
        - Select Partitioning
        - Select Use a best-effort default partition layout
        - Select the drive where you want to install Arch Linux, the one we identified earlier. So in my case dev/sda.
        - Select the `btrfs` filesystem.
        - Select yes to would you like to use BTRFS subvolumes with a default structure.
        - Select Use compression.
        - Then go back oto the main menu.
    - Select Bootloader
        - Make sure Grub is selected.
    - Select Root password and set a secure password.
    - Select User account
        - Select Add a user (Username must be all lowercase and say yes to being a superuser(sudo)).
        - Confirm and exit.
    - Select Profile
        - Select Type
        - Select Desktop
        - Now select the type of desktop environment you want:
            - KDE Plasma - Best UI
            - Xfce - Nice compromise between looks and performance, particularly if you have an older computer. 
    - Select Graphics Driver
        - Pick the driver which suits your computer hardware configuration.
        - NVIDIA - Select the `Nvidia (proprietary)` option.
        - Virtual Machine - If you're using a virtual machine then select `VMware / VirtualBox (open-source)`.
        - Then go back oto the main menu.
    - Audio
        - Then select the option pipewire.
    - Additional packages
        - Here you can specify a list of tools to be installed separated by spaces. Below is a list of some packages:
        - htop fastfetch neofetch git curl wget base-devel
    - Network configuration
        - Select NetworkManager
    - Timezone
        - Set this to your timezone, in my case it would be `Europe/London`
    - Finally you are ready to press install, this may take a few minutes.
    - Once the installtion has been completed you will get a prompt saying wouldl you like to chroot into the newly created installation and perform post-installation configuration.
        - Select yes.

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">chroot Environment</h2>

Now we are in the chroot environment where we can install useful tools before booting into the desktop environment. These tools are optional, the tools are separated by spaces in the below command.

```console
$ pacman -Sy enchant mythes-en ttf-liberation hunspell-en_GB ttf-bitstream-vera adobe-source-sans-pro-fonts gst-plugins-good ttf-droid ttf-dejavu aspell-en icedtea-web gst-libav ttf-ubuntu-font-family ttf-anonymous-pro jre8-openjdk languagetool libmythes firefox libreoffice-fresh vlc
$ exit          #To exit the chroot environment
$ shutdown now  #Powers off your computer or virtual machine
````
> [!IMPORTANT]  
> If you installed Arch Linus onto bare metal remove the bootsable USB and turn on the computer.

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Fix Discover app backend</h2>
The Discover application helps you find and install applications, games, and tools from multiple sources. If you try to launch the application you will get a error saying that Arch Linus is not configured for installing apps through Discover. 

To fix this we need to install Flatpak and use it as a backend for Dicover.

```console
$ sudo pacman -Sy
$ sudo pacman -Sy flatpak
```
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