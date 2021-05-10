# Build Scripts
The build scripts are found in the build folder. To compile and install Apache run the 'install.sh' script. To configure the Apache install, run the 'configure.sh' script. The configure script relies on environmental variables generated via the install script. The following Environmental Variables are required:<br/>
<ul>
    <li>
        LAYOUT - The httpd installation layout to use. If nothing is set, it defaults to 'Apache'. The same value is used for apr and apr-util compilation. Add/customize layouts by modifying the config.layout files in the configs directory.
    </li>
    <li>
        OPTIONS - The httpd compile options to use. If nothing is set, it defaults to 'All'. Add/customize layouts by modifying the config.options files in the configs directory.
    </li>
    <li>
        CONFIG - The httpd configuration to use. If nothing is set, it defaults to 'Apache'. Add/customize layouts by modifying the config.httpd files in the configs directory.
    </li>
</ul>