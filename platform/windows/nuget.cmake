#
# Copyright (c) 2014-present, The osquery authors
#
# This source code is licensed as defined by the LICENSE file found in the
# root directory of this source tree.
#
# SPDX-License-Identifier: (Apache-2.0 OR GPL-2.0-only)
#

install(
  DIRECTORY "${OSQUERY_DATA_PATH}/control/nupkg/tools"
  DESTINATION "."
  COMPONENT osquery
)

install(
  FILES "${OSQUERY_DATA_PATH}/control/osquery.ico"
  DESTINATION "."
  COMPONENT osquery
)

install(
  FILES "${OSQUERY_DATA_PATH}/control/LICENSE.txt"
  DESTINATION "."
  COMPONENT osquery
)

set(CPACK_NUGET_PACKAGE_DESCRIPTION "
  osquery allows you to easily ask questions about your Linux, macOS, and
  Windows infrastructure. Whether your goal is intrusion detection, 
  infrastructure reliability, or compliance, osquery gives you the ability
  to empower and inform a broad set of organizations within your company.
  
  ### Package Parameters
    * `/InstallService` - This creates a new windows service that will 
                          auto-start the daemon.
                          
  These parameters can be passed to the installer with the use of 
  `--params`. For example: `--params='/InstallService'`.
  "
)
set(OSQUERY_REPO "https://github.com/osquery/osquery/")
set(CPACK_NUGET_PACKAGE_AUTHORS "${CPACK_PACKAGE_NAME}")
set(CPACK_NUGET_PACKAGE_TITLE "${CPACK_PACKAGE_NAME}")
set(CPACK_NUGET_PACKAGE_OWNERS "${CPACK_PACKAGE_NAME}")
set(CPACK_NUGET_PACKAGE_COPYRIGHT "Copyright (c) 2014-present, The osquery authors. See LICENSE.")
set(CPACK_NUGET_PACKAGE_LICENSE_FILE_NAME "LICENSE.txt")
set(CPACK_NUGET_PACKAGE_ICON "osquery.ico")
set(CPACK_NUGET_PACKAGE_DESCRIPTION_SUMMARY "
  osquery gives you the ability to query and log things like running 
  processes, logged in users, password changes, usb devices, firewall 
  exceptions, listening ports, and more.
  "
)
set(CPACK_NUGET_PACKAGE_RELEASE_NOTES "${OSQUERY_REPO}releases/tag/${CPACK_PACKAGE_VERSION}")
set(CPACK_NUGET_PACKAGE_TAGS "infosec tools security")
