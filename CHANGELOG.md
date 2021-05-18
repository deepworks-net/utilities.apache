# apache-scripts Changelog

## (05/17/2021) 1.2.0:
    - OpenSSL can now be built and installed from source using the config system
    - Added building of OpenSSL from source to run script
    - Updated apache build scripts to prefer OpenSSL built from source
    - Split out apache and openssl build scripts
    - Removed apr, apr-util, openssl, openssl-devel from dependency scripts
    - Manually removed cache from Alpine builds
    - Pulled shared functions out into a seperate folder
    - Split run steps out into included files so each task can be run individually
    - Added layout configuration file and parse capabilities to OpenSSL source build
    - Added build options configuration file and parse capabilities to OpenSSL source build
    - Added apache and openssl library paths to LD_LIBRARY_PATH environmental variable via the generated config file
    - Added cleanup scripts to remove build artifacts to reduce the overall foot print of the installs
    - Added OpenSSL configuration defaults for Minimal and Alpine builds
    - Moved sha256 and sha1 hashes to files allowing for more flexibility in which versions can be downloaded
    - Added ability for scripts to automatically exit on error
    - Added required-utils install/uninstall scripts that will install the minimum required programs to run the scripts.

## (05/10/2021) 1.1.1:
    - Fixed issue in run script where it was not pulling sources from the dist folder

## (05/10/2021) 1.1.0:
    - Removed running the run script in Dockerfile
    - Updated apache build scripts to run via relative paths
    - Changed build script structure to require being run/placed in the root build directory
    - Moved dependency install/uninstall scripts to the root folder
    - Renamed apache-src.sh to httpd-src.sh
    - Created a run script at the root that will download sources if they do not exist and then compile them
    - Added readme/docs for use

## (05/07/2021) 1.0.4:
    - Renamed gsrc.sh script to get-sources.sh
    - Split out Apache and OpenSSL source download scripts
    - Removed ability to pass in a custom 'OUT' directory in the source scripts- the location of downloaded sources will be reliable
    - Updated the sources directory structure to split out 'applications'

## (05/05/2021) 1.0.3:
    - Updated gsrc.sh script to build sources into a new directory structure
    - Added Dockerfile and docker-compose file for testing
    - Added sources documentation file
    - Updated the run script to pull in the sources

## (05/04/2021) 1.0.2:
    - Reduced install/uninstall scripts to one file

## (04/24/2021) 1.0.1:
    - Added default configs folder

## (04/24/2021) 1.0.0:
    - Initial Version
