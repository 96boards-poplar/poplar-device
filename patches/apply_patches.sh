#!/bin/bash

PATCH_DIRNAME="`dirname ${0}`"

# for cases that don't run "lunch poplar-xxx"
if [ -z "${ANDROID_BUILD_TOP}" ]; then
    ANDROID_BUILD_TOP=${PATCH_DIRNAME}/../../../../
fi

PATCH_DIR="$( cd "${PATCH_DIRNAME}" && pwd )"

cd ${ANDROID_BUILD_TOP}/hardware/interfaces
git am -3 ${PATCH_DIR}/0001-audio-Initialize-processstate-with-vndbinder.patch
