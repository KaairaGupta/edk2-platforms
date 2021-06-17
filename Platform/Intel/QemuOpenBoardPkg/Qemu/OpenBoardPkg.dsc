## @file
#  The main build description file for the Qemu board.
#
#  Copyright (c) 2021, Intel Corporation. All rights reserved.<BR>
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

[Defines]
  DEFINE      PLATFORM_PACKAGE          = MinPlatformPkg
  DEFINE      PLATFORM_BOARD_PACKAGE    = QemuOpenBoardPkg
  DEFINE      BOARD                     = Qemu
  DEFINE      PROJECT                   = $(PLATFORM_BOARD_PACKAGE)/$(BOARD)
  DEFINE      PEI_ARCH                  = IA32
  DEFINE      DXE_ARCH                  = X64
  DEFINE      TOP_MEMORY_ADDRESS        = 0x0

  #
  # Default value for OpenBoardPkg.fdf use
  #
  DEFINE BIOS_SIZE_OPTION = SIZE_70

  PLATFORM_NAME                         = $(PLATFORM_PACKAGE)
  PLATFORM_GUID                         = 5a9e7754-d81b-49ea-85ad-69eaa7b1539b
  PLATFORM_VERSION                      = 0.1
  DSC_SPECIFICATION                     = 0x00010005
  OUTPUT_DIRECTORY                      = Build/$(PROJECT)
  SUPPORTED_ARCHITECTURES               = IA32|X64
  BUILD_TARGETS                         = NOOPT|DEBUG|RELEASE
  SKUID_IDENTIFIER                      = ALL
  FIX_LOAD_TOP_MEMORY_ADDRESS           = 0x0

  #
  # Include PCD configuration for this board.
  #

  #!include OpenBoardPkgPcd.dsc

################################################################################
#
# SKU Identification section - list of all SKU IDs supported by this board.
#
################################################################################
[SkuIds]
  0x00|DEFAULT              # 0|DEFAULT is reserved and always required.

################################################################################
#
# Includes section - other DSC file contents included for this board build.
#
################################################################################

#######################################
# Library Includes
#######################################
#!include $(PLATFORM_PACKAGE)/Include/Dsc/CoreCommonLib.dsc

#######################################
# Component Includes
#######################################
#[Components.IA32]
#!include $(PLATFORM_PACKAGE)/Include/Dsc/CorePeiInclude.dsc

#[Components.X64]
#!include $(PLATFORM_PACKAGE)/Include/Dsc/CoreDxeInclude.dsc

#######################################
# Build Option Includes
#######################################
!include OpenBoardPkgBuildOption.dsc

################################################################################
#
# Library Class section - list of all Library Classes needed by this board.
#
################################################################################

[LibraryClasses.common]
  #######################################
  # Edk2 Packages
  #######################################
  FspWrapperApiLib|IntelFsp2WrapperPkg/Library/BaseFspWrapperApiLib/BaseFspWrapperApiLib.inf
  FspWrapperApiTestLib|IntelFsp2WrapperPkg/Library/PeiFspWrapperApiTestLib/PeiFspWrapperApiTestLib.inf

  #####################################
  # Platform Package
  #####################################
  #BoardInitLib|$(PLATFORM_PACKAGE)/PlatformInit/Library/BoardInitLibNull/BoardInitLibNull.inf
  #FspWrapperHobProcessLib|$(PLATFORM_PACKAGE)/FspWrapper/Library/PeiFspWrapperHobProcessLib/PeiFspWrapperHobProcessLib.inf
  #FspWrapperPlatformLib|$(PLATFORM_PACKAGE)/FspWrapper/Library/PeiFspWrapperPlatformLib/PeiFspWrapperPlatformLib.inf
  #PciHostBridgeLib|$(PLATFORM_PACKAGE)/Pci/Library/PciHostBridgeLibSimple/PciHostBridgeLibSimple.inf
  #PciSegmentInfoLib|$(PLATFORM_PACKAGE)/Pci/Library/PciSegmentInfoLibSimple/PciSegmentInfoLibSimple.inf
  #PeiLib|$(PLATFORM_PACKAGE)/Library/PeiLib/PeiLib.inf
  #PlatformBootManagerLib|$(PLATFORM_PACKAGE)/Bds/Library/DxePlatformBootManagerLib/DxePlatformBootManagerLib.inf
  #ReportFvLib|$(PLATFORM_PACKAGE)/PlatformInit/Library/PeiReportFvLib/PeiReportFvLib.inf
  #TestPointCheckLib|$(PLATFORM_PACKAGE)/Test/Library/TestPointCheckLibNull/TestPointCheckLibNull.inf

  #######################################
  # Board Package
  #######################################
  #PlatformSecLib|$(PLATFORM_PACKAGE)/FspWrapper/Library/SecFspWrapperPlatformSecLib/SecFspWrapperPlatformSecLib.inf

  #######################################
  # Board-specific
  #######################################

[LibraryClasses.IA32.SEC]
  #######################################
  # Platform Package
  #######################################
  #TestPointCheckLib|$(PLATFORM_PACKAGE)/Test/Library/TestPointCheckLib/SecTestPointCheckLib.inf
  #SecBoardInitLib|$(PLATFORM_PACKAGE)/PlatformInit/Library/SecBoardInitLibNull/SecBoardInitLibNull.inf

  #######################################
  # Board Package
  #######################################

#!if $(TARGET) == DEBUG
#  TestPointCheckLib|$(PLATFORM_PACKAGE)/Test/Library/TestPointCheckLib/DxeTestPointCheckLib.inf
#!endif