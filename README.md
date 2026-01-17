<div align="center">

<img src="./media/linuxlogo.png" />

<br>

[![Author](https://img.shields.io/badge/Author-Senka_Wolf-4044ee?style=for-the-badge)](https://github.com/silentz)
[![License](https://img.shields.io/badge/License-Apache--2.0-blue?style=for-the-badge)](./LICENSE.md)
![GitHub last commit](https://img.shields.io/github/last-commit/senkawolf/Software-List?style=for-the-badge)

</div>

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

## Table of Contents

<details>
 <summary>Expand Table Here</summary>
  
  - [Beginner Exploring Linux](#Beginner-Exploring-Linux)
    - [Getting Started](#Getting-Started)
    - [Support and Feedback](#Support-and-Feedback)
  - [Prepairing for Installation](#Prepairing-for-Installation)
  - [Distributions](#Distributions)
</details>

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">Beginner Exploring Linux</h1>

### Getting Started
 This will be a collection of installation guides, notes and troubleshooting I've used whilst exploring and getting into Linux. I'm a rookie when it comes to Linux so this is isn't a fully comprehensive guide and I'm sure there will be mistakes along the way so don't view this as a tutorial.

### Support and Feedback
If you have any suggestions and corrections then please get involved through Github.

**Issues:** If you come across any problems or have specific questions, please open an issue on the Github repository.

**Pull Requests:** If you have improvements or additions to this document, feel free to submit a pull request.

### Post Format
Anything to do with the terminal (konsole) will be within fenced code blocks throughout all the document. The code lines will start with a dollar sign<sup>($)</sup> which illustrates terminal input and if the line has a suffix of a hashtag<sup>(#)</sup> then this will be a comment explaining the line.

Unless specified any steps which require confirmation with a 'y' or 'n' always confirm it with 'y'.

If there are multiple options, I’ll indicate my preferred choice with a star ![Star](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/star14.png?raw=true). Feel free to choose differently.

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">Prepairing for Installation</h1>

The initial setup is the same across all Linux Distros, follow the below for the initial setup steps then move onto the specific distro for further guidance.

<h2 align="center">Bare Metal or Virtual Machine</h2>

### Option 1: Virtual Machine
This option is best for experimenting without needing to partition or format any storage devices.

#### <sup>Option 1:</sup> Step 1 - Picking VM Software
Pick a virtualisation software you wish to run Linux in, below are a few options:
- [VMWare Workstation Pro](https://www.broadcom.com/) ![Star](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/star14.png?raw=true)
- [Microsoft Hyper-V (Requires Windows Pro License)](https://techcommunity.microsoft.com/blog/educatordeveloperblog/step-by-step-enabling-hyper-v-for-use-on-windows-11/3745905)
- [VirtualBox](https://www.virtualbox.org/)
- [QEMU](https://www.qemu.org/download/)

#### <sup>Option 1:</sup> Step 1.1 How to get VMWare Workstation Pro

##### Download
1. Download the software from [here](https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion).
2.  You will be redirected to Broadcom's website. Create an account or login if you have an account already.
3. Once logged in go to the 'My Downloads' section down the left hand side of the web page.
4. Then click on the 'Free Software Downloads available [HERE](https://support.broadcom.com/group/ecx/free-downloads)'
5. Scroll down the page and to go '[VMware Workstation Pro](https://support.broadcom.com/group/ecx/productdownloads?subfamily=VMware%20Workstation%20Pro&freeDownloads=true)'
6. Then select the latest version then select the latest release.
7. You will now see a screen with '☐ I agree to the [Terms and Conditions](https://www.broadcom.com/company/legal/licensing)' you can't tick this until you have opened the Terms and Conditions page. Click the link and they will open in a new tab. Close the tab and you will now be able to tick the Terms and Conditions.
8. Now you will be able to click the download button (cloud icon ![Broadcoom download icon](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/broadcoom-download-icon.png?raw=true)).
9. You will then get a popup stating additional verification is required. Click yes then fill in the form.
10. You will be returned to the previous page. Press the download button (cloud icon ![Broadcoom download icon](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/broadcoom-download-icon.png?raw=true)) again and now the download will begin.
11. <span style="color: #E74C3C;"><b>Before installing the exe file move onto the next section!</b></span>

---
##### Before installing
Some of the following steps will help prevent issues when installing/setting up virtual machines.

##### Windows Features
If you have either of the below enabled on your PC then VMWare won't be able to use CPU hardware virtualilasion directly so your virtual machines will run slower.
- Windows Hyper-V
- Virtual Machine Platform
- Windows Hypervisor Platform
- Windows Sandbox
- Windows Subsystem for Linux

To do this:
1. Search for 'Turn Windows features on or off' from your taskbar/menu.
2. Then scroll through the list and ensure the above options are unchecked then press Ok.
3. Reboot your PC.

##### BIOS
Ensure you have CPU Virtualisation enabled in your BIOS, check this by:
1. Opening Task Manager by right clicking your taskbar.
2. Go to the ![Performance Icon](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/windows-performance-icon.png?raw=true) performance tab.
3. Under CPU it should say Virtualisation followed by enabled or disabled. If it is enabled you don't need to do anything however if it is disabled continue with the steps.
4. Restart your PC and access your BIOS.
5. In the BIOS you need to look for either of the following:
    - Intel CPU: Intel Virttualisation Technology or Intel VT-x.
    - AMD CPU: Secure Virtual Machine, or AMD-V, or AMD SVM.

> [!NOTE]
> Consult your motherboard manufactures website on how to access the BIOS and locate the CPU Virtualisation setting if you need further assistance.


#### <span style="color: #2ECC71;">Install VMware Workstation Pro from the file downloaded earlier.</span> 
---

#### <sup>Option 1:</sup> Step 2 - Download ISO
Download the ISO file for the Linux distro of your choice. Use the [Distributions](#Distributions) section for ones I have explored.

#### <sup>Option 1:</sup> Step 3 - Setuping up a virtual machine
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

#### <sup>Option 1:</sup> Step 4 - Start virtual machine
Start the virtual machine and move onto the next section [Distributions](#Distributions).

### Option 2: Bare Metal

This option is best for daily use and without the overhead of using a virtual machine.

Here you will need to either have a dedicate storage device or partition an existing one to install Arch Linux onto.

#### <sup>Option 2:</sup> Step 1 - USB Drive
Make sure that you have an 8GB or higher USB key/pendrive/memory stick and connect it to your computer.

#### <sup>Option 2:</sup> Step 2 - Picking a USB Formatting Utility Software
Pick a USB formatting utility you wish to use to create a bootable USB flash drive, below are a few options:
- [balenaEtcher](https://etcher.balena.io/)
- [Rufus](https://rufus.ie/en/)
- [Ventoy](https://www.ventoy.net/en/index.html) ![Star](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/star14.png?raw=true)

#### <sup>Option 2:</sup> Step 3 - Download ISO
Download the ISO file for the Linux distro of your choice. Use the [Distributions](#Distributions) section for ones I have explored.

#### <sup>Option 2:</sup> Step 4 - Formatting USB
- Launch balenaEtcher, Rufus or Ventoy.
- Select your USB device.
- Select the ISO file you just downloaded.
- Leave the settings as they are.
- Then start formatting the USB device.

#### <sup>Option 2:</sup> Step 5 - Booting from the USB
- Restart your computer and enter your BIO settings (use ESC, F8, F9, F10, F12).
- Enable USB Boot.
- Change your UEFI Boot Order so that the USB device is the primary (first) in the boot list.
- Disable Secure Boot.
- Save the changes and reboot the computer.

#### <sup>Option 2:</sup> Step 6 - CLI/GUI Environment
Now you will be in a CLI Environment or GUI. Move onto the next section [Distributions](#Distributions).

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">Distributions</h1>

This is a list of distributions which I have explored when learning Linux. Pick the option you have chosen to install.
   
<sub>In alphabetical order.<sub>

- [Arch](/docs/Arch-Linux.md)
- [CachyOS]() <sub>Coming Soon<sub>
- [Mint]() <sub>Coming Soon<sub>
- [Nobara]() <sub>Coming Soon<sub>
- [openSUSE Tumbleweed](/docs/openSUSE-Tumbleweed.md)

**[![ ](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/up25.png) Back to Top](#Table-of-Contents)**