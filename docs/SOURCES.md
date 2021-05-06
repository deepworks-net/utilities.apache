# Current Information on the apache 'Sources' script
The 'Sources' script pulls down the apache sources and required packages for building from source.

After the script is run, the following is created in the OUT directory:<br/>
<br/>
--/httpd - The current httpd and fcgid sources combined together<br/>
&nbsp;&nbsp;--/srclib<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--/apr - Current apr sources<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--/apr-util - Current apr-util sources<br/>
&nbsp;&nbsp;&nbsp;&nbsp;--/openssl - Current openssl sources<br/>
--/src<br/>
&nbsp;&nbsp;--/apr - Current apr sources ([apr-1.7.0](https://apr.apache.org/download.cgi))<br/>
&nbsp;&nbsp;--/apr-util - Current apr-util sources ([apr-util-1.6.1](https://apr.apache.org/download.cgi))<br/>
&nbsp;&nbsp;--/httpd - Current httpd/apache sources ([httpd-2.4.46](https://httpd.apache.org/download.cgi))<br/>
&nbsp;&nbsp;--/fcgid - Current mod_fcgid sources ([mod_fcgid-2.3.9](https://httpd.apache.org/download.cgi))<br/>
&nbsp;&nbsp;--/openssl - Current OpenSSL sources ([openssl-1.1.1k](https://www.openssl.org/source/))<br/>
--/zip - Copies of the above source files in their archive format<br/>
