## Installing desktop

### I3 and desktop utils
https://i3wm.org/docs/userguide.html

* i3 tiling window manager 
* rxvt-unicode as a customizable terminal emulator
* LightDM as login screen

```
$ sudo pacman -S xorg i3 dmenu feh git rxvt-unicode
$ sudo pacman -S alsa-utils pulseaudio 
$ sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings

```

### AMD drivers:
For Intel or Nvidia drivers see Arch wiki

```
$ sudo pacman -S amd-ucode
$ sudo pacman -S xf86-video-amdgpu
```

## start-up i3

```
echo "exec i3" >> ~/.xinitrc
sudo pacman -S xorg-server xorg-xinit
startx
```

## browser

```
sudo pacman -S firefox
```

## i3 config

```
mv config ~/.config/i3/config
$mod shift r
```

# urxvt-solarized
[urxvt](https://wiki.archlinux.org/title/rxvt-unicode)
[Solarized](http://ethanschoonover.com/solarized) 
dark and light color scheme for urxvt, including easy toggling between them.
$mod + c

## -to update-
####  Setup

Create a `urxvt` extension folder:

    $ mkdir -p ~/.urxvt/ext

Download the extension:

    $ wget -O ~/.urxvt/ext/solarized \
        https://raw.githubusercontent.com/BobuSumisu/urxvt-solarized/master/solarized

Or clone repository and link the file:

    $ git clone https://github.com/BobuSumisu/urxvt-solarized.git
    $ ln -s ${PWD}/urxvt-solarized/solarized ~/.urxvt/ext/solarized

Enable it in your `~/.Xresources` or equivalent:

    URxvt.perl-ext-common:      solarized
    URxvt.keysym.Mod4-c:        perl:solarized:toggle
    URxvt.solarized.default:    light

Here we also bound toggling to `Super+C` and sat the default scheme to Solarized light.

Now merge the changes:

    $ xrdb -merge ~/.Xresources

And open a new `urxvt` windows in beautiful Solarized colors!
## -to update-

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

# file manager
```
sudo pacman -S nemo
sudo pacman -S ntfs-3g
```

# background
to do add bashscript for background .fehbg
```
mkdir Pictures
mv Background.jpg /home/johan/Pictures
```

## screenshot
```
sudo pacman -S deepin-screenshot
```

# Timeshift
[See Timeshift repo](https://github.com/teejee2008/timeshift)
## -to update-

## -to update-

# fonts
https://fontawesome.com/icons/steam?s=&f=brands
## -to update-

```
sudo pacman -S ttf-font-awesome awesome-terminal-fonts neofetch
vim ~/.bashrc

# add line for neofetch
neofetch
```
## -to update-


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

