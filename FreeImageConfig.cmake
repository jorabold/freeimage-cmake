# Config file for FreeImage - Find FreeImage & dependencies.
#
# This file is used by CMake when find_package(FreeImage) is invoked. It's based
# on Ceres' config file.
#
# This module defines the following variables:
#
# FreeImage_FOUND / FREEIMAGE_FOUND: True if FreeImage has been successfully
# found. Both variables are set as although find_package() only references
# FreeImage_FOUND in Config mode, given the conventions for <package>_FOUND when
# find_package() is called in Module mode, users could reasonably expect to use
# FREEIMAGE_FOUND instead.
#
# FREEIMAGE_VERSION: Version of FreeImage found.
#
# FREEIMAGE_LIBRARIES: Libraries for FreeImage and all dependencies against
# which FreeImage was compiled. This will not include any optional dependencies
# that were disabled when FreeImage was compiled.
#
# NOTE: There is no equivalent of FREEIMAGE_INCLUDE_DIRS as the exported CMake
# target already includes the definition of its public include directories.

# freeimage_message([mode] "message text")
#
# Wraps the standard cmake 'message' command, but suppresses output if the QUIET
# flag was passed to the find_package(FreeImage ...) call.
function(freeimage_message)
  if(NOT FreeImage_FIND_QUIETLY)
    message(${ARGN})
  endif()
endfunction()

get_filename_component(FreeImage_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
include(CMakeFindDependencyMacro)

if(NOT TARGET freeimage::freeimage)
  include("${FreeImage_CMAKE_DIR}/FreeImageTargets.cmake")
  include("${FreeImage_CMAKE_DIR}/FreeImageConfigVersion.cmake")
endif()

set(FREEIMAGE_LIBRARIES freeimage::freeimage)
set(FREEIMAGE_FOUND TRUE)
set(FREEIMAGE_VERSION ${FreeImage_VERSION})

freeimage_message(STATUS
                  "Found FreeImage ${FreeImage_VERSION} (in ${FreeImage_DIR})")
