# Hey Emacs, this is a -*- makefile -*-

# The purpose of this file is to define the build configuration variables used
# by the generic Makefile. See Makefile header for further information.

# Copyright (c) 2007, Atmel Corporation All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
# list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation and/
# or other materials provided with the distribution.
#
# 3. The name of ATMEL may not be used to endorse or promote products derived
# from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY ATMEL ``AS IS'' AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE EXPRESSLY AND
# SPECIFICALLY DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
# OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
# EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


# Base paths # CHANGED
SRC_PATH = src
PRJ_PATH = src/ASF
CONFIG_PATH = $(SRC_PATH)/config
AVR32_PATH = $(PRJ_PATH)/avr32
COMMON_PATH = $(PRJ_PATH)/common
FREERTOS_PATH = $(PRJ_PATH)/thirdparty/freertos
ASF_DRIVER_PATH = $(AVR32_PATH)/drivers


# CPU architecture: {ap|uc}
ARCH = ucr1

# Part: {none|ap7xxx|uc3xxxxx}
PART = uc3c0512crevc #CHANGED

# Flash memories: [{cfi|internal}@address,size]...
FLASH = internal@0x80000000,512Kb

# Clock source to use when programming: [{xtal|extclk|int}]
PROG_CLOCK = xtal

# Device/Platform/Board include path #CHANGED-COMMENTED OUT
#PLATFORM_INC_PATH = \
#  $(BRDS_PATH)/

# Target name: {*.a|*.elf}
TARGET = FREERTOS_UC3_EXAMPLE1.elf #CHANGED

# Definitions: [-D name[=definition]...] [-U name...]
# Things that might be added to DEFS:
#   BOARD             Board used: {EVKxxxx}
#   EXT_BOARD         Extension board used (if any): {EXTxxxx}
DEFS = -D BOARD=UC3C_EK # CHANGED

CFLAGS = $(DEFS) -D __AT32UC3C0512C__ # CHANGED

# Include path
INC_PATH = \
  $(SRC_PATH)/ \
  $(PRJ_PATH)/ \
  $(CONFIG_PATH)/ \
  $(AVR32_PATH)/boards/ \
  $(AVR32_PATH)/boards/uc3c_ek/ \
  $(ASF_DRIVER_PATH)/flashc/ \
  $(ASF_DRIVER_PATH)/gpio/ \
  $(ASF_DRIVER_PATH)/intc/ \
  $(ASF_DRIVER_PATH)/pm \
  $(ASF_DRIVER_PATH)/scif/ \
  $(ASF_DRIVER_PATH)/tc/ \
  $(ASF_DRIVER_PATH)/usart/ \
  $(AVR32_PATH)/utils/ \
  $(AVR32_PATH)/utils/header_files/ \
  $(AVR32_PATH)/utils/preprocessor/ \
  $(AVR32_PATH)/utils/startup/ \
  $(COMMON_PATH)/boards/ \
  $(COMMON_PATH)/utils/ \
  $(COMMON_PATH)/utils/interrupt/ \
  $(FREERTOS_PATH)/freertos-7.0.0/source/include/ \
  $(FREERTOS_PATH)/freertos-7.0.0/source/portable/gcc/avr32_uc3/ \
  $(FREERTOS_PATH)/demo/avr32_uc3_example/at32uc3c0512c_uc3c_ek/ \
  $(FREERTOS_PATH)/demo/avr32_uc3_example/ \
  $(FREERTOS_PATH)/demo/common/include/

# C source files
CSRCS = \
  $(FREERTOS_PATH)/demo/avr32_uc3_example/main.c \
  $(FREERTOS_PATH)/demo/avr32_uc3_example/serial/serial.c \
  $(FREERTOS_PATH)/demo/avr32_uc3_example/partest/ParTest.c \
  $(wildcard $(FREERTOS_PATH)/demo/common/minimal/*.c) \
  \
  $(wildcard $(FREERTOS_PATH)/freertos-7.0.0/source/*.c) \
  \
  $(wildcard $(FREERTOS_PATH)/freertos-7.0.0/source/portable/gcc/avr32_uc3/*.c) \
  \
  $(FREERTOS_PATH)/freertos-7.0.0/source/portable/memmang/heap_3.c \
  $(AVR32_PATH)/boards/uc3c_ek/led.c \
  \
  $(ASF_DRIVER_PATH)/flashc/flashc.c \
  $(ASF_DRIVER_PATH)/gpio/gpio.c \
  $(ASF_DRIVER_PATH)/intc/intc.c \
  $(ASF_DRIVER_PATH)/pm/pm_uc3c.c \
  $(ASF_DRIVER_PATH)/pm/power_clocks_lib.c \
  $(ASF_DRIVER_PATH)/scif/scif_uc3c.c \
  $(ASF_DRIVER_PATH)/tc/tc.c \
  $(ASF_DRIVER_PATH)/usart/usart.c

# Assembler source files # CHANGED
ASSRCS = \
  $(AVR32_PATH)/utils/startup/trampoline_uc3.S \
  $(FREERTOS_PATH)/freertos-7.0.0/source/portable/gcc/avr32_uc3/exception.S

# Library path
LIB_PATH =

# Libraries to link with the project
LIBS =

# Linker script file if any
LINKER_SCRIPT = $(AVR32_PATH)/utils/linker_scripts/at32uc3c/0512c/gcc/link_uc3c0512c.lds
LINKER_SCRIPT = avr32/utils/linker_scripts/at32uc3c/0512c/gcc/link_uc3c0512c.lds

# Options to request or suppress warnings: [-fsyntax-only] [-pedantic[-errors]] [-w] [-Wwarning...]
# For further details, refer to the chapter "GCC Command Options" of the GCC manual.
WARNINGS = -Wall

# Options for debugging: [-g]...
# For further details, refer to the chapter "GCC Command Options" of the GCC manual.
DEBUG = -g

# Options that control optimization: [-O[0|1|2|3|s]]...
# For further details, refer to the chapter "GCC Command Options" of the GCC manual.
OPTIMIZATION = -O0 -ffunction-sections -fdata-sections

# Extra flags to use when preprocessing
CPP_EXTRA_FLAGS =

# Extra flags to use when compiling
C_EXTRA_FLAGS =

# Extra flags to use when assembling
AS_EXTRA_FLAGS =

# Extra flags to use when linking
LD_EXTRA_FLAGS = -Wl,--gc-sections -Wl,-e,_trampoline

# Documentation path
DOC_PATH = \
  ../../DOC/

# Documentation configuration file
DOC_CFG = \
  ../doxyfile.doxygen
