#
# Copyright (c) 2014-present, The osquery authors
#
# This source code is licensed as defined by the LICENSE file found in the
# root directory of this source tree.
#
# SPDX-License-Identifier: (Apache-2.0 OR GPL-2.0-only)
#

set(CPACK_STRIP_FILES ON)
set(CPACK_DEBIAN_OSQUERY_PACKAGE_NAME "${CPACK_PACKAGE_NAME}")
set(CPACK_DEBIAN_PACKAGE_RELEASE "${OSQUERY_PACKAGE_RELEASE}")
set(CPACK_DEBIAN_OSQUERY_FILE_NAME "DEB-DEFAULT")
set(CPACK_DEBIAN_PACKAGE_PRIORITY "extra")
set(CPACK_DEBIAN_PACKAGE_SECTION "default")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libc6 (>=2.12), zlib1g")
set(CPACK_DEBIAN_PACKAGE_HOMEPAGE "${CPACK_PACKAGE_HOMEPAGE_URL}")
set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA "${CMAKE_SOURCE_DIR}/control/deb/conffiles;${CMAKE_SOURCE_DIR}/control/postinst")

if(DEFINED OSQUERY_SOURCE_DIRECTORY_LIST)
  set(CPACK_DEB_COMPONENT_INSTALL ON)
  set(CPACK_DEBIAN_DEBUGINFO_PACKAGE ON)
endif()

install(
  FILES "${OSQUERY_DATA_PATH}/control/deb/lib/systemd/system/osqueryd.service"
  DESTINATION "/usr/lib/systemd/system"
  COMPONENT osquery
)

install(
  FILES "${OSQUERY_DATA_PATH}/control/deb/etc/init.d/osqueryd"
  DESTINATION "/etc/init.d"
  COMPONENT osquery

  PERMISSIONS
    OWNER_READ OWNER_WRITE OWNER_EXECUTE
    GROUP_READ             GROUP_EXECUTE
    WORLD_READ             WORLD_EXECUTE
)

install(
  FILES "${OSQUERY_DATA_PATH}/control/deb/etc/default/osqueryd"
  DESTINATION "/etc/default"
  COMPONENT osquery
)
