#!/system/bin/sh

modules="mmi_relay sensors_class touchscreen_mmi goodix_brl_mmi focaltech_v3 synaptics_v2_mmi"

# only touch modules are loaded by this script, all remaining modules are loaded by TWRP
# since if we let the TWRP to load all modules, then touch is not working
# it seems like touch modules are needed to load with a delay, so this script (this behaviour is only with custom kernel)
# 
# Custom ROM vendorboot has touch modules in it, so init will load it automatically
# to stop this, we need to apply a patch https://github.com/HemanthJabalpuri/twrp_motorola_rhode/files/11550608/dontLoadVendorModules.txt at system/core

isbooted=0
cat /proc/cmdline | grep -q "twrpfastboot=1"
[ $? -eq 0 ] && isbooted=1

if [ "$isbooted" = 1 ]; then
  # fastboot booted using `fastboot boot` or flashed to whole boot partition
  # kernel and modules in ramdisk are compatible, so use the modules from ramdisk itself
  module_path=/vendor/lib/modules/1.1
else
  # twrp is installed to boot ramdisk
  # so try to load modules from vendor_boot or vendor
  if [ -f /lib/modules/touchscreen_mmi.ko ]; then
    # touch modules are present in vendor_boot ramdisk (custom ROM)
    module_path=/lib/modules
  else
    # load modules from vendor partition
    vendormpath=/vendor/lib/modules
    module_path=/tmp$vendormpath
    mount /vendor
    mkdir -p $module_path
    for i in $modules; do
      cp $vendormpath/${i}.ko $module_path
    done
    umount /vendor
  fi
fi

echo "isbooted $isbooted"
echo "Module path is $module_path"

sleep 3 # needed to make touch work

for i in $modules; do
  insmod $module_path/${i}.ko
done

exit 0

