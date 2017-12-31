#
# Copyright 2017 The LineageOS Project
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
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

LOCAL_PATH := $(call my-dir)

ifneq ($(filter sf340n,$(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

# goodixfp
GOODIXFP_IMAGES := \
    goodixfp.b00 goodixfp.b01 goodixfp.b02 goodixfp.b03 goodixfp.b04 goodixfp.b05 \
    goodixfp.b06 goodixfp.mdt

GOODIXFP_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(GOODIXFP_IMAGES)))
$(GOODIXFP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "GOODIXFP firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(GOODIXFP_SYMLINKS)

# MODEM
MODEM_IMAGES := \
    modem.b00 modem.b01 modem.b02 modem.b04 modem.b05 modem.b06 modem.b07 \
    modem.b08 modem.b9 modem.b10 modem.b11 modem.b12 modem.b13 modem.b16 \
    modem.b17 modem.b18 modem.b19 modem.b20 modem.mdt modem_pr

MODEM_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(MODEM_IMAGES)))
$(MODEM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Modem firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(MODEM_SYMLINKS)

endif
