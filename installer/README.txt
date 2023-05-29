TWRP for Moto G52 rhode Android 12

Flash this zip in Magisk to install TWRP to both the slots and
go to Magisk -> Install -> Direct Install to re-root since flashing TWRP removes Magisk

alternatively we can boot using
fastboot boot TWRP.img

or

`fastboot --cmdline "twrpfastboot=1" --header-version 3 boot kernel ramdisk.cpio` where
`ramdisk.cpio` is from unpacked TWRP.img and
`kernel` is from unpacked boot.img from ROM that you are using
and then go to 'Advanced' and choose 'Flash Current TWRP'
