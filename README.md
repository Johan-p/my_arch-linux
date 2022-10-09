# Personal Arch installation and setup guide
see official documentation:
https://wiki.archlinux.org/title/Installation_guide

## Fresh installation

### Boot Arch Linux from your usb in UEFI mode.
You might have to disable secure boot in your bios.



### After booting from usb

`ls /sys/firmware/efi/efivars`
if it doesn't return any errors you have booted in UEFI mode

`ping google.com`
to check if you have internet ctrl + c to cancel the ping

`timedatectl set-ntp true`

`timedatectl status`


### lists out the partitions
`fdisk -l`   

`fdisk /dev/sda`  

`In fdisk, "m" for help`

`In fdisk, "g" for GPT`

`In fdisk, "n" for add new partition`

`In fdisk, "t" to change partition type`

`In fdisk, "w" (write table to disk)`

`fdisk /dev/sdb`  

`In fdisk, "m" for help`

`In fdisk, "g" for GPT`

`In fdisk, "n" for add new partition`

`In fdisk, "t" to change partition type`

`In fdisk, "w" (write table to disk)`

`fdisk /dev/sdc`  

`In fdisk, "m" for help`

`In fdisk, "g" for GPT`

`In fdisk, "n" for add new partition`

`In fdisk, "t" to change partition type`

`In fdisk, "w" (write table to disk)`

### example setup with multiple ssd's:

All with gtp

`/dev/sda1 500M EFI System`

`/dev/sda2 4G Linux swab`

`/dev/sda3 100G Linux filesystem`

`/dev/sda4 361.3G Linux filesystem`

`/dev/sdb1 931.5G Linux filesystem`

`/dev/sdc1 223.66G Linux filesystem`

### making the filesystem:

`mkfs.fat -F32 /dev/sda1`

`mkswap /dev/sda2`

`swapon /dev/sda2`

`mkfs.ext4 /dev/sda3`

`mkfs.ext4 /dev/sda4`

`mkfs.ext4 /dev/sdb1`

`mkfs.ext4 /dev/sdc1`

### Mount the system

`mount /dev/sda3 /mnt`

`mkdir /mnt/boot`

`mkdir /mnt/home`

`mkdir /mnt/media`

`mkdir /mnt/backup`

`mount /dev/sda4 /mnt/media`

`mount /dev/sdb1 /mnt/home`

`mount /dev/sdc1 /mnt/backup`

`mount /dev/sda1 /boot`

To check the setup

`lsblk -f`

### install system

`pacstrap /mnt base base-devel vim linux linux-headers linux-firmware`


If you run into key issue's due to running an old version of Arch on your bootstick run the following first and try pacstrap again

`pacman -Sy archlinux-keyring`

### Fstab

`genfstab -U /mnt >> /mnt/etc/fstab`

`vim /mnt/etc/fstab`


### Chroot

`arch-chroot /mnt`

### time zone

`ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime`

`hwclock --systohc`

### locale

`vim /etc/locale.gen`

`/en_US enter`

uncomment en_US.UTF-8 UTF-8 :wq to save and exit

Note this might be different for you depending on where you live

`locale-gen`

`vim /etc/locale.conf`

`LANG=en_US.UTF-8`

Again might be different for you

https://wiki.archlinux.org/title/Locale#Setting_the_system_locale

### hostname and network

`vim /etc/hostname`

add a hostname

`vim /etc/hosts`

add the following

`127.0.0.1    localhost`

`::1          localhost`

replace hostname for the hostname you picked

`127.0.1.1    hostname.localdomain  hostname`

Edit the file with the computer/hostename you want and save & exit

`pacman -S networkmanger`

`systemctl enable NetworkManger`


### passwd

change the root password

`passwd`

### create user 

replace johan with the username you want

`useradd -m johan`

`passwd johan`

`pacman -S sudo`

`usermod -aG wheel,audio,video,optical,storage johan`

`editor=vim visudo`

uncomment %wheel all=(all) all

### GRUB

`pacman -S grub`

`pacman -S efibootmgr dosfstools os-prober mtools`

`grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub_uefi --recheck`

`ls -l /boot/grub`

`cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo`

`grub-mkconfig -o /boot/grub/grub.cfg`


### Software

`pacman -S git`

### umount and reboot

exit chroot

`exit`

`umount -l /mnt`

`reboot`

remember to remove the USB stick

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

