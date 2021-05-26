# apache-scripts - Current version 1.2.1
These are some scripts that help streamline the process of customizing and building apache from source. The following Linux OS versions are supported: Alpine and CentOS 7/8. The environmental variable 'IMAGE_BASE' is required and needs to be declared and set to Alpine, CentOS7 or CentOS8.

# Quick Start
Copy the scripts folder to the OS in a location of your choice. CD to the directory and run the command "sudo ./run.sh" to start the automated run script. 

# Customization of the automated run script
The build process can be customized in a few ways:<br/>
<ol>
    <li>
        Add custom configuration files to control install/config options. Choose the appropriate configs by setting the following environmental variables:
        <ul>
            <li>
                LAYOUT - The httpd installation layout to use. If nothing is set, it defaults to 'Apache'. The same value is used for apr and apr-util compilation. Add/customize layouts by modifying the config.layout files in the configs/httpd directory.
            </li>
            <li>
                OPTIONS - The httpd compile options to use. If nothing is set, it defaults to 'All'. Add/customize layouts by modifying the config.options files in the configs/httpd directory.
            </li>
            <li>
                CONFIG - The httpd configuration to use. If nothing is set, it defaults to 'Apache'. Add/customize layouts by modifying the config.httpd files in the configs/httpd directory.
            </li>
            <li>
                SSL_LAYOUT - The openssl installation layout to use. If nothing is set, it defaults to 'OpenSSL'. Add/customize layouts by modifying the config.layout files in the configs/openssl directory.
            </li>
            <li>
                SSL_OPTIONS - The openssl compile options to use. If nothing is set, it defaults to 'Minimal'. Add/customize layouts by modifying the config.options files in the configs/openssl directory.
            </li>
        </ul>
    </li>
    <li>
        Use custom source versions or download the very latest versions automatically. Place your source files in: 'dist/${app-name}-src'. If the folder exists, the source files will not be downloaded.
    </li>
</ol>

# Sources Scripts
View information on the sources scripts [here](docs/SOURCES.md). These can be run independantly from the automated run script.

# Config Files
View information on the config files [here](docs/CONFIGS.md).

# Build Scripts
View information on the build scripts [here](docs/BUILD.md). These can be run independantly from the automated run script.