#
# Copyright (c) 2014-present, The osquery authors
#
# This source code is licensed as defined by the LICENSE file found in the
# root directory of this source tree.
#
# SPDX-License-Identifier: (Apache-2.0 OR GPL-2.0-only)
#

set(OSQUERY_PACKAGE_RELEASE "1.linux")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}_${OSQUERY_PACKAGE_RELEASE}_${CMAKE_SYSTEM_PROCESSOR}")

set(OSQUERY_SOURCE_DIRECTORY_LIST "" CACHE PATH "osquery source and build folders")

if(NOT "${OSQUERY_SOURCE_DIRECTORY_LIST}" STREQUAL "")
  set(CPACK_BUILD_SOURCE_DIRS "${OSQUERY_SOURCE_DIRECTORY_LIST}")

  message(STATUS "OSQUERY_SOURCE_DIRECTORY_LIST was set, enabling debug packages")
else()
  message(STATUS "OSQUERY_SOURCE_DIRECTORY_LIST was not set, disabling debug packages")
endif()

if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
      set(CMAKE_INSTALL_PREFIX "/opt/osquery" CACHE PATH "" FORCE)
endif()

if(NOT CPACK_PACKAGING_INSTALL_PREFIX)
  set(CPACK_PACKAGING_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")
endif()


install(
  FILES
    "${OSQUERY_DATA_PATH}/opt/osquery/bin/osqueryd"
    "${OSQUERY_DATA_PATH}/opt/osquery/bin/osqueryi"
    "${OSQUERY_DATA_PATH}/opt/osquery/bin/osqueryctl"

  DESTINATION
    "bin"

  COMPONENT
    osquery

  PERMISSIONS
    OWNER_READ OWNER_WRITE OWNER_EXECUTE
    GROUP_READ             GROUP_EXECUTE
    WORLD_READ             WORLD_EXECUTE 
)

install(
  DIRECTORY "${OSQUERY_DATA_PATH}/opt/osquery/share/osquery"
  DESTINATION "share"
  COMPONENT osquery
)

install(
  DIRECTORY
  DESTINATION "/etc/osquery"
  COMPONENT osquery
)

install(
  DIRECTORY
  DESTINATION "/var/osquery"
  COMPONENT osquery
)

install(
  DIRECTORY
  DESTINATION "/var/log/osquery"
  COMPONENT osquery
)
