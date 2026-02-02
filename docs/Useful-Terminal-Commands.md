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

  - [Useful Terminal Commands](#Useful-Terminal-Commands)
</details>

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">Useful Terminal Commands</h1>

Here I will list a bunch of useful commands to make a central place to search for them. They are mostly notes to help me remember them all in my Linux exploring journey.


### 📁 File & Directory Management
| Command | Description                |
| ------- | -------------------------- |
| `ls`    | List files and directories |
| `cd`    | Change directory           |
| `pwd`   | Show current directory     |
| `tree`  | Show directory tree        |
| `cp`    | Copy files/directories     |
| `mv`    | Move or rename files       |

---

### 📄 File Viewing & Editing
| Command      | Description            |
| ------------ | ---------------------- |
| `cat`        | View file contents     |
| `less`       | Paginated file viewer  |
| `more`       | Basic file viewer      |
| `head`       | Show first lines       |
| `tail`       | Show last lines        |
| `watch`      | Run command repeatedly |
| `nano`       | Simple text editor     |
| `vim` / `vi` | Advanced text editor   |

---

### 🔍 Search & Text Processing
| Command  | Description       |
| -------- | ----------------- |
| `find`   | Search files      |
| `locate` | Fast file search  |
| `grep`   | Search text       |
| `awk`    | Pattern scanning  |
| `sed`    | Stream editor     |
| `cut`    | Extract columns   |
| `sort`   | Sort text         |
| `uniq`   | Remove duplicates |
| `wc`     | Word/line count   |

---

### 🧠 Process & System Monitoring
| Command   | Description             |
| --------- | ----------------------- |
| `ps`      | Show processes          |
| `top`     | Live process list       |
| `htop`    | Enhanced process viewer |
| `btop`    | Enhanced process viewer |
| `uptime`  | System run time         |
| `free`    | Memory usage            |
| `df`      | Disk usage              |
| `du`      | Directory size          |
| `kill`    | Stop a process          |
| `killall` | Kill by name            |

---

### 🌐 Networking
| Command | Description        |
| ------- | ------------------ |
| `ip a`  | Network interfaces |
| `ip r`  | Routing table      |
| `ping`  | Test connectivity  |
| `ss`    | Socket statistics  |
| `curl`  | HTTP requests      |
| `wget`  | Download files     |
| `scp`   | Secure copy        |
| `ssh`   | Remote login       |
| `nc`    | Netcat             |

---

### 📦 Package Management

#### Debian / Ubuntu (APT)
| Command       | Description         |
| ------------- | ------------------- |
| `apt update`  | Update package list |
| `apt upgrade` | Upgrade packages    |
| `apt install` | Install package     |
| `apt remove`  | Remove package      |

#### Fedora / RHEL (DNF)
| Command       | Description     |
| ------------- | --------------- |
| `dnf install` | Install package |
| `dnf update`  | Update packages |
| `dnf remove`  | Remove package  |

#### Arch Linux (Pacman)
| Command       | Description               |
| ------------- | ------------------------- |
| `pacman -Syu` | Update system             |
| `pacman -S`   | Install a package         |
| `pacman -R`   | Remove a package          |
| `pacman -Rs`  | Remove package and unneeded dependencies |
| `pacman -Rns` | Remove package, unneeded dependencies, and configuration files |
| `pacman -Ss`  | Search packages           |
| `pacman -Qi`  | Package information       |
| `pacman -Qs`  | Search installed packages |
| `pacman -Sc`  | Clean package cache       |

#### openSUSE (Zypper)
| Command          | Description          |
| ---------------- | -------------------- |
| `zypper refresh` | Refresh repositories |
| `zypper update`  | Update packages      |
| `zypper install` | Install a package    |
| `zypper remove`  | Remove a package     |
| `zypper remove --clean-deps` | Remove package and unused dependencies |
| `zypper search`  | Search for a package |
| `zypper info`    | Package information  |
| `zypper repos`   | List repositories    |

---

### 🔧 Disk & Hardware
| Command  | Description        |
| -------- | ------------------ |
| `lsblk`  | List block devices |
| `mount`  | Mount filesystem   |
| `umount` | Unmount filesystem |
| `blkid`  | Show UUIDs         |
| `dmesg`  | Kernel messages    |

---

### 📜 Logs & System Info
| Command       | Description      |
| ------------- | ---------------- |
| `journalctl`  | View system logs |
| `uname -a`    | Kernel info      |
| `hostnamectl` | Hostname info    |
| `lsusb`       | USB devices      |
| `lspci`       | PCI devices      |

---

### 🧰 Shell & Utilities
| Command   | Description            |
| --------- | ---------------------- |
| `history` | Command history        |
| `clear`   | Clear terminal         |
| `exit`    | Exit shell             |


![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

**[![ ](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/icons/up25.png) Back to Top](#Table-of-Contents)**
