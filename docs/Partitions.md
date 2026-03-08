**[![ ](https://github.com/senkawolf/Software-List/blob/main/media/icons/prev25.png?raw=true) Back](/README.md)**

<div align="center">

<img src="../media/logos/keyboard-shortcuts.png" />

<br>

[![Author](https://img.shields.io/badge/Author-Senka_Wolf-4044ee?style=for-the-badge)](https://github.com/silentz)
[![License](https://img.shields.io/badge/License-Apache--2.0-blue?style=for-the-badge)](./LICENSE.md)
![GitHub last commit](https://img.shields.io/github/last-commit/senkawolf/Software-List?style=for-the-badge)

</div>

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

## Table of Contents
<details>
 <summary>Expand Table Here</summary>

  - [Partitions](#Partitions)
    - [Use Cases](#Use-Cases)
    - [GParted](#GParted)
    - [Mounting & fstab](#Mounting-&-fstab)
    - [Directory Permissions](#Directory-Permissions)
</details>

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">Partitions</h1>

Partitions can be used to allow Linux operating system to manage sections of the drive as separate units. This organisation helps improve efficiency and can be used for various purposes, such as running multiple operating systems or organising files.

In this section I will explain how to use a tool called [GParted](https://gparted.org/) to grow/shrink drive space and create new partitions for organising files. Further more I will explain how to mount drives, auto mount, optimal mount settings and edit directory permissions.

> [!NOTE]
> You can use command line tools like `fdisk` and `parted` to achieve the same outcome however I don't have experience using these tools so they won't be covered. In the future I will learn them and update this document but for now I will only cover GParted.

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Use Cases</h2>

Some use cases for partitioning your drive can be for keeping your operation system on root `/` but then you can split your personal files and coding projects on another e.g. `/home`, and large game installations on a separate partition e.g `/games`. This makes it easier to reinstall the operation system without losing files and helps keep your system organised. This isi also helpful if you like to distro hop.

I will explain my current setup as an example.

I have three drives in my system: a 1 TB SSD for Windows, a 1 TB SSD for Linux, and a 2 TB SSD for games. The 2 TB drive is split into two 1 TB partitions so that both Windows and Linux can each use 1 TB for storing game files. All my personal files are stored externally so I don't need a partition for them.

In the future, I plan to move everything from my Windows installation onto a single 1 TB drive and dedicate the entire 2 TB drive to Linux. Since I now use Linux as my daily operating system, I need to remove anything from the Windows installation that I now handle on Linux, leaving only software that is exclusive to Windows and games that require kernel-level anti-cheat.

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">GParted</h2>


### Install
Ensure you have GParted installed, all my instructions are for Arch based distros:
```console
$ sudo pacman -Sy gparted
```

---

### GUI Explanation
Here is a rundown of the GParted GUI. Use the image below for reference.

In the top-right corner of the GParted window there is a dropdown menu that lists all storage devices currently connected to your system, including internal drives and any external devices such as USB drives. Selecting a device from this menu will display the partition layout for that specific drive.

The large visual bar in the main window shows a graphical representation of the selected drive and how its space is divided into partitions. Each colored block represents a partition, while empty areas represent unallocated space. You can right-click any partition in this graphical bar to perform actions such as resizing, formatting, or deleting it.

Below the graphical bar is a detailed partition list. This table shows more precise information about each partition, including its filesystem type, size, mount point, and flags. You can also right-click entries in this list to access the same actions available in the graphical view.

If a partition has a key or lock icon next to it, this indicates that the partition is currently mounted and in use by the operating system. Mounted partitions cannot be modified. In order to resize, move, or delete a partition, it must first be unmounted. However, the partition containing the currently running operating system cannot be unmounted because the system is actively using it. If you need to modify the partition that contains your operating system, you will typically need to boot into a live environment, such as a Linux live USB, and run GParted from there.

Secondary partitions that are not required by the system, such as a dedicated storage or gaming partition, can usually be unmounted safely as long as no files or programs are currently using them.

It is also important to understand that most actions performed in GParted are not applied immediately. Instead, they are added to a queue of pending operations. You can review these operations before committing them. Changes are only executed when you click the Apply button in the toolbar. This design helps prevent accidental modifications and allows you to cancel operations before they are performed.

Because partitioning modifies how data is stored on a disk, there is always some risk involved. Before making any changes with GParted, it is strongly recommended to back up any important data to prevent potential data loss.

![GParted Screenshot Annotated](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/screenshots/GParted-Explained.png?raw=true)

---

### Splitting a secondary drive into multiple partitions

In this section I will explain how to split a drive into multiple partitions by resizing the existing one and creating a new one. Please note I don't have a empty drive so I will be using one with a in use partition but I will edit the image to hide this fact to give you the best representation.

Go to the drive you want to split and make sure it is not mounted (there should be no key icon next to it). If a key icon is shown, first confirm that the drive is not the one your operating system is currently running on.

If it isn’t, simply right-click the drive and select “Unmount”.

Once the drive is unmounted, right-click it again and choose “Resize/Move”.

![GParted Screenshot Resize/Move Annotated](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/screenshots/GParted-Resize-move.png?raw=true)

Now you will have a popout window where you can either drag from either end of the bar to resize it or type into the "New size (MiB)" field. I will split this evenly down the middle then press "Resize/Move".

![GParted Screenshot Popout](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/screenshots/GParted-Resize-move-popout.png?raw=true)

Now you will see the pending changes to the partitions. To finalise press the green check mark.

![GParted Screenshot Change Pending](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/screenshots/GParted-Resize-change-pending.png?raw=true)

This now leaves you with a unallocated space on the drive which we can now add a new partition onto. Right click on the unallocated space and select "New". Select the size you wish to allocate to the partition then set the file system to "btrfs" and give it a partition name and label.

![GParted Screenshot New Partition](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/screenshots/GParted-new-partition.png?raw=true)

Now you have your new partition you still have a few more steps. Go to the [Mounting & fstab](#Mounting-&-fstab) section.

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Mounting & fstab</h2>

Now that we have partitioned the drive we need to mount the drive and add it to fstab so it automatically mounts on boot so we can access it.

Go through each section and run the commands, comments will be added to explain each section.

Here we will verify the partition information which will be needed at a later step.
```console
$ lsblk -f #Verify the partition exists
$ 
$ #You should see something like:
$ NAME         FSTYPE FSVER LABEL   UUID
$ nvme1n1 
$  ├─nvme1n1p1 btrfs                c4baba97-5f98-4da1-b8ab-ce7250df1995
$  └─nvme1n1p2 btrfs        example 1ba67418-f9c0-42a9-ae82-2dec3196d747
```
Now we will mount the drive.
```console
$ sudo mkdir /mnt/example #Create a directory for the mount point. Change example to whatever you would like.
$ sudo mount /dev/nvme1n1p2 /mnt/example #Now we will mount the drive. Remember to change the drive name and directory.
```
Now we need to add the partition to `/etc/fstab` for automatic mounting
```console
$ blkid /dev/nvme1n1p2 #Change the drive name. This gets the UUID.
$ 
$ #You should see something like:
$ /dev/nvme1n1p2: LABEL="example" UUID="1ba67418-f9c0-42a9-ae82-2dec3196d747"
$ 
$ sudo nano /etc/fstab #Edit fstab file
```
Now go to the bottom of the file and add:
`UUID=1ba67418-f9c0-42a9-ae82-2dec3196d747  /mnt/example  btrfs  defaults,noatime,compress=zstd  0  0`. Remember to change the UUID and the "example" to suit your setup, then Ctrl + O then enter to save changes.

The above adds the unique ID (UUID) of the drive, the mount point (/mnt/), file system type (btrfs) and some common btfrs options to the fstab file which will now automatic mount the drive when you turn on your computer.

Common Btrfs options:
- `defaults` - Shorthand for a standard set of mount options the kernel applies if you don't specify anything special.
- `compress=zstd` - recommended compression.
- `noatime` - reduces writes, good for SSDs.

Now move onto the final step [Directory Permissions](#Directory-Permissions).

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Directory Permissions</h2>

Finally when you mount a filesystem from `fstab`, the mountpoint directory is owned by root, so normal users can't write to it so in turn can cause applications being unable to write to it as well.

Go through each section and run the commands, comments will be added to explain each section. Remember to change "example" to suit your setup.

```console
$ ls -ld /mnt/example #Check ownership
$ 
$ #You should see something like this which means only root can write.
$ drwxr-xr-x root root
$ 
$ sudo chown -R $USER:$USER /mnt/example #Change ownership to your user
$ ls -ld /mnt/example #Check ownership again
$ 
$ #You should now see something like this (but your username):
$ drwxr-xr-x SenkaWolf SenkaWolf
```

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">Miscellaneous</h1>

<details>
 <summary>Sources</summary>
  
  - [TECHMIMIC YouTube Video](https://www.youtube.com/watch?v=Q1vybl1X3_s)
  - [ChatGPT](https://chatgpt.com)
</details>

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

**[![ ](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/icons/up25.png) Back to Top](#Table-of-Contents)**
