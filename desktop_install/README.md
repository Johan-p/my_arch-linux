## Installing desktop

### I3 and desktop utils
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
AMD drivers: for Intel or Nvidia drivers see Arch wiki
$ sudo pacman -S amd-ucode
$ sudo pacman -S xf86-video-amdgpu
sudo pacman -S firefox
```

## start-up i3
```
startx
```

-- add script to move all dot files in place --

## i3 config

```
mv config ~/.config/i3/config
$mod shift r
```

# file manager
```
sudo pacman -S nemo
sudo pacman -S ntfs-3g
mkdir Pictures
mv Background.jpg /home/johan/Pictures
sudo pacman -S deepin-screenshot
```



# urxvt-solarized
[urxvt](https://wiki.archlinux.org/title/rxvt-unicode)
[Solarized](http://ethanschoonover.com/solarized) 
dark and light color scheme for urxvt, including easy toggling between them.
$mod + c

Create a `urxvt` extension folder:

    $ mkdir -p ~/.urxvt/ext


## keepassxc
```
sudo pacman -S keepassxc
```

# Gaming
Install drivers see lutris page:
https://github.com/lutris/docs/blob/master/InstallingDrivers.md
https://github.com/lutris/docs/blob/master/WineDependencies.md

```
sudo pacman -S lutris
sudo pacman -S steam
```

# Timeshift
[See Timeshift repo](https://github.com/teejee2008/timeshift)
## -to update-

## -to update-

# fonts

## -to update-

```
cp .bashrc ~/.bashrc
```


## -left off here-

# lock screen setup
To finish



```
$ sudo systemctl enable lightdm
```

### possible add-ons

```
$ sudo pacman -S network-manager-applet 
```


# AUR
Manual steps for AUR packages

#### Setup
```
$ sudo pacman -S --needed base-devel git vim
$ sudo vim /etc/makepkg.conf
-- change MAKEFLAGS to the following line --
MAKEFLAGS="-j$(nproc)"
-------------------------------
:wq
```

#### Installing packages
https://aur.archlinux.org/

```
$ git clone link
$ cat PKGBUILD
$ makepkg -si
```

