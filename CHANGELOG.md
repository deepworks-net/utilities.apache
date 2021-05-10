# apache-scripts Changelog

(05/10/2021) 1.1.0:<br/>
    - Removed running the run script in Dockerfile<br/>
    - Updated apache build scripts to run via relative paths<br/>
    - Changed build script structure to require being run/placed in the root build directory<br/>
    - Moved dependency install/uninstall scripts to the root folder<br/>
    - Renamed apache-src.sh to httpd-src.sh<br/>
    - Created a run script at the root that will download sources if they do not exist and then compile them<br/>
    - Added readme/docs for use<br/>
<br/>
(05/07/2021) 1.0.4:<br/>
    - Renamed gsrc.sh script to get-sources.sh<br/>
    - Split out Apache and OpenSSL source download scripts<br/>
    - Removed ability to pass in a custom 'OUT' directory in the source scripts- the location of downloaded sources will be reliable<br/>
    - Updated the sources directory structure to split out 'applications'<br/>
<br/>
(05/05/2021) 1.0.3:<br/>
    - Updated gsrc.sh script to build sources into a new directory structure<br/>
    - Added Dockerfile and docker-compose file for testing<br/>
    - Added sources documentation file<br/>
    - Updated the run script to pull in the sources<br/>
<br/>
(05/04/2021) 1.0.2:<br/>
    - Reduced install/uninstall scripts to one file<br/>
<br/>
(04/24/2021) 1.0.1:<br/>
    - Added default configs folder<br/>
<br/>
(04/24/2021) 1.0.0:<br/>
    - Initial Version<br/>
