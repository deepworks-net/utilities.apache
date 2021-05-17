# Build Scripts
The build scripts are found in the build folder and are used to compile various applications with easy to use configure files and ultimately compile a custom version of Apache.<br/> 
<br/>
To compile and install OpenSSL run the 'build-openssl.sh' script. The following Environmental Variables are required:<br/>
<ul>
    <li>
        SSL_LAYOUT - The openssl installation layout to use. If nothing is set, it defaults to 'OpenSSL'. Add/customize layouts by modifying the config.layout files in the configs/openssl directory.
    </li>
    <li>
        SSL_OPTIONS - The openssl compile options to use. If nothing is set, it defaults to 'Minimal'. Add/customize layouts by modifying the config.options files in the configs/openssl directory.
    </li>
</ul>
<br/>
To compile and install Apache run the 'build-httpd.sh' script. The following Environmental Variables are required:<br/>
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
</ul>