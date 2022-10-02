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


# create the partitions you need


`fdisk /dev/sda`

list the partition table
`p`

create a new partition table
`g`

add a new partition
`n`

enter for first sector and then at last sector
`+500m`
this will create a small partition that will use for our boot later on.



`fdisk /dev/sda`
`fdisk /dev/sda`
`fdisk /dev/sda`
