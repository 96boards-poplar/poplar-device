# PTable

This directory contains u-boot based flashing scripts to set up the mbr/ebr partition table on the target device.

## Flash the partition table

1. copy the scripts to usb disk
```
cp -r recovery_files ${your_usb_mount_point}
sync
```

2. Flash through u-boot console
```
usb reset
fatload usb 0:1 ${scriptaddr} recovery_files/install.scr
source ${scriptaddr}
```

## Check partition table

This is partition table configration you are expect to see.

```
poplar# part list mmc 0
Partition Map for MMC device 0  --   Partition Type: DOS
Part    Start Sector    Num Sectors     UUID            Type
    1     1               8191            78f9d0f7-01     f0
    2     8192            81920           78f9d0f7-02     da
    3     90112           1687551         78f9d0f7-03     83
    4     1777663         13164545        78f9d0f7-04     0f Extd
    5     1777664         409599          78f9d0f7-05     83
    6     2187264         2097151         78f9d0f7-06     83
    7     4284416         10657792        78f9d0f7-07     83
```