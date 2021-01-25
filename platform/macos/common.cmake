#
# Copyright (c) 2014-present, The osquery authors
#
# This source code is licensed as defined by the LICENSE file found in the
# root directory of this source tree.
#
# SPDX-License-Identifier: (Apache-2.0 OR GPL-2.0-only)
#

set(OSQUERY_PACKAGE_RELEASE "1.macos")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}_${OSQUERY_PACKAGE_RELEASE}_${CMAKE_SYSTEM_PROCESSOR}")
set(CPACK_SET_DESTDIR ON)

install(
  FILES
    "${OSQUERY_DATA_PATH}/usr/local/bin/osqueryd"
    "${OSQUERY_DATA_PATH}/usr/local/bin/osqueryi"
    "${OSQUERY_DATA_PATH}/usr/local/bin/osqueryctl"

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
  DIRECTORY "${OSQUERY_DATA_PATH}/private/var/osquery"
  DESTINATION "/private/var"
  COMPONENT osquery
)

install(
  DIRECTORY
  DESTINATION "/private/var/log/osquery"
  COMPONENT osquery
)
