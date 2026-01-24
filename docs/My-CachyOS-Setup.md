**[![ ](https://github.com/senkawolf/Software-List/blob/main/media/icons/prev25.png?raw=true) Back](/README.md)**

<div align="center">

<img src="../media/logos/cachyos.png" />

<br>

[![Author](https://img.shields.io/badge/Author-Senka_Wolf-4044ee?style=for-the-badge)](https://github.com/silentz)
[![License](https://img.shields.io/badge/License-Apache--2.0-blue?style=for-the-badge)](./LICENSE.md)
![GitHub last commit](https://img.shields.io/github/last-commit/senkawolf/Software-List?style=for-the-badge)

</div>

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

## Table of Contents

<details>
 <summary>Expand Table Here</summary>

  - [My CachyOS Setup](#My-CachyOS-Setup)
    - [System Settings](#System-Settings)
    - [Software](#Software)
    - [Tweaks & Configs](#Tweaks-&-Configs)
</details>

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">My CachyOS Setup</h1>

Now we will be going through the install process of CachyOS, this will feel very familiar to a Windows setup.

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">System Settings</h2>


![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Software</h2>
Run the following commands in each section:

- Firmware: `sudo pacman -Sy`
- Tools: `sudo pacman -Sy flatpak yay cachy-update zen-browser code git github-cli qbittorrent mythes-en ghostty gparted`
- Social: `sudo pacman -Sy discord`
- Creative: `sudo pacman -Sy obs-studio krita`
- Office: `sudo pacman -Sy wps-office`
- Gaming: `sudo pacman -Sy cachyos-gaming-meta cachyos-gaming-applications`

If you'd like a explanation on the code above or what each package is go [here](../docs/Arch-Package-Installation-Basics.md).

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Tweaks & Configs</h2>

#### CachyOS Update Config <sup>[GitHub](https://github.com/CachyOS/cachy-update)</sup>
Once CachyOS Update is installed you should start it automatically at boot using the following command.

```console
$ arch-update --tray --enable
```
> [!NOTE]
> If you have used the CachyOS Hello GUI and checked "Cachy Update enabled" you don't need to follow this setup.
> ![Cachy Hello Screenshot](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/screenshots/CachyOS-Hello-Cachy-Update.png?raw=true)

#### Configure Fastfetch <sup>[GitHub](https://github.com/fastfetch-cli/fastfetch)</sup>
In the `../files/fastfetch` folder copy the config and the logo to `~/.config/fastfetch/`. You might need to create the folder using `fastfetch --gen-config` or just `mkdir`.

---

#### Automatic package cache cleaning <sup>[Wiki](https://wiki.archlinux.org/title/Pacman#Cleaning_the_package_cache)</sup>
Downloading package updates can take up a large amount of space over time, this will automatically clear the cache for you. The below instructions will clear the cache weekly but leave 3 of the most recent versions of each package incase you need to downgrade anything.
```console
$ sudo systemctl enable paccache.timer
```

#### GitHub CLI Setup <sup>[Manual](https://cli.github.com/manual/)</sup>

Run the command:
```console
$ gh auth login #Then authenticate using your browser.
```
After authenticating onfigure the following:
```console
$ git config --global user.email "senkawolf@example.com"
$ git config --global user.name "SenkaWolf"
$ git config --global init.defaultBranch main
```

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

**[![ ](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/icons/up25.png) Back to Top](#Table-of-Contents)**
