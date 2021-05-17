# apache-scripts Changelog

## (05/17/2021) 1.2.0:
    - OpenSSL can now be built and installed from source using the config system<br/>
    - Added building of OpenSSL from source to run script<br/>
    - Updated apache build scripts to prefer OpenSSL built from source<br/>
    - Split out apache and openssl build scripts<br/>
    - Removed apr, apr-util, openssl, openssl-devel from dependency scripts<br/>
    - Manually removed cache from Alpine builds<br/>
    - Pulled shared functions out into a seperate folder<br/>
    - Split run steps out into included files so each task can be run individually<br/>
    - Added layout configuration file and parse capabilities to OpenSSL source build<br/>
    - Added build options configuration file and parse capabilities to OpenSSL source build<br/>
    - Added apache and openssl library paths to LD_LIBRARY_PATH environmental variable via the generated config file<br/>
    - Added cleanup scripts to remove build artifacts to reduce the overall foot print of the installs<br/>
    - Added OpenSSL configuration defaults for Minimal and Alpine builds<br/>
    - Moved sha256 and sha1 hashes to files allowing for more flexibility in which versions can be downloaded<br/>
    - Added ability for scripts to automatically exit on error<br/>
    - Added required-utils install/uninstall scripts that will install the minimum required programs to run the scripts.<br/>

## (05/10/2021) 1.1.1:
    - Fixed issue in run script where it was not pulling sources from the dist folder<br/>

## (05/10/2021) 1.1.0:
    - Removed running the run script in Dockerfile<br/>
    - Updated apache build scripts to run via relative paths<br/>
    - Changed build script structure to require being run/placed in the root build directory<br/>
    - Moved dependency install/uninstall scripts to the root folder<br/>
    - Renamed apache-src.sh to httpd-src.sh<br/>
    - Created a run script at the root that will download sources if they do not exist and then compile them<br/>
    - Added readme/docs for use<br/>

## (05/07/2021) 1.0.4:
    - Renamed gsrc.sh script to get-sources.sh<br/>
    - Split out Apache and OpenSSL source download scripts<br/>
    - Removed ability to pass in a custom 'OUT' directory in the source scripts- the location of downloaded sources will be reliable<br/>
    - Updated the sources directory structure to split out 'applications'<br/>

## (05/05/2021) 1.0.3:
    - Updated gsrc.sh script to build sources into a new directory structure<br/>
    - Added Dockerfile and docker-compose file for testing<br/>
    - Added sources documentation file<br/>
    - Updated the run script to pull in the sources<br/>

## (05/04/2021) 1.0.2:
    - Reduced install/uninstall scripts to one file<br/>

## (04/24/2021) 1.0.1:
    - Added default configs folder<br/>

## (04/24/2021) 1.0.0:
    - Initial Version<br/>
