# Apache Configuration Scripts

## Overview
These are some scripts that help streamline the process of customizing and building apache from source. The following Linux OS versions are (currently) supported: Alpine, CentOS 7/8 and RockyLinux. The environmental variable 'IMAGE_BASE' is required and needs to be declared and set to Alpine, CentOS7, CentOS8 or RockyLinux.

## Latest Releases
<a href="https://github.com/deepworks-net/apache-scripts/releases/latest" title="Latest Stable Release" target="_blank">![Current Version](https://shields.io/github/v/release/deepworks-net/apache-scripts?display_name=tag&sort=semver)</a>

## Quick Start
Download this repository and copy the scripts to a location of your choice. From within the directory run:
```SHELL
sudo ./run.sh
```

This will start the automated script which will build and configure apache for your system.

## Customization

The build process can be customized in a few ways:

1. Add custom configuration files to control install/config options. Choose the appropriate configs by setting the following environmental variables:
    - LAYOUT - The httpd installation layout to use. If nothing is set, it defaults to 'Apache'. The same value is used for apr and apr-util compilation. Add/customize layouts by modifying the config.layout files in the configs/httpd directory.
    - OPTIONS - The httpd compile options to use. If nothing is set, it defaults to 'All'. Add/customize layouts by modifying the config.options files in the configs/httpd directory.
    - CONFIG - The httpd configuration to use. If nothing is set, it defaults to 'Apache'. Add/customize layouts by modifying the config.httpd files in the configs/httpd directory.
    - SSL_LAYOUT - The openssl installation layout to use. If nothing is set, it defaults to 'OpenSSL'. Add/customize layouts by modifying the config.layout files in the configs/openssl directory.
    - SSL_OPTIONS - The openssl compile options to use. If nothing is set, it defaults to 'Minimal'. Add/customize layouts by modifying the config.options files in the configs/openssl directory.
1. Use custom source versions or download the very latest versions automatically. Place your source files in: 'dist/${app-name}-src'. If the folder exists, the source files will not be downloaded.

## Sources Scripts
View information on the source scripts [here](sources). These can be run independently from the automated run script.

## Config Files
View information on the config files [here](config).

## Build Scripts
View information on the build scripts [here](build). These can be run independently from the automated run script.