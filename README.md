# Boot Arch Linux from your usb in UEFI mode.
You might have to disable secure boot in your bios.

https://wiki.archlinux.org/title/Installation_guide


# After booting from usb

`ls /sys/firmware/efi/efivars`
if it doesn't return any errors you have booted in UEFI mode

`ping google.com`
to check if you have internet ctrl + c to cancel the ping

`timedatectl set-ntp true`

`timedatectl status`


# lists out the partitions
`fdisk -l`   

`fdisk /dev/sda`  

`In fdisk, "m" for help`

`In fdisk, "g" for GPT`

`In fdisk, "n" for add new partition`

`In fdisk, "t" to change partition type`

`In fdisk, "w" (write table to disk)`


# example setup with multiple ssd's:

`/dev/sda1 500M EFI System`

`/dev/sda2 4G Linux swab`

`/dev/sda3 100G Linux filesystem`

`/dev/sda4 361.3G Linux filesystem`

`/dev/sdb1 931.5G Linux filesystem`

`/dev/sdc1 223.66G Linux filesystem`

# making the filesystem:

`mkfs.fat -F32 /dev/sda1`

`mkswap /dev/sda2`

`swapon /dev/sda2`

`mkfs.ext4 /dev/sda3`

`mkfs.ext4 /dev/sda4`

`mkfs.ext4 /dev/sdb1`

`mkfs.ext4 /dev/sdc1`

# Mount the system

`mount /dev/sda3 /mnt`

`mkdir /mnt/boot`

`mkdir /mnt/home`

`mkdir /mnt/media`

`mkdir /mnt/backup`

`mkdir /mmnt/boot`

`mount /dev/sda4 /mnt/media`

`mount /dev/sdb1 /mnt/home`

`mount /dev/sdc1 /mnt/backup`

`mount /dev/sda1 /boot`

To check the setup

`lsblk -f`

# Fstab

`genfstab -U /mnt >> /mnt/etc/fstab`

`vim /mnt/etc/fstab`


# install system

`pacstrap /mnt base base-devel vim linux linux-headers linux-firmware`


If you run into key issue's due to running an old version of Arch on your bootstick run the following first and try pacstrap again

`pacman -Sy archlinux-keyring`

# Chroot

`arch-chroot /mnt`

## time zone

`ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime`

`hwclock --systohc`

# locale

`vim /etc/locale.gen`

`/en_US enter`

uncomment en_US.UTF-8 UTF-8 :wq to save and exit

Note this might be different for you depending on where you live

`locale-gen`

`vim /etc/locale.conf`

`LANG=en_US.UTF-8`

Again might be different for you

https://wiki.archlinux.org/title/Locale#Setting_the_system_locale

# hostname and network

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


# passwd

change the root password

`passwd`

# create user 

replace username with the user you want

`useradd -m -g user -G wheel username`

`pacman -S sudo`

`editor=vim visudo`

uncomment %wheel all=(all) all

# GRUB

`pacman -S grub`

`pacman -S efibootmgr dosfstools os-prober mtools`

`grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub_uefi --recheck`

`ls -l /boot/grub`

`cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo`

`grub-mkconfig -o /boot/grub/grub.cfg`


# Software

`pacman -S git`

# umount and reboot

exit chroot

`exit`

`umount -l /mnt`

`reboot`

remember to remove the USB stick
