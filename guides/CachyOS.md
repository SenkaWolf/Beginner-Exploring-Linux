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

  - [CachyOS Install Process](#CachyOS-Install-Process)
        - [Troubleshooting](#Troubleshooting)
        - [Tweaks and Improvements](#Tweaks-and-Improvements)
  - [Guides](#Guides)
  - [Miscellaneous](#Miscellaneous)
</details>

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">CachyOS Install Process</h2>

Now we will be going through the install process of CachyOS, this will feel very familiar to a Windows setup.

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Troubleshooting</h2>

#### VM Install - Asking for liveuser password
When booting from a USB media to instal CachyOS on a virtual machine you may be greeted by the below screen.

![Live User Login Screen Screenshot](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/screenshots/CachyOS-liveuser-Login.png?raw=true)

CachyOS doesn't set passwords by default and there is no password. To get past the login screen switch your session to wayland then press enter with no password inputted and this will take you to the live desktop.

---

#### System Freezes During Package Building - Out of Memory (OOM) <sup>[Wiki](https://en.wikipedia.org/wiki/Magic_SysRq_key)</sup>
The Magic SysRq key is a powerful low-level feature in Linux that allows you to perform various commands directly to the kernel, even if the system seems completely unresponsive. It’s extremely useful for troubleshooting and safely recovering from system crashes.

This requires the SysRq functionality to be enabled in the kernel:
Check by running

```console
$ cat /proc/sys/kernel/sysrq
```
Below are the expected results:
| Bit Value | Function |
| --- | --- |
| 0 | Disabled |
| 1 | `0x1` → Fully Enable |
| 2 | `0x2` → Enable `sync` (`s`) |
| 4 | `0x4` → Enable `remount read-only` (`u`) |
| 8 | `0x8` → Enable `process signals` (`e` and `i`) |
| 16 | `0x10` → Enable reboot/poweroff (`b` and `o`) |
| 32 | `0x20` → Enable `unraw` (`r`) |
| 64 | `0x40` → Enable `debug dumps` (`p`,` m`) |

You want this to return `1` so all features are enabled. To change this run the following command.

```console
$ sudo nano /etc/sysctl.d/99-sysrq.conf
$ #Then add the below line to the file and save
$ kernel.sysrq = 1
$ sudo sysctl --system #Apply the changes
$ cat /proc/sys/kernel/sysrq # Verify the changes, this should show 1 now.
```

Now you can fully use the Magic SysRq key feature, to do this you use the key combination:
- `Alt + SysRq (Print Screen) + <command key option>`

| Command Key | Action | Notes |
| --- | --- | --- |
| `r` | Switch keyboard from raw to XLATE mode | Fixes frozen input |
| `e` | Send SIGTERM to all processes | Graceful shutdown attempt |
| `i` | Send SIGKILL to all processes | Forces processes to quit |
| `s` | Sync all filesystems | Flushes disk buffers |
| `u` | Remount all filesystems read-only | Prevents corruption |
| `b` | Reboot immediately | Hard reboot, does not sync disks |
| `o` | Power off immediately | Hard poweroff, does not sync disks |
| `t` | Dump task states | Useful for debugging frozen tasks |
| `m` | Show memory usage | Can help diagnose memory issues |
| `f` | Call OOM Killer on the current process | Useful if a single process is stuck |

##### Safe Shutdown Sequence – REISUB
- Mnemonic: “Raising Elephants Is So Utterly Boring”
- Sequence for safely rebooting a frozen system:
```python
Alt + SysRq + R  # Take control of keyboard
Alt + SysRq + E  # Send SIGTERM to processes
Alt + SysRq + I  # Send SIGKILL to processes
Alt + SysRq + S  # Sync filesystems
Alt + SysRq + U  # Remount filesystems read-only
Alt + SysRq + F  # Optional: kill current process if consuming all memory
Alt + SysRq + B  # Reboot
```

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Tweaks and Improvements</h2>


![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">Guides</h1>

> [!CAUTION]
> All links here unless specified are NOT affiliated with me.

  - [Official Installation Guide](https://wiki.cachyos.org/installation/installation_on_root/)
- [YouTube Video: How to dual boot and install CachyOS](https://www.youtube.com/watch?v=mVXONaHZvFU)

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">Miscellaneous</h1>

<details>
 <summary>Sources</summary>
  
  - [CachyOS](https://cachyos.org/)
</details>

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

**[![ ](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/icons/up25.png) Back to Top](#Table-of-Contents)**