1) Sources in 1.1 folder are taken from https://git.codelinaro.org/clo/la/platform/hardware/qcom/bootctrl/-/tree/07201315dd1e895d9726197110644bd7b987c37a/1.1
or the same is also available at https://github.com/LineageOS/android_hardware_qcom_bootctrl/tree/07201315dd1e895d9726197110644bd7b987c37a/1.1
and applied this patch https://github.com/LineageOS/android_device_motorola_nash/commit/ba70a48f8d0ab12666d2d37e31f581697423ae02
to work for slot partitions in different disks

In Moto G52(rhode), _a slot partitions are in disk `sdd` and _b slot partitions are in disk `sdf`


2) Sources in oem-recovery are taken from https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/recovery-ext/-/tree/de99450655a34f355b7c24cdb2337c0b084b75e8/oem-recovery
or the same is also available at https://github.com/AOSPA/android_vendor_qcom-opensource_recovery-ext/tree/de99450655a34f355b7c24cdb2337c0b084b75e8/oem-recovery


3) Sources in oem-recovery/kernel_headers/scsi/ufs are taken from https://git.codelinaro.org/clo/la/kernel/msm-4.19/-/tree/LA.UM.9.15.r1-07100-KAMORTA.QSSI13.0/include/uapi/scsi/ufs
or the same is also available at https://github.com/TeamWin/android_device_qcom_common/tree/d29e5ec275fe3b37e6a1819a9a438bad27781995/gpt-utils/include
and https://github.com/MotorolaMobilityLLC/kernel-msm/tree/MMI-S1SR32.38-87-2/include/uapi/scsi/ufs
