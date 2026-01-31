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
    - [Visuals](#Visuals)
</details>

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h1 align="center">My CachyOS Setup</h1>

Now we will be going through the install process of CachyOS, this will feel very familiar to a Windows setup.

![My Desktop](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/screenshots/My-Desktop.png?raw=true)

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">System Settings</h2>


![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Software</h2>
Run the following commands in each section using pacman:

- Firmware: `sudo pacman -Sy`
- Tools: `sudo pacman -Sy flatpak yay cachy-update zen-browser code git github-cli stow qbittorrent ghostty htop btop gparted openrgb`
- Social: `sudo pacman -Sy discord`
- Creative: `sudo pacman -Sy obs-studio krita`
- Office: `sudo pacman -Sy wps-office mythes-en ttc-iosevka vlc`
- Gaming: `sudo pacman -Sy cachyos-gaming-meta cachyos-gaming-applications`

If you'd like a explanation on the code above or what each package is go [here](../docs/Arch-Package-Installation-Basics.md).

- AUR Installs: `yay -S ttf-raleway ungoogled-chromium-bin`

### Other install methods:

#### OpenDeck <sup>[GitHub](https://github.com/nekename/OpenDeck)</sup>
```console
$ paru --version
$ paru -S opendeck-bin
$ sudo usermod -aG uucp,input $USER #Appendix
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
```
Appendix: This is important due to streamdeck being a HID device.
- uucp → raw USB device access
- input → HID devices (Stream Deck is HID)

> [!NOTE]
> You can use this method but I recommend the above.
> ```console
> $ bash -c 'bash <(curl -sSL https://raw.githubusercontent.com/nekename/OpenDeck/main/install_opendeck.sh)'
> ```

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

#### Number Lock on startup <sup>[Arch Wiki](https://wiki.archlinux.org/title/Activating_numlock_on_bootup#KDE_Plasma)</sup>

Eiter run the below command or navigate to System Settings > Keyboard.

```console
$ systemsettings kcm_keyboard
```

![KDE Plasma Keyboard System Settings Screenshot](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/screenshots/KDE-Plasma-Keyboard-System-Settings.png?raw=true)

Then change NumLock on startup to Turn On.

#### Configure Fastfetch <sup>[GitHub](https://github.com/fastfetch-cli/fastfetch)</sup>
In the `../files/fastfetch` folder copy the config and the logo to `~/.config/fastfetch/`. You might need to create the folder using `fastfetch --gen-config` or just `mkdir`.

---

#### Automatic package cache cleaning <sup>[Wiki](https://wiki.archlinux.org/title/Pacman#Cleaning_the_package_cache)</sup>
Downloading package updates can take up a large amount of space over time, this will automatically clear the cache for you. The below instructions will clear the cache weekly but leave 3 of the most recent versions of each package incase you need to downgrade anything.
```console
$ sudo systemctl enable paccache.timer
```

---

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

<h2 align="center">Visuals</h2>

#### Plasma Theme <sup>[Arch Wiki](https://wiki.archlinux.org/title/KDE#Themes)</sup>

Find a theme you like from [here](https://www.pling.com/browse?cat=104&ord=latest). I like [Magna-Dark-Plasma](https://www.pling.com/p/2102246/) so I will use this.

Download the file then extract/unzip the file and ensure it follows the below layout:

```
📦 Magna-Dark-Plasma
├─ folders
├─ colors
└─ metadata.desktop
```

If this looks correct then run the following commands to move the file and open system settings:
```console
$ mv ~/Downloads/Magna-Dark-Plasma ~/.local/share/plasma/desktoptheme/
$ systemsettings
```
Then navigate to Colours & Themes > Plasma Style and then select the one you just installed.

---

#### Custom Plasma Color Schemes <sup>[Arch Wiki](https://wiki.archlinux.org/title/KDE#Themes)</sup>

Find a color scheme you like from [here](https://www.pling.com/browse?cat=112&ord=latest). I like [Magna-Violet-Dark-Colorscheme](https://www.pling.com/p/2102231/) so I will use this.

Download the file and ensure it follows the below layout:

```
📦 MagnaVioletDarkColorscheme.colors
```

If this looks correct then run the following commands to move the file and open system settings:
```console
$ mv ~/Downloads/MagnaVioletDarkColorscheme.colors ~/.local/share/color-schemes/
$ systemsettings
```
Then navigate to Colours & Themes > Colours and then select the one you just installed.

---

#### Custom Window Decorations Aurorae <sup>[Arch Wiki](https://wiki.archlinux.org/title/KDE#Themes)</sup>

Find a color scheme you like from [here](https://www.pling.com/browse?cat=717&ord=latest). I like [Magna-Dark-Aurorae-6](https://www.pling.com/p/2134194/) so I will use this.

Download the file then extract/unzip the file and ensure it follows the below layout:

```
📦 Magna-Dark-Aurorae-6
├─ svg files
└─ metadata.desktop
```

If this looks correct then run the following commands to move the file and open system settings:
```console
$ mv ~/Downloads/Magna-Dark-Aurorae-6 ~/.local/share/aurorae/themes/
$ systemsettings
```
Then navigate to Colours & Themes > Window Decorations and then select the one you just installed.

---

#### Icon Theme <sup>[Arch Wiki](https://wiki.archlinux.org/title/Icons)</sup>

Find a icon pack you like from [here](https://www.pling.com/browse?cat=132&ord=latest). I like [Slot Nord Dark Colorize Icons](https://www.pling.com/p/2338310) so I will use this.

> [!NOTE]
> [Azure Dark Icons](https://www.pling.com/p/2148992/)

Download the file then extract/unzip the file and ensure it follows the below layout:

```
📦 Slot-Nord-Dark-Colorize-Icons
├─ Multiple folders
└─ index.theme
```

If this looks correct then run the following commands to move the file and open system settings:
```console
$ mv ~/Downloads/Azure-Dark-Icons ~/.local/share/icons/
$ systemsettings
```
Then navigate to Colours & Themes > Icons and then select the one you just installed.

---

#### Cursor Theme <sup>[Arch Wiki](https://wiki.archlinux.org/title/Cursor_themes)</sup>

Find a cursor pack you like from [here](https://store.kde.org/browse?cat=107&ord=latest). I like [Future-dark cursors](https://store.kde.org/p/1457884) so I will use this.

Download the file then extract/unzip the file and ensure it follows the below layout:

```
📦 Future-dark-cursors
├─ cursors
└─ index.theme
```
If this looks correct then run the following commands to move the file and open system settings:
```console
$ mv ~/Downloads/Future-dark-cursors ~/.local/share/icons/
$ systemsettings
```
Then navigate to Colours & Themes > Cursors and then select the one you just installed.

---

#### Custom Splashscreen <sup>[Arch Wiki](https://wiki.archlinux.org/title/KDE#Themes)</sup>

Find a plashscreen you like from [here](https://www.pling.com/browse?cat=716&ord=latest). I like to disable this but I will give instructions on how to install one as I use to run the Magna Splash 6.

Download the file then extract/unzip the file and ensure it follows the below layout:

> [!NOTE]
> [Magna-Splash-6](https://www.pling.com/p/2136626)
> ```
> 📦 Magna-Splash-6
> ├─ contents
> └─ metadata.json
> ```
> If this looks correct then run the following commands to move the file and open system settings:
> ```console
> $ mv ~/Downloads/Magna-Splash-6 ~/.local/share/plasma/look-and-feel/
> $ systemsettings
> ```

Then navigate to Colours & Themes > Splash Screen and then select the one you just installed or in my case I like to select none.

The splashscreen is the only customisation where you cannot edit the background image from the settings. So, if you want to edit the background image, go to the location below (remember to put your splashcreen name) and swap in a different image, ensuring it has the same name and file type as the original.

```console
$ cd ~/.local/share/plasma/look-and-feel/Magna-Splash-6/contents/splash/images
$ dolphin .
```

---

#### SDDM Login Themes <sup>[Arch Wiki](https://wiki.archlinux.org/title/KDE#Themes)</sup>

Find a icon pack you like from [here](https://store.kde.org/browse?cat=101&order=latest). I like [Azure-SDDM-6](https://store.kde.org/p/2149189) so I will use this.

Download the file then extract/unzip the file and ensure it follows the below layout:

```
📦 Azure-SDDM-6
├─ folders
├─ Main.qml
├─ metadata.desktop
└─ theme.conf
```

If this looks correct then run the following commands to move the file and open system settings:
```console
$ sudo mv ~/Downloads/Azure-SDDM-6 /usr/share/sddm/themes/
$ systemsettings
```
Then navigate to Colours & Themes > Login Screen (SDDM) and then select the one you just installed.

---

#### Custom Fonts <sup>[Arch Wiki](https://wiki.archlinux.org/title/KDE#Themes)</sup>
I like using the fonts iosevka and raleway and we installed these earlier in the [Software](#Software) section so now they just need setting up.

Go to System Settings > Text & Fonts > Fonts and change them to suit your preferences, mine are as follows:
- General: Raleway SemiBold 10pt
- Fixed width: Iosevka 10pt
- Small: Raleway SemiBold 8pt
- Toolbar: Raleway SemiBold 10pt
- Menu: Raleway ExtraBold 10pt
- WIndoww title: Raleway ExtraBold 10pt

![Font Settings](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/screenshots/Font-Settings.png?raw=true)

---

#### Plasma 6 Extensions Widgets (Plasmoids) <sup>[Arch Wiki](https://wiki.archlinux.org/title/KDE#Widgets)</sup>
Find any Plasma 6 extensions you like from [here](https://store.kde.org/browse?cat=705&ord=latest).

I'm doing to downwload and extract the below files:
- [KDE Modern Clock](https://store.kde.org/p/2135653)
- [plasmusic-toolbar](https://store.kde.org/p/2128143)
- [Resources monitor](https://store.kde.org/p/2143899)
- [Window Title Applet 6](https://store.kde.org/p/2129423)

Then open the terminal and cd to the extracted files or right click the folder and open the terminal:
```console
$ cd ~/Downloads/<widget directory> #Replace <widget directory> with the extracted folder name
$ kpackagetool6 --type Plasma/Applet --install .
$ # Then log out and back in again. Restarting plasmashell in the terminal isn't very reliable.
```

If you get an error saying it already exists or you are trying to update it then run the below:
```console
$ cd ~/Downloads/<widget directory> #Replace <widget directory> with the extracted folder name
$ kpackagetool6 --type Plasma/Applet --upgrade .
```

Or you can right click your panel and click "Add or Manage Widgets" then press "Get New" as shown in the below screenhot. You can then search for the widget name.

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/screenshots/Add-or-Manage-Widgets-Get-New.png?raw=true)

---

#### My Desktop Layout

To Be Completed.

I did use this [YouTube Video](https://www.youtube.com/watch?v=6UCI2OOkOk0) to help me figure out sizing for my primary monitor.

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

**[![ ](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/icons/up25.png) Back to Top](#Table-of-Contents)**
