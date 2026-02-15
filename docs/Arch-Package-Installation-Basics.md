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

  - [Arch Package Installation GUI Basics](#Arch-Package-Installation-GUI-Basics)
  - [Arch Package Installation Basics](#Arch-Package-Installation-Terminal/Console-Basics)
    - [Package installation Basics](#Package-Installation-Basics)
    - [Package Management Choices](#Package-Management-Choices)
</details>

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">Arch Package Installation GUI Basics</h1>

You don't have to install packages via a terminal/console. Depending on the desktop enviroment or distribution you are using you may have a pre-installed app manager. CachyOS comes bundled with Octopi, you can search for it in the start menu and will look like the below.

![Octopi screenshot](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/screenshots/CachyOS-octopi.jpg?raw=true)

Here you can search for packages to install, update or even remove all without needing to use or remember any commands.

Octopi is a very simple designed app manager however if you would like something which is more graphical then you can use Discover instead. Discover does not come pre-installed on CachyOS but is often installed on other distribution which use the KDE desktop enviroment. To get Discover simply install it via Octopi or `sudo pacman -Sy discover flatpak` in the terminal. Then you can search for it in the start menu.

![Discover screenshot](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/screenshots/Discover.jpg?raw=true)

> [!NOTE]
> GUI package managers are a bit of a niche on Arch based distros as Arch doesn’t ship a app store/app manager by default. Most GUIs are front-ends to pacman and/or AUR helpers rather than native, fully integrated stores like on Ubuntu or Fedora distros.

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">Arch Package Installation Terminal/Console Basics</h1>

This document explains the package installation commands used in my setup guides or personal setups.

I prefer to use pacman where possible to install packages however there are other options which I will outline further down the document.

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Package Installation Basics</h2>
Below is a breakdown of how the command works for installing packages:

```console
sudo pacman -Sy <packages>
```
- `sudo` - run the command with administrator privileges
- `pacman` - Arch Linux’s package manager
- `-S` - install packages
- `-y` - synchronize (refresh) the package database
- `<packages>` - one or more package names to install

> Any word appearing after -Sy is a package name. These can be replaced with any software you want to install.
> Multiple packages can be installed in a single command by listing them separated by spaces.

### My Common packages

| Package | Description | Package Manager |
| --- | --- | --- |
| `flatpak` | Universal, sandboxed application framework. | pacman |
| `yay` | AUR helper for installing packages from the Arch User Repository. | pacman |
| `snapper` | [Managing file system snapshots in Linux, primarily designed to work with the Btrfs file system](http://snapper.io/). | pacman |
| `snap-pac` |  Hooks and scripts that automatically create pre and post snapshots using Snapper before and after package transactions with Pacman. | pacman |
| `grub-btrfs` | Tool that enhances the GRUB bootloader by allowing you to boot into Btrfs snapshots. | pacman |
| `os-prober` | Tool for adding other distros to GRUB. | pacman |
| `irqbalance` |  [A daemon that helps distribute hardware interrupts across multiple processors in a system to improve performance](https://github.com/Irqbalance/irqbalance). | pacman |
| `cachy-update` | Update notifier & applier for CachyOS. | pacman |
| `zen-browser` | Minimalist web browser. | pacman |
| `stow` | [Symlink farm manager](https://www.gnu.org/software/stow/manual/). | pacman |
| `qbittorrent` | Lightweight BitTorrent client. | pacman |
| `ghostty` | GPU-accelerated terminal emulator. | pacman |
| `starship` | [Customizable prompt for any shell](https://starship.rs/). | pacman |
| `htop` | CPU process viewer. | pacman |
| `btop` | CPU process viewer. | pacman |
| `cpu-x` | Gathers information on main computer components. | pacman |
| `gparted` | Partition manager. | pacman |
| `openrgb` | RGB lighting control. | pacman |
| `k3b` | Disc burning. | pacman |
| `cmatrix` | Creates a 'Matrix'-style display with scrolling characters. | pacman |
| `strace` | [Diagnostic, debugging and instructional userspace utility](https://strace.io/). | pacman |
| `discord` | Voice, video, and text communication platform. | pacman |
| `obs-studio` | Screen recording and live streaming software. | pacman |
| `gpu-screen-recorder-ui` | A fullscreen overlay UI for GPU Screen Recorder in the style of ShadowPlay. | pacman |
| `krita` | Digital painting and illustration application. | pacman |
| `libreoffice-fresh` | Office suite. |
| `mythes-en` | English thesaurus files (used by office applications). | pacman |
| `ttc-iosevka` | [A font designed for writing code, using in terminals](https://github.com/be5invis/Iosevka). | pacman |
| `vlc` | Media player. | pacman |
| `ffmpeg` | Suite of libraries and programs for handling video, audio, and other multimedia files and streams. VLC can use this to play more file types. | pacman |
| `cachyos-gaming-meta` | This meta-package includes all necessary gaming libraries and dependencies. | pacman |
| `cachyos-gaming-applications` | This package contains tools and launchers like Steam, Lutris, and others. | pacman |
| `piper` | GTK+ application to configure gaming mice. | pacman |
| `retroarch` | Open-source frontend for emulators. | pacman |
| `code` | Visual Studio Code editor. | pacman |
| `git` | Distributed version control system. | pacman |
| `github-cli` | GitHub command-line interface (gh). | pacman |
| `mysql-workbench` | SQL IDE for mySQL. | pacman |
| `filezilla` | FTP Client. | pacman |
| `ttf-raleway` | Elegant sans-serif typeface font. | yay |
| `ungoogled-chromium-bin` | Ungoogled Chromium Browser. | yay |
| `qdirstat-bin` | Powerful disk usage analyzer. | yay |
| `qdiskinfo-bin` | Frontend for smartctl. | yay |
| `nordvpn-bin` | VPN service. | yay |
| `nordvpn-gui-bin` | Nord UI. | yay |
| `rustdesk-bin` | Remote access. | yay |
| `wtf` | [Personal information dashboard](https://github.com/wtfutil/wtf). | yay |
| `vicinae-bin` | [Focused launcher for your desktop](https://github.com/vicinaehq/vicinae). | yay |
| `github-desktop-bin` | Tool that simplifies your development workflow with Git. | yay |

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Package Management Choices</h2>

While Arch Linux provides multiple ways to install software, my setups primarily uses `pacman`, the native Arch package manager. Other options like AUR helpers (`yay`) and Flatpak exist, but `pacman` is preferred for core tools and system software.

### Why `pacman`?
- Native and officially supported – packages come directly from Arch maintainers.
- Predictable and consistent – integrates cleanly with the system and updates reliably.
- Simpler system state – avoids duplicate libraries or parallel runtimes.
- Easier troubleshooting – most Arch documentation assumes pacman-managed software.

### Alternatives
- AUR helpers (`yay`) - I use only for packages unavailable in the official repos. It does offers access to a larger set of software, but packages are user-maintained and require building from source.
- Flatpak – It is sandboxed applications with bundled dependencies. Useful for desktop apps that need isolation, but less native integration and higher disk usage.

#### Quick Comparison: Pacman vs AUR vs Flatpak
| Feature | Pacman | AUR (via `yay`) | Flatpak |
| --- | --- | --- | --- |
| **Source** | Official Arch repos | Arch User Repository (community) | Flatpak remote repositories |
| **Trust level** | High (maintainer-reviewed) | Medium (user-maintained) | High (sandboxed) |
| **System integration** | Full | Full | Partial (sandboxed) |
| **Updates** | `pacman -Syu` | `yay -Syu` | `flatpak update` |
| **Disk usage** | Minimal | Minimal | Larger (bundled runtimes) |
| **Use case in this setup** | Core tools & system software | Packages not in official repos | Optional desktop apps with sandboxing |
| **Ease of troubleshooting** | Easy | Moderate | Moderate |

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

**[![ ](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/icons/up25.png) Back to Top](#Table-of-Contents)**
