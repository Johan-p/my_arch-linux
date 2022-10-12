# Installing the desktop


## I3 and desktop utils
https://i3wm.org/docs/userguide.html

* i3 tiling window manager 
* rxvt-unicode as a customizable terminal emulator
* LightDM as login screen
* fonts https://fontawesome.com/icons/steam?s=&f=brands

```
$ sudo pacman -S xorg i3 dmenu feh git rxvt-unicode
$ sudo pacman -S xorg-server xorg-xinit
$ sudo pacman -S alsa-utils pulseaudio 
$ sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
$ sudo pacman -S ttf-font-awesome awesome-terminal-fonts neofetch
```

### AMD drivers: for Intel or Nvidia drivers see Arch wiki

```
$ sudo pacman -S amd-ucode
$ sudo pacman -S xf86-video-amdgpu
```

### start-up i3
```
startx
```
follow the stetup instructionss and open a terminal afterwards super + enter to continue the installation

### Browser
```
$ sudo pacman -S firefox
```

### file manager
```
sudo pacman -S nemo
sudo pacman -S ntfs-3g
```

### Wallpaper & screenshot util
The i3 config file includes a command at startup to show the Background.jpg

```
mkdir Pictures
mv Background.jpg /home/johan/Pictures
```


### Screenshot util
The i3 config file this util is bound to the print screen button

```
sudo pacman -S deepin-screenshot
```

### Dotfiles
Create a `urxvt` extension folder and copy the dot files over.

```
$ mkdir -p ~/.urxvt/ext
git clone repo-link
cd my_arch-linux
cp .bassh_profile ~/.bash_profile
cp .bashrc ~/.bashrc
cp config ~/.config/i3/config
cp .Xdefaults ~/.Xdefaults
cp .urxvt/ext/solarized ~/.urxvt/ext/solarized
cp .xinitrc ~/.xinitrc
```
### urxvt-solarized
Terminal config files and extensions

Dark and light color scheme for urxvt, including easy toggling between them, super + c

[urxvt](https://wiki.archlinux.org/title/rxvt-unicode)
[Solarized](http://ethanschoonover.com/solarized) 

#### refresh i3
Super + shift + r




## Timeshift Backup & Restore
In case we break our installation we want a backup and restore solution
[Timeshift](https://github.com/teejee2008/timeshift)

Will use the AUR package:

https://aur.archlinux.org/packages/timeshift


#### AUR
One time settings to enable AUR packages

##### Setup
```
$ sudo pacman -S --needed base-devel git vim
$ sudo vim /etc/makepkg.conf
```

-- change MAKEFLAGS to the following line --
```
MAKEFLAGS="-j$(nproc)"
```

Safe and close

```
:wq
```

#### Installing packages
https://aur.archlinux.org/

Clone the repository

```
$ git clone https://aur.archlinux.org/timeshift.git
```

Always checkc the build file before running the code:
```
$ cat PKGBUILD
$ makepkg -si
```

## Additional software

### Gaming packages
Install drivers see lutris page:
https://github.com/lutris/docs/blob/master/InstallingDrivers.md
https://github.com/lutris/docs/blob/master/WineDependencies.md

```
sudo pacman -S lutris
sudo pacman -S steam
```

### keepassxc
```
sudo pacman -S keepassxc
```






















# -left off here-

### lock screen setup
To finish

```
$ sudo systemctl enable lightdm
```


### possible add-ons

```
$ sudo pacman -S network-manager-applet 
```
