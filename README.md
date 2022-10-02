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

`mount /dev/sda1 /mnt/boot`

`mount /dev/sda4 /mnt/media`

`mount /dev/sdb1 /mnt/home`

`mount /dev/sdc1 /mnt/backup`

To check the setup

`lsblk -f`

# install system

`lsblk -f`
