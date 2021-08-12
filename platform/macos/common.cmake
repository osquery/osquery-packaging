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
    "${OSQUERY_DATA_PATH}/opt/osquery/bin/osqueryd"

  DESTINATION
    "/opt/osquery/lib/osquery.app/Contents/MacOS"

  COMPONENT
    osquery

  PERMISSIONS
    OWNER_READ OWNER_WRITE OWNER_EXECUTE
    GROUP_READ             GROUP_EXECUTE
    WORLD_READ             WORLD_EXECUTE 
)

install(
  FILES
    "${OSQUERY_DATA_PATH}/control/Info.plist"
    "${OSQUERY_DATA_PATH}/control/PkgInfo"
    "${OSQUERY_DATA_PATH}/control/embedded.provisionprofile"

  DESTINATION
    "/opt/osquery/lib/osquery.app/Contents"

  COMPONENT
    osquery
)

install(
  FILES
    "${OSQUERY_DATA_PATH}/opt/osquery/bin/osqueryctl"

  DESTINATION
    "/opt/osquery/lib/osquery.app/Contents/Resources"

  COMPONENT
    osquery

  PERMISSIONS
    OWNER_READ OWNER_WRITE OWNER_EXECUTE
    GROUP_READ             GROUP_EXECUTE
    WORLD_READ             WORLD_EXECUTE 
)

execute_process(
  COMMAND "${CMAKE_COMMAND}" -E create_symlink "/opt/osquery/lib/osquery.app/Contents/MacOS/osqueryd" osqueryi
  WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
)

execute_process(
  COMMAND "${CMAKE_COMMAND}" -E create_symlink "/opt/osquery/lib/osquery.app/Contents/Resources/osqueryctl" osqueryctl
  WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
)

install(
  FILES
    "${CMAKE_CURRENT_BINARY_DIR}/osqueryi"
    "${CMAKE_CURRENT_BINARY_DIR}/osqueryctl"
  
  DESTINATION
    "/usr/local/bin/"
  
  COMPONENT
    osquery
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
