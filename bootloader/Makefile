AARCH64_TOOLCHAIN=GCC49
EDK2_DIR=$(ANDROID_BUILD_TOP)/device/hisilicon/bootloader/edk2
UEFI_TOOLS_DIR=$(ANDROID_BUILD_TOP)/device/hisilicon/poplar/uefi-tools
ATF_DIR=$(ANDROID_BUILD_TOP)/device/hisilicon/bootloader/arm-trusted-firmware
PRODUCT_OUT?=out/target/product/poplar

ifdef DEBUG
	TARGET = DEBUG
else
	TARGET = RELEASE
endif

all: loader

fip:
	cd $(EDK2_DIR) && \
	rm -rf Conf/tools_def.txt Conf/BuildEnv.sh  Conf/build_rule.txt Conf/target.txt  Conf/tools_def.txt && \
	export CROSS_COMPILE_32=arm-linux-androideabi- && \
	export CROSS_COMPILE_64=$(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android- && \
	rm -rf OpenPlatformPkg && \
	ln -sf  $(EDK2_DIR)/../OpenPlatformPkg OpenPlatformPkg && \
	rm -rf $(EDK2_DIR)/Build/  && \
	mkdir -p $(EDK2_DIR)/Build/ && \
	mkdir -p $(ANDROID_BUILD_TOP)/$(PRODUCT_OUT)/obj/uefi && \
	ln -sf $(ANDROID_BUILD_TOP)/$(PRODUCT_OUT)/obj/uefi $(EDK2_DIR)/Build/Poplar && \
	$(UEFI_TOOLS_DIR)/uefi-build.sh -b $(TARGET) -D EDK2_OUT_DIR=$(ANDROID_BUILD_TOP)/$(PRODUCT_OUT)/obj/uefi -a $(ATF_DIR) poplar

loader: fip
	cd $(ANDROID_BUILD_TOP)/device/hisilicon/poplar/l-loader && \
	cp $(EDK2_DIR)/Build/Poplar/$(TARGET)_GCC49/FV/bl1.bin atf/ && \
	cp $(EDK2_DIR)/Build/Poplar/$(TARGET)_GCC49/FV/fip.bin atf/ && \
	make CROSS_COMPILE=arm-linux-androideabi- loader.bin

clean:
	cd $(ANDROID_BUILD_TOP)/device/hisilicon/poplar/l-loader && make clean

distclean:
	cd $(ANDROID_BUILD_TOP)/device/hisilicon/poplar/l-loader && make distclean
