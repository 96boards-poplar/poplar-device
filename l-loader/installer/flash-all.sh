#!/bin/bash

INSTALLER_DIR="`dirname ${0}`"

# for cases that not run "lunch poplar-xxx"
if [ -z "${ANDROID_BUILD_TOP}" ]; then
    ANDROID_BUILD_TOP=${INSTALLER_DIR}/../../../../../
    ANDROID_PRODUCT_OUT="${ANDROID_BUILD_TOP}/out/target/product/poplar"
fi

#get out directory path
while [ $# -ne 0 ]; do
    case "${1}" in
        --out) OUT_IMGDIR=${2};shift;;
    esac
    shift
done

if [ -z "${OUT_IMGDIR}" ]; then
    if [ ! -z "${ANDROID_PRODUCT_OUT}" ]; then
        OUT_IMGDIR="${ANDROID_PRODUCT_OUT}"
    fi
fi

if [ ! -d "${OUT_IMGDIR}" ]; then
    echo "error in locating out directory, check if it exist"
    exit
fi

echo "android out dir:${OUT_IMGDIR}"

# set a unique serial number
serialno=`fastboot getvar serialno 2>&1 > /dev/null`
if [ "${serialno:10:6}" == "(null)" ]; then
    fastboot oem serialno
else
    if [ "${serialno:10:15}" == "0123456789abcde" ]; then
        fastboot oem serialno
    fi
fi

fastboot flash mmcsda2 "${OUT_IMGDIR}"/boot.img
fastboot flash mmcsda3 "${OUT_IMGDIR}"/system.img
fastboot flash mmcsda5 "${OUT_IMGDIR}"/cache.img
fastboot flash mmcsda6 "${OUT_IMGDIR}"/userdata.img
