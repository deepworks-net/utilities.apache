# Current Information on the apache 'Sources' scripts
The 'Sources' script pulls down the apache sources and required packages for building from source. Run 'get-sources.sh' to get all sources. Run '${app-name}-src.sh' to get the sources of '${app-name}'.<br/>
<br/>
After the 'get-sources.sh' is run, the following is created in the working directory:<br/>
<br/>
--/httpd-src - The root directory for httpd sources (httpd, mod_fcgid, apr, and apr-util)<br/>
&nbsp;&nbsp;--/httpd - The current httpd and fcgid sources combined together<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--/srclib<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--/apr - Current apr sources<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--/apr-util - Current apr-util sources<br/>
&nbsp;&nbsp;--/src<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--/apr - Current apr sources ([apr-1.7.0](https://apr.apache.org/download.cgi))<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--/apr-util - Current apr-util sources ([apr-util-1.6.1](https://apr.apache.org/download.cgi))<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--/httpd - Current httpd/apache sources ([httpd-2.4.53](https://httpd.apache.org/download.cgi))<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--/fcgid - Current mod_fcgid sources ([mod_fcgid-2.3.9](https://httpd.apache.org/download.cgi))<br/>
&nbsp;&nbsp;--/zip - Copies of the above source files in their archive format<br/>
--/openssl-src - The root directory for openssl sources<br/>
&nbsp;&nbsp;--/openssl - The current openssl sources<br/>
&nbsp;&nbsp;--/src<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--/openssl - Current OpenSSL sources ([openssl-1.1.1n](https://www.openssl.org/source/))<br/>
&nbsp;&nbsp;--/zip - Copies of the above source files in their archive format<br/>
