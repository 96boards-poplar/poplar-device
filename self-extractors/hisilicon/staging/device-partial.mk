# Copyright 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Binary blob(s) from Hisilicon for poplar hardware
# stagefright
PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/proprietary/libhi_common.so:system/lib/libhi_common.so \
    $(LOCAL_PATH)/proprietary/libhi_msp.so:system/lib/libhi_msp.so \
    $(LOCAL_PATH)/proprietary/libhi_vfmw.so:system/lib/libhi_vfmw.so \
    $(LOCAL_PATH)/proprietary/libOMX_Core.so:system/lib/libOMX_Core.so \
    $(LOCAL_PATH)/proprietary/libOMX.hisi.video.decoder.so:system/lib/libOMX.hisi.video.decoder.so \
    $(LOCAL_PATH)/proprietary/libstagefrighthw.so:system/lib/libstagefrighthw.so \
    $(LOCAL_PATH)/proprietary/libhiavplayer.so:system/vendor/lib/libhiavplayer.so \
    $(LOCAL_PATH)/proprietary/libhiavplayer_adp.so:system/vendor/lib/libhiavplayer_adp.so \
    $(LOCAL_PATH)/proprietary/libhiavplayerservice.so:system/vendor/lib/libhiavplayerservice.so \
    $(LOCAL_PATH)/proprietary/hiavplayer:system/vendor/bin/hiavplayer