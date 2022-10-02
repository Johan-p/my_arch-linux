# my_arch-linux


# After booting from usb

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
