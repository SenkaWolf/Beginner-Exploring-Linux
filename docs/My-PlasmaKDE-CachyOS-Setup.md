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

This is a list of all the packages I have install on my system and changes I have made to personal my desktop.

![My Desktop](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/screenshots/My-Desktop.png?raw=true)


![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Software</h2>
Run the following commands in each section using pacman:

- Firmware: `sudo pacman -Sy`
- Tools: `sudo pacman -Sy flatpak yay snapper snap-pac grub-btrfs os-prober irqbalance cachy-update zen-browser stow qbittorrent ghostty starship htop btop cpu-x gparted openrgb k3b cmatrix strace`
- Social: `sudo pacman -Sy discord`
- Creative: `sudo pacman -Sy obs-studio gpu-screen-recorder-ui krita`
- Office: `sudo pacman -Sy libreoffice-fresh wps-office mythes-en ttc-iosevka ttf-fira-sans ttf-fira-code ttf-firacode-nerd vlc ffmpeg`
- Gaming: `sudo pacman -Sy cachyos-gaming-meta cachyos-gaming-applications piper retroarch`
- Coding: `sudo pacman -Sy neovim code git github-cli mysql-workbench filezilla ttf-font-awesome`
- Visuals: `sudo pacman -Sy kvantum`
- Widgets (Plasmoids) Dependencies: `sudo pacman -Sy cava qt6-websockets python-websockets`

If you'd like a explanation on the code above or what each package is go [here](../docs/Arch-Package-Installation-Basics.md).

Below aren't available through pacman so we will use AUR instead: 
- Firmware: `yay -Syu`
- Tools: `yay -S ttf-raleway ungoogled-chromium-bin qdirstat-bin qdiskinfo-bin nordvpn-bin nordvpn-gui-bin rustdesk-bin wtf vicinae-bin`
- Social: `yay -S fluxer-git`
- Coding: `yay -S github-desktop-bin`

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

#### Virtual Machine / Virtualisation <sup>[Wiki](https://wiki.cachyos.org/virtualization/qemu_and_vmm_setup/)</sup>

To install and start the services needed to use a VM run the below in your console:

```console
$ sudo pacman -Syy #Update packages
$ sudo pacman -S archlinux-keyring #Update keyring
$ sudo pacman -S qemu-desktop virt-manager virt-viewer dnsmasq vde2 openbsd-netcat ebtables iptables-nft #Install needed packages
$ sudo systemctl enable libvirtd.service #Start libvirt service
$ sudo systemctl start libvirtd.service
$ systemctl status libvirtd.service #Check that the service is running
```
Now we need to allow low-level users to use the VM. Edit the `/etc/libvirt/libvirtd.conf` file by navigating to it in your file explorer or from the terminal:

```console
$ sudo nano /etc/libvirt/libvirtd.conf
```

Go to line 85 and uncomment by removing the hashtag (#) from the begining:
```
unix_sock_group = "libvirt"
```

Then go to line 108 and uncomment by removing the hashtag (#) from the begining:
```
unix_sock_rw_perms = "0770"
```

Now we need to add our user to the `libvirt` group.
```console
$ sudo usermod -a -G libvirt $(whoami)
$ sudo systemctl restart libvirtd.service #Restart libvirt deamon
```

**Enable Nested Virtualization (Optional)**

Nested Virtualization is the ability to run virtual machines inside virtual machines.
- Intel: `echo "options kvm-intel nested=1" | sudo tee /etc/modprobe.d/kvm-intel.conf`
- AMD: `echo "options kvm-amd nested=1" | sudo tee /etc/modprobe.d/kvm-amd.conf`

Now you can run the `virt-manager` command to open the GUI virtual machine manger, or you can open it through your DE application menu.

> [!NOTE]
> A shortcut to setting this up you can use [Linutil](https://github.com/ChrisTitusTech/linutil) which is a tool made by Chris Titus to simplify the install of certain applications.
> 
> Use the below command to open up the utility in your terminal.
> ```console
> $ curl -fsSL https://christitus.com/linux | sh
> ```
> 
> Watch this [video](https://www.youtube.com/watch?v=qOrHgEPCtWw) on how to use the above tool.


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
#### Starship Configuration <sup>[Website](https://starship.rs/config/)</sup>

Starship is a customizable prompt for a shell enviroment in a terminal.

To get started configuring starship, create the following file: `~/.config/starship.toml`.

```console
$ mkdir -p ~/.config && touch ~/.config/starship.toml #Create config file.
$ nano ~/.config/starship.toml #Edit File
```

Copy the content from the .toml file found in the [Tokyo Night Preset ](https://starship.rs/presets/tokyo-night) and save the changes.

CachyOS default shell is fish so to add starship to the shell edit the following file and add `starship init fish | source` to the end of the file.

```console
$ nano ~/.config/fish/config.fish
```

Now simply close and reopen your terminal to see the changes.

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

---

#### Uncomplicated Firewall (Ufw) Configuration <sup>[Wiki](https://wiki.archlinux.org/title/Uncomplicated_Firewall)</sup>

To allow certain programs to work you will need to open the below ports on the firewall:
```console
$ sudo ufw allow 1714:1764/udp #KDE Connect
$ sudo ufw allow 1714:1764/tcp #KDE Connect 
$ sudo ufw allow 53317/udp #LocalSend
$ sudo ufw allow 53317/tcp #LocalSend
$
$ sudo ufw reload #Run this after using any of the above.
```

---

#### Login Screen (SDDM) on Multi Monitors Setup Config <sup>[Wiki](https://wiki.archlinux.org/title/SDDM)</sup>

If you have a multi monitor setup and when you get to the login screen you find that your cursor may start on another monitor to your primary one or if you have a rotated display it displays incorrectly at the login screen but is corrected once logged in.

You can edit the SDDM config to display the correct rotation and change the priority of which monitor should be the primary when met with the login screen.

You can edit the file `/var/lib/sddm/.config/kwinoutputconfig.json` but to assist in editing this as it may not be clear which monitor is which you can use your local display configuration settings from the file `~/.config/kwinoutputconfig.json`. Use the reference from `edidHash` to compare the settings across the files.

**Wrong Rotation**
- Find the "edidHash" e.g `"edidHash": "ea0ebe39eb825dc64a3f770bc8b95bd1",`
- Look for the setting "transform" to get the correct orientation  `"transform": "Rotated90",`
- Copy this across from the local display settings to the SDDM file.

```json
        "data": [
            {
                "allowDdcCi": true,
                "allowSdrSoftwareBrightness": true,
                "autoRotation": "InTabletMode",
                "brightness": 1,
                "colorPowerTradeoff": "PreferEfficiency",
                "colorProfileSource": "sRGB",
                "connectorName": "HDMI-A-2",
                "detectedDdcCi": false,
                "edidHash": "ea0ebe39eb825dc64a3f770bc8b95bd1",
                "edidIdentifier": "ACR 714 1669380668 38 2016 0",
                "edrPolicy": "always",
                "highDynamicRange": false,
                "iccProfilePath": "",
                "maxBitsPerColor": 0,
                "mode": {
                    "height": 1080,
                    "refreshRate": 60000,
                    "width": 1920
                },
                "overscan": 0,
                "rgbRange": "Automatic",
                "scale": 1,
                "sdrBrightness": 200,
                "sdrGamutWideness": 0,
                "transform": "Rotated90",
                "uuid": "4aa0e7f9-f720-4ae9-ad08-c45589802f61",
                "vrrPolicy": "Never",
                "wideColorGamut": false
            },
        ],
```

**Wrong Primary**
Go towards the bottom of the config file and you will see the below section, everything grouped between the sets of `{}` brackets are the monitors and they go in the same order to the monitors in the section previously. All you need to do is change the priority starting from 0 upwards in the order you want them to be.

> [!NOTE]
> If you want to disable the monitor so it's just blank at the login screen simply change "enabled" to false. 

```json
        "data": [
            {
                "lidClosed": false,
                "outputs": [
                    {
                        "enabled": true,
                        "outputIndex": 0,
                        "position": {
                            "x": 0,
                            "y": 0
                        },
                        "priority": 2,
                        "replicationSource": ""
                    },
                    {
                        "enabled": true,
                        "outputIndex": 1,
                        "position": {
                            "x": 1920,
                            "y": 0
                        },
                        "priority": 0,
                        "replicationSource": ""
                    },
                    {
                        "enabled": true,
                        "outputIndex": 2,
                        "position": {
                            "x": 3840,
                            "y": 0
                        },
                        "priority": 1,
                        "replicationSource": ""
                    }
                ]
            }
        ],
```

Source: https://www.reddit.com/r/archlinux/comments/143b6we/how_to_display_login_screen_sddm_on_a_single/

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

<h2 align="center">Visuals</h2>

#### Plasma Theme <sup>[Arch Wiki](https://wiki.archlinux.org/title/KDE#Themes)</sup>

Find a theme you like from [here](https://www.pling.com/browse?cat=104&ord=latest). I like [Ant-Dracula KDE](https://store.kde.org/p/1370687/) so I will use this.

Download the file then extract/unzip the file and ensure it follows the below layout:

```
📦 Dracula/
    ├── metadata.desktop
    ├── colors
    ├── dialogs/
    │   └── background.svgz
    ├── icons/
    │   ├── applications.svg
    │   ├── bookmarks.svg
    │   ├── computer.svg
    │   ├── system.svg
    │   └── view.svg
    └── widgets/
```

If this looks correct then run the following commands to move the file and open system settings:
```console
$ mv ~/Downloads/Dracula ~/.local/share/plasma/desktoptheme/
$ systemsettings
```
Then navigate to Colours & Themes > Plasma Style and then select the one you just installed.

---

#### Custom Plasma Color Schemes <sup>[Arch Wiki](https://wiki.archlinux.org/title/KDE#Themes)</sup>

Find a color scheme you like from [here](https://www.pling.com/browse?cat=112&ord=latest). I like [Ant-Dracula KDE](https://store.kde.org/p/1370679/) so I will use this.

Download the file and ensure it follows the below layout:

```
📦 Dracula/
    ├── Dracula.colors
    └── DraculaPurple.colors
```

If this looks correct then run the following commands to move the files and open system settings:
```console
$ mmv ~/Downloads/Dracula/*.colors ~/.local/share/color-schemes/
$ systemsettings
```
Then navigate to Colours & Themes > Colours and then select the one you just installed.

---

#### Custom Window Decorations Aurorae <sup>[Arch Wiki](https://wiki.archlinux.org/title/KDE#Themes)</sup>

Find a color scheme you like from [here](https://www.pling.com/browse?cat=717&ord=latest). I like [Ant-Dracula KDE](https://store.kde.org/p/1370682/) so I will use this.

Download the file then extract/unzip the file and ensure it follows the below layout:

```
📦 Dracula/
    ├── .shade.svg
    ├── alldesktops.svg
    ├── close.svg
    ├── decoration.svg
    ├── keepabove.svg
    ├── keepbelow.svg
    ├── maximize.svg
    ├── metadata.desktop
    ├── minimize.svg
    ├── restore.svg
    └── Dracularc
```

If this looks correct then run the following commands to move the file and open system settings:
```console
$ mv ~/Downloads/Dracula ~/.local/share/aurorae/themes/
$ systemsettings
```
Then navigate to Colours & Themes > Window Decorations and then select the one you just installed.

##### Additional Window Decorations
Under Colours & Themes > Window Decorations their are more settings you can adjust to change the look and feel of the windows. 

Their is a dropdown in the top middle of the screen you can pick how thick/thin you want the boarders to be or can go with no borders. I like to go with the `No window borders`.

![Window Decorations Borders Dropdown](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/screenshots/Window-Decorations-Borders.png?raw=true)

To the right of the above dropdown their is the "Configure Titlebar Buttons..." button where you can change which buttons are displayed and the locations of them on the window. I like to swap the buttons around to give a more mac style setup.

![Titlebar Buttons](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/screenshots/Titlebar-Buttons.png?raw=true)

---

#### Custom Application Style <sup>[Arch Wiki](https://wiki.archlinux.org/title/KDE#Themes)</sup>

For this it is recommended to use the program [Kvantum](https://github.com/tsujan/Kvantum/blob/master/Kvantum/README.md) which allows you to fully customise your application style and install custom ones as well. As a disclaimer Kvantum is only maintained on the Github page and the KDE Store version is outdated!
```console
$ sudo pacman -Sy kvantum
```

Find a application style you like from [here](https://store.kde.org/browse?cat=123&ord=latest). I like [Ant-Dracula KDE](https://store.kde.org/p/1370681/) so I will use this and download the Dracula-purple-solid version.

- Extact the downloaded files.
- Search for "Kvantum Manager" from your start menu and open the application. 
- In the Install/Update Theme section navigate to the extract files and select the folder.
- Then go to Change/Delete Theme and pick the theme you just intalled in my case "Dracula-purple-solid" then click Use this theme.
- Close Kvantum Manager.
- Finally navigate to your System Settings > Colours & Themes > Application Style and then select "kvantum-dark" and apply.

---

#### Icon Theme <sup>[Arch Wiki](https://wiki.archlinux.org/title/Icons)</sup>

Find a icon pack you like from [here](https://www.pling.com/browse?cat=132&ord=latest). I like [Slot Nord Dark Colorize Icons](https://www.pling.com/p/2338310) so I will use this.

Download the file then extract/unzip the file and ensure it follows the below layout:

```
📦 Slot-Nord-Dark-Colorize-Icons
├─ Multiple folders
└─ index.theme
```

If this looks correct then run the following commands to move the file and open system settings:
```console
$ mv ~/Downloads/Slot-Nord-Dark-Colorize-Icons ~/.local/share/icons/
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

[Magna-Splash-6](https://www.pling.com/p/2136626)
```
📦 Magna-Splash-6
├─ contents
└─ metadata.json
```
If this looks correct then run the following commands to move the file and open system settings:
```console
$ mv ~/Downloads/Magna-Splash-6 ~/.local/share/plasma/look-and-feel/
$ systemsettings
```

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

#### Custom Sounds
Find any custom sounds you like from [here](https://store.kde.org/browse?cat=316&ord=latest). I like [MacOS System Sounds](https://store.kde.org/p/1891375) so I will use this.

Download the file then extract/unzip the file and ensure it follows the below layout:

```
📦 MacOS Sounds/
    ├── index.theme
    └── stereo/
        ├── dialog-information.ogg
        ├── message-new-email.ogg
        ├── dialog-error.ogg
        ├── button-toggle-off.ogg
        ├── button-toggle-on.ogg
        ├── dialog-warning.ogg
        ├── phone-outgoing-calling.ogg
        ├── trash-empty.ogg
        ├── phone-outgoing-busy.ogg
        ├── message.ogg
        ├── device-ready.ogg
        ├── message-new-instant.ogg
        ├── desktop-login.ogg
        ├── device-removed.ogg
        ├── phone-incoming-call.ogg
        ├── screen-capture.ogg
        ├── power-unplug.ogg
        ├── bell.ogg
        ├── complete.ogg
        ├── count-down.ogg
        ├── camera-shutter.ogg
        ├── power-plug.ogg
        ├── battery-low.ogg
        ├── dialog-question.ogg
        ├── audio-volume-change.ogg
        ├── message-sent-instant.ogg
        └── device-added.ogg
```

If this looks correct then run the following commands to move the file and open system settings:
```console
$ mkdir -p ~/.local/share/sounds #Make the directory
$ sudo mv ~/Downloads/"MacOS Sounds" ~/.local/share/sounds/
$ systemsettings
```
Then navigate to Colours & Themes > System Sounds and then select the one you just installed.

---

#### Plasma 6 Extensions Widgets (Plasmoids) <sup>[Arch Wiki](https://wiki.archlinux.org/title/KDE#Widgets)</sup>
Find any Plasma 6 extensions you like from [here](https://store.kde.org/browse?cat=705&ord=latest).

I'm doing to downwload the below files:
- [KDE Modern Clock](https://store.kde.org/p/2135653)
- [Kurve - Audio Visualizer](https://store.kde.org/p/2299506) <sup>`sudo pacman -Syu cava qt6-websockets python-websockets`</sup>
- [plasmusic-toolbar](https://store.kde.org/p/2128143)
- [Resources monitor](https://store.kde.org/p/2143899)
- [ToDo-List](https://www.pling.com/p/2342835)
- [Weather Widget Plus](https://www.pling.com/p/2281196/)
- [Window Title Applet 6](https://store.kde.org/p/2129423)

***Option 1:*** If the files are compressed in a zip/tar.gz folder extract them and then open the terminal and cd to the extracted files or right click the folder and open the terminal:
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

***Option 2:*** If it is a `.plasmoid` file then simply use the below command. Trying to use the above will give an error if you have other files in the folder with it.

```console
$ cd ~/Downloads/
$ kpackagetool6 --type=Plasma/Applet --install <downloaded-widget>.plasmoid #Replace <downloaded-widget> with the file name
$ # Then log out and back in again. Restarting plasmashell in the terminal isn't very reliable.
```

***Option 3:*** Some are available by right clicking your panel and click "Add or Manage Widgets" then press "Get New" as shown in the below screenhot. You can then search for the widget name but some are only available from the KDE Store.

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/screenshots/Add-or-Manage-Widgets-Get-New.png?raw=true)

#### Widgets (Plasmoids) Customisation
Some Widgets (Plasmoids) offer some customisation in their settings and some don't. In this section I will list how I've done some workarounds to tweak things to my liking.


**[ToDo-List By Marc](https://www.pling.com/p/2342835)** 

I don't like the icon used by this widget as it doesn't match my panels style so I will swap it out for something else.

- Go to `~/.local/share/plasma/plasmoids/de.marc.todo/`.
- Edit the `metadata.json` file.
- Change `"Icon": "view-task",` → `"Icon": "todo-indicator",`
- Then log out and back in again. Restarting plasmashell in the terminal isn't very reliable.

---
#### GRUB Theme <sup>[Arch Wiki](https://wiki.archlinux.org/title/GRUB)</sup>
Find any GRUB theme you like from [here](https://www.gnome-look.org/browse?cat=109&ord=latest). I like [CyberGRUB-2077](https://www.gnome-look.org/p/2235245) so I will use this.

Most GRUB themes will come with a install script using either a `.sh` or `.fish` script. It is recommended to use fish where possible. Follow thes steps provided and that will install the theme.

You can manually install themes as well.

> [!CAUTION]
> Some theme pages recommend using GRUB Customizer, I do not. It changes your GRUB config files and can make it difficult to apply tweaks or changes.

- Download the theme files and copy them into /boot/grub/themes. You may need to change the folder owner to access it:
```console
$ sudo chown $USER /boot/grub/themes
```
- Next, tell GRUB to use the theme. Open the GRUB config file located at /etc/default/grub (root permissions required):
```console
$ sudoedit /etc/default/grub
```
- Find the `GRUB_THEME=` line and set it to the path of the theme’s `theme.txt` file.
While you’re there, set your desired resolution by uncommenting and editing the `GRUB_GFXMODE=` line.
- Save the file, then apply the changes by running:
```console
$ sudo update-grub
```

You’ll need to run this command any time you modify GRUB’s configuration.

---
#### My Desktop Layout

To Be Completed.

I did use this [YouTube Video](https://www.youtube.com/watch?v=6UCI2OOkOk0) to help me figure out sizing for my primary monitor.

---

#### Animations/Desktop Effects
Then go to System Settings > Apps & Windows > Window Management > Desktop Effects. Then change the following:
- ☑ Blur
    - Blur strength - Light (Far left)
    - Noise strength - Light (Far left)
- ☑ Translucency
    - Inactive windows - 100%
    - Moving windows - 80%
    - Dialogues - 100%
    - Combobox popups - 100%
    - Menus - 100%
- ☑ Wobbly Windows
    - Wobbliness - Less (Far left)

![---](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/line.png?raw=true)

**[![ ](https://github.com/senkawolf/Beginner-Exploring-Linux/blob/main/media/icons/up25.png) Back to Top](#Table-of-Contents)**
