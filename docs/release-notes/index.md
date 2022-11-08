# Release Notes

## v1.4.x

???+ info "v1.4.0 - Released (11/07/2022)"

    <a href="https://github.com/deepworks-net/apache-scripts/releases/tag/v1.4.0" target="_blank" title="v1.4.0 Release">v1.4.0</a> Changes:

    - Updated httpd sources scripts from 2.4.53 to 2.4.54
    - Updated openssl sources scripts from 1.1.1n to 1.1.1s
    - Reworked documentation to build via MkDocs
    - Added github action to publish the MkDocs
    - Added MIT License
    - Updated CHANGELOG.md to point to the release notes index.md file

    **Full Changelog**: [`v1.3.0...v1.4.0`](https://github.com/deepworks-net/apache-scripts/compare/v1.3.0...v1.4.0)

## v1.3.x

???+ info "v1.3.0 - Released (03/15/2022)"

    <a href="https://github.com/deepworks-net/apache-scripts/releases/tag/v1.3.0" target="_blank" title="v1.3.0 Release">v1.3.0</a> Changes:

    - Updated test environment to utilize regular base image versions
    - Updated httpd sources scripts from 2.4.46 to 2.4.53
    - Updated openssl sources scripts from 1.1.1k to 1.1.1n

    **Full Changelog**: [`v1.2.0...v1.3.0`](https://github.com/deepworks-net/apache-scripts/compare/v1.2.0...v1.3.0)

## v1.2.x

???+ info "v1.2.1 - Released (05/26/2021)"

    <a href="https://github.com/deepworks-net/apache-scripts/releases/tag/v1.2.1" target="_blank" title="v1.2.1 Release">v1.2.1</a> Changes:

    - Added zlib dependencies to CentOS7 and CentOS8 Builds

    **Full Changelog**: [`v1.2.0...v1.2.0`](https://github.com/deepworks-net/apache-scripts/compare/v1.2.0...v1.2.1)

???+ info "v1.2.0 - Released (05/17/2021)"

    <a href="https://github.com/deepworks-net/apache-scripts/releases/tag/v1.2.0" target="_blank" title="v1.2.0 Release">v1.2.0</a> Changes:

    - OpenSSL can now be built and installed from source using the config system
    - Added building of OpenSSL from source to run script
    - Updated apache build scripts to prefer OpenSSL built from source
    - Split out apache and openssl build scripts
    - Removed apr, apr-util, openssl, openssl-devel from dependency scripts
    - Manually removed cache from Alpine builds
    - Pulled shared functions out into a separate folder
    - Split run steps out into included files so each task can be run individually
    - Added layout configuration file and parse capabilities to OpenSSL source build
    - Added build options configuration file and parse capabilities to OpenSSL source build
    - Added apache and openssl library paths to LD_LIBRARY_PATH environmental variable via the generated config file
    - Added cleanup scripts to remove build artifacts to reduce the overall foot print of the installs
    - Added OpenSSL configuration defaults for Minimal and Alpine builds
    - Moved sha256 and sha1 hashes to files allowing for more flexibility in which versions can be downloaded
    - Added ability for scripts to automatically exit on error
    - Added required-utils install/uninstall scripts that will install the minimum required programs to run the scripts.

    **Full Changelog**: [`v1.1.1...v1.2.0`](https://github.com/deepworks-net/apache-scripts/compare/v1.1.1...v1.2.0)

## v1.1.x

???+ info "v1.1.1 - Released (05/10/2021)"

    <a href="https://github.com/deepworks-net/apache-scripts/releases/tag/v1.1.1" target="_blank" title="v1.1.1 Release">v1.1.1</a> Changes:

    - Fixed issue in run script where it was not pulling sources from the dist folder

    **Full Changelog**: [`v1.1.0...v1.1.1`](https://github.com/deepworks-net/apache-scripts/compare/v1.1.0...v1.1.1)

???+ info "v1.1.0 - Released (05/10/2021)"

    <a href="https://github.com/deepworks-net/apache-scripts/releases/tag/v1.1.0" target="_blank" title="v1.1.0 Release">v1.1.0</a> Changes:

    - Removed running the run script in Dockerfile
    - Updated apache build scripts to run via relative paths
    - Changed build script structure to require being run/placed in the root build directory
    - Moved dependency install/uninstall scripts to the root folder
    - Renamed apache-src.sh to httpd-src.sh
    - Created a run script at the root that will download sources if they do not exist and then compile them
    - Added readme/docs for use

    **Full Changelog**: [`v1.0.4...v1.1.0`](https://github.com/deepworks-net/apache-scripts/compare/v1.0.4...v1.1.0)

## v1.0.x

???+ info "v1.0.4 - Released (05/07/2021)"

    <a href="https://github.com/deepworks-net/apache-scripts/releases/tag/v1.0.4" target="_blank" title="v1.0.4 Release">v1.0.4</a> Changes:

    - Renamed gsrc.sh script to get-sources.sh
    - Split out Apache and OpenSSL source download scripts
    - Removed ability to pass in a custom 'OUT' directory in the source scripts- the location of downloaded sources will be reliable
    - Updated the sources directory structure to split out 'applications'

    **Full Changelog**: [`v1.0.3...v1.0.4`](https://github.com/deepworks-net/apache-scripts/compare/v1.0.3...v1.0.4)

???+ info "v1.0.3 - Released (05/05/2021)"

    <a href="https://github.com/deepworks-net/apache-scripts/releases/tag/v1.0.3" target="_blank" title="v1.0.3 Release">v1.0.3</a> Changes:

    - Updated gsrc.sh script to build sources into a new directory structure
    - Added Dockerfile and docker-compose file for testing
    - Added sources documentation file
    - Updated the run script to pull in the sources

    **Full Changelog**: [`v1.0.2...v1.0.3`](https://github.com/deepworks-net/apache-scripts/compare/v1.0.2...v1.0.3)

???+ info "v1.0.2 - Released (05/04/2021)"

    <a href="https://github.com/deepworks-net/apache-scripts/releases/tag/v1.0.2" target="_blank" title="v1.0.2 Release">v1.0.2</a> Changes:

    - Reduced install/uninstall scripts to one file

    **Full Changelog**: [`v1.0.1...v1.0.2`](https://github.com/deepworks-net/apache-scripts/compare/v1.0.1...v1.0.2)

???+ info "v1.0.1 - Released (04/24/2021)"

    <a href="https://github.com/deepworks-net/apache-scripts/releases/tag/v1.0.1" target="_blank" title="v1.0.1 Release">v1.0.1</a> Changes:

    - Added default configs folder

    **Full Changelog**: [`v1.0.0...v1.0.1`](https://github.com/deepworks-net/apache-scripts/compare/v1.0.0...v1.0.1)

???+ info "v1.0.0 - Released (04/24/2021)"

    <a href="https://github.com/deepworks-net/apache-scripts/releases/tag/v1.0.0" target="_blank" title="v1.0.0 Release">v1.0.0</a> Changes:

    - Initial version