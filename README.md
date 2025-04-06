<div align="center">

<img src="./media/archlogo.png" />

<br>

[![Author](https://img.shields.io/badge/Author-Senka_Wolf-4044ee?style=for-the-badge)](https://github.com/silentz)
[![License](https://img.shields.io/badge/License-Apache--2.0-blue?style=for-the-badge)](./LICENSE.md)
![GitHub last commit](https://img.shields.io/github/last-commit/senkawolf/Software-List?style=for-the-badge)

</div>

![---](https://github.com/senkawolf/Beginner-Exploring-Arch-Linux/blob/main/media/line.png?raw=true)

## Table of Contents

<details>
 <summary>Expand Table Here</summary>
  
  - [Beginner Exploring Arch Linux](#Beginner-Exploring-Arch-Linux)
    - [Getting Started](#Getting-Started)
    - [Support and Feedback](#Support-and-Feedback)
  - Installation
    - [Bare Metal or Virtual Machine](#Bare-Metal-or-Virtual-Machine)
    - [Arch Linux Install Process](#Arch-Linux-Install-Process)
    - [chroot Environment](#chroot-Environment)
    - [Fix Discover app backend](#Fix-Discover-app-backend)
  - [Tweaks and Improvements](Tweaks-and-Improvements)
  - [Themes](#Themes)
  - [Guides](#Guides)
  - [Miscellaneous](#Miscellaneous)
</details>

![---](https://github.com/senkawolf/Beginner-Exploring-Arch-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">Beginner Exploring Arch Linux</h1>

### Getting Started
 This will be a collection of installation guides, notes and troubleshooting I've used whilst exploring and getting into Linux and more specifically Arch. I'm a rookie when it comes to Linux so this is isn't a fully comprehensive guide and I'm sure there will be mistakes along the way so don't view this as a tutorial.

### Support and Feedback
If you have any suggestions and corrections then please get involved through Github.

**Issues:** If you come across any problems or have specific questions, please open an issue on the Github repository.

**Pull Requests:** If you have improvements or additions to this document, feel free to submit a pull request.

### Post Format
Anything to do with the terminal (konsole) will be within fenced code blocks throughout this document.

![---](https://github.com/senkawolf/Beginner-Exploring-Arch-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Bare Metal or Virtual Machine</h2>

### Option 1: Virtual Machine
This option is best for experimenting without needing to partition or format any storage devices.

#### Step 1 - Picking VM Software
Pick a virtualisation software you wish to run Linux in, below are a few options:
- [VMWare Workstation Pro](https://www.broadcom.com/)
    1. Go to [broadcom.com](https://www.broadcom.com/).
    1. In the upper right corner, select 'Support Portal'.
    1. Either log in by clicking 'Go To Portal' or '[Register](https://profile.broadcom.com/web/registration)'.
    1. Once logged in, go to [support.broadcom.com](http://support.broadcom.com/) if you're not redirected there.
    1. Click the dropdown at the top right to choose the VMware Cloud Foundation.
    1. Click 'My Downloads'
    1. The click 'Free Software Downloads available HERE'.
    1. Click the product name (VMware Fusion or VMware Workstation Pro).
    1. Pick your operating system.
    1. Pick the version of the software you want. E.g. 17.6.3
    1. Finally download and install


- [Microsoft Hyper-V (Requires Windows Pro License)](https://techcommunity.microsoft.com/blog/educatordeveloperblog/step-by-step-enabling-hyper-v-for-use-on-windows-11/3745905)
- [VirtualBox](https://www.virtualbox.org/)
- [QEMU](https://www.qemu.org/download/)

#### Step 2 - Download ISO
Download the Arch Linux ISO file from the offcial website only which can be found [here](https://archlinux.org/download/). Make sure you pick a region near you.

#### Step 3 - Setuping up a virtual machine
I'm using the [VMWare Workstation Pro](https://www.broadcom.com/) software so this section will talk you through how to use it, if you're using something else then your steps will vary.

- Click File
- Click New Virtual Machine (Ctrl + N)
- Stay with the 'Typical (recommended) option and press next.
- Select 'Installer disc image file (iso)' and pick the ISO file you just downloaded, then press next.
- Select Linux for the Guest operating system then press next. 
- Give it any name you'd like and leave the location as default.
- Leave the disk capacity as 'split virtual disk into multiple files' then press next.
- You can optionally customize hardware but this will depend on your computer specs. The more resources you allocate the better the virtual machine will run depending on what you're doing on it but don't allocate everything as your Windows system requires resources too.
- Finally press finish.

#### Step 4 - Start virtual machine
Start the virtual machine and move onto the next section [Arch Linux Install Process](#Arch-Linux-Install-Process)

### Option 2: Bare Metal

This option is best for daily use and without the overhead of using a virtual machine.

Here you will need to either have a dedicate storage device or partition an existing one to install Arch Linux onto.

#### Step 1 - USB Drive
Make sure that you have an 8GB or higher USB key/pendrive/memory stick and connect it to your computer.

#### Step 2 - Picking a USB Formatting Utility Software
Pick a USB formatting utility you wish to use to create a bootable USB flash drive, below are a few options:
- [balenaEtcher](https://etcher.balena.io/)
- [Rufus](https://rufus.ie/en/)

#### Step 3 - Download ISO
Download the Arch Linux ISO file from the offcial website only which can be found [here](https://archlinux.org/download/). Make sure you pick a region near you.

#### Step 4 - Formatting USB
- Launch balenaEtcher or Rufus.
- Select your USB device.
- Select the Arch Linux ISO you just downloaded.
- Leave the settings as they are.
- Then start formatting the USB device.

#### Step 5 - Booting from the USB
- Restart your computer and enter your BIO settings (use ESC, F8, F9, F10, F12).
- Enable USB Boot.
- Change your UEFI Boot Order so that the USB device is the primary (first) in the boot list.
- Disable Secure Boot.
- Save the changes and reboot the computer.

#### Step 6 - CLI Environment
You will now be in the CLI Environment, move onto the next section [Arch Linux Install Process](#Arch-Linux-Install-Process)

![---](https://github.com/senkawolf/Beginner-Exploring-Arch-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Arch Linux Install Process</h2>
Now we will be going through the install process of Arch Linux, follow the steps below.
 
> [!TIP]
> To increase the font size type the command `setfont ter-132n`.
> 
> To change it back to the default type `setfont`.
> 
> If you want to clear the console screen you can by pressing `Ctrl + L` this can help declutter the console to make it easier to follow along.

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

![---](https://github.com/senkawolf/Beginner-Exploring-Arch-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">chroot Environment</h2>
Now we are in the chroot environment where we can install useful tools before booting into the desktop environment. These tools are optional, the tools are separated by spaces in the below command.

- `pacman -Sy enchant mythes-en ttf-liberation hunspell-en_GB ttf-bitstream-vera adobe-source-sans-pro-fonts gst-plugins-good ttf-droid ttf-dejavu aspell-en icedtea-web gst-libav ttf-ubuntu-font-family ttf-anonymous-pro jre8-openjdk languagetool libmythes firefox libreoffice-fresh vlc`

- Now type `exit` to exit the chroot environment.
- Finally type `shutdown now`.
- If you installed Arch Linus onto bare metal remove the bootsable USB and turn on the computer.

![---](https://github.com/senkawolf/Beginner-Exploring-Arch-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Fix Discover app backend</h2>
The Discover application helps you find and install applications, games, and tools from multiple sources. If you try to launch the application you will get a error saying that Arch Linus is not configured for installing apps through Discover. 

To fix this we need to install Flatpak and use it as a backend for Dicover:
- Open konsole.
- Type `sudo pacman -Sy`.
- Input your password.
- Type `sudo pacman -Sy flatpak`.
- Press y for any prompts.

Now the Discover app will work.

![---](https://github.com/senkawolf/Beginner-Exploring-Arch-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Tweaks and Improvements</h2>

#### Configure pacman <sup>[Wiki](https://wiki.archlinux.org/title/Pacman)</sup>
Here we are going to improve the visuals of pacman.

- Type `sudo nano /etc/pacman.conf`
- Scroll down the file until you see a line `#Color` and remove the hashtag.
- Add a new line under `Color` and type `ILoveCandy`.
- Press Ctrl + O to save the file.
- Press Ctrl + X to close the nano editor.
- Then run `sudo pacman -Syu` to make the changes take effect.


Optional: If you have a good computer and internet connection then remove the hashtag in front of `ParalleDownloads = 5` so pacman will download several packages at the simultaneously.

---

#### Make bash colorful
Here we will make the terminal more colourful, this involves downloading a premade colour scheme.

> [!NOTE]  
> This terminal colour scheme was made by [Average Linux User](https://averagelinuxuser.com/).

- Download [Linux_terminal_color.zip](https://averagelinuxuser.com/assets/images/posts/2019-01-18-linux-terminal-color/Linux_terminal_color.zip).
- Type `sudo pacman -S unzip` to install unzip.
- Type `cd Downloads/`
- Type `unzip Linux_terminal_color.zip`
- Then type:
```bash
sudo mv bash.bashrc /etc/bash.bashrc
sudo mv DIR_COLORS /etc/
mv .bashrc ~/.bashrc
```
- Close and reopen Konsole.

---

#### Automatic package cache cleaning <sup>[Wiki](https://wiki.archlinux.org/title/Pacman#Cleaning_the_package_cache)</sup>
Downloading package updates can take up a large amount of space over time, this will automatically clear the cache for you. The below instructions will clear the cache weekly but leave 3 of the most recent versions of each package incase you need to downgrade anything.

```
$ sudo pacman -S pacman-contrib
$ sudo systemctl enable paccache.timer
```

---

#### Installing AUR Helper <sup>[Wiki](https://wiki.archlinux.org/title/Arch_User_Repository)</sup>
The Arch User Repository (AUR) is a communuty-drive repository of packages. If a package isn't in the official Arch repository it most likey found in the AUR.

```
$ sudo pacman -S --needed base-devel git
$ mkdir Programs
$ cd Programs/
$ git clone https://aur.archlinux.org/yay.git
$ cd yay/
$ makepkg -si
```

---

#### Create user folders <sup>[Wiki](https://wiki.archlinux.org/title/XDG_user_directories)</sup>
By default you don't get the common folders like pictures, videos etc like you do in Windows. Here is a easy way to create them without having to do it manually.

```
$ sudo pacman -S xdg-user-dirs
$ xdg-user-dirs-update
```

#### Install microcode <sup>[Wiki](https://wiki.archlinux.org/title/Microcode)</sup>
Microcode is a essential part of our CPU's functionality so it's important that it's secure and up to date. Make sure you install the packages based on if you have a AMD or Intel CPU.

Intel: `sudo pacman -S intel-ucode`

AMD: `sudo pacman -S amd-ucode`

---

#### Disable GRUB delay
To speed up your boot process you can disable the GRUB screen and boot into Arch Linux right away. If you need the GRUB screen you can get to it by holding ESC key whilst booting your virtual machine or computer.

- Type `sudo nano /etc/default/grub`
- Scroll down the file to the line `GRUB_TIMEOUT_STYLE=menu`.
- Edit where it says 'menu' to 'hidden' `GRUB_TIMEOUT_STYLE=hidden`.
- Press Ctrl + O to save.
- Press Ctrl + X to exit.
- Type `sudo grub-mkconfig -o /boot/grub/grub.cfg`
- Type `sudo reboot now`

---

#### Set up firewall <sup>[Wiki](https://wiki.archlinux.org/title/Uncomplicated_Firewall)</sup>
Almost all Linux distributions come with a inactive firewall. The Linux kernel has a built-in firewall and technically all Linux distros have this but it is not configured and activated. Linux is still secure even without an active firewall. By default, most of the distributions have no open ports. It is better to be safe than sorry to add a firewall. A firewall does use some system resources, but not enought to make a impact and it adds an extra layer of security making it worth while.

> [!WARNING]
> Note that this will not work if iptables.service is also enabled.

```
$ sudo pacman -S ufw                    # To install ufw
$ sudo ufw enable                       # Enabled ufw
$ sudo ufw status verbose               # To check it's status to make sure it's active.
$ sudo systemctl enable ufw.service`    # To make it auto start with the system.
```

![---](https://github.com/senkawolf/Beginner-Exploring-Arch-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Themes</h2>

### My Setup
My setup uses the [Vivid Dark Global 6](https://store.kde.org/p/2133856) theme. As for Widgets AkA Plasmoids, it uses [Apdatifier](https://store.kde.org/p/2135796), [Netspeed](https://store.kde.org/p/2136505), [Quick Shutdown](https://store.kde.org/p/1288430) and [Toggle Overview](https://store.kde.org/p/2132554).

### Other Themes
- [Layan](https://github.com/vinceliuice/Layan-kde)

![---](https://github.com/senkawolf/Beginner-Exploring-Arch-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">Guides</h1>
> [!CAUTION]
> All links here unless specified are NOT affiliated with me.

- [Arch Linux Official Install Guide](https://wiki.archlinux.org/title/Installation_guide)
- [YouTube Video: How to Install Arch Linux](https://www.youtube.com/watch?v=LiG2wMkcrFE)

![---](https://github.com/senkawolf/Beginner-Exploring-Arch-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">Miscellaneous</h1>

<details>
 <summary>Sources</summary>
  
  - [Arch Linux](https://archlinux.org/)
  - [KDE Software](https://kde.org/)
  - [KDE Store](https://store.kde.org/browse/)
  - [XeroLinux](https://xerolinux.xyz/)
</details>

![---](https://github.com/senkawolf/Beginner-Exploring-Arch-Linux/blob/main/media/line.png?raw=true)

**[![ ](https://github.com/senkawolf/Beginner-Exploring-Arch-Linux/blob/main/media/up25.png) Back to Top](#Table-of-Contents)**