# Current Configuration
The [config.httpd](configs/httpd/config.httpd) file provides many different ways to configure how the httpd.conf file is configured after install. Manual configuration may still need to be performed after applying the settings in config.httpd.<br/>

## Current supported options
WSERVERNAME - Sets the ServerName option<br/>
WSERVERADMIN - Sets the ServerAdmin option<br/>

WHTTPS_REDIRECT - Sets Apache to automagically redirect from http to https (required mod_redirect). Accepted value is 'yes'.<br/>

### Mods
Options that start with 'WMOD' will enable the module. If no value is passed (you still need the ':' in the config!) it will default to 'yes'. 'no' is the equivalent to any option that starts with 'WOMOD', which will not use the module. Possible values for 'WMOD/WOMOD' are: yes|no.<br/>

WMOD_FCGID - Configure for use with mod_fcgid.<br/>
WOMOD_FCGID - Remove configuration for use with mod_fcgid.<br/>
WMOD_REWRITE - Configure for use with mod_rewrite.<br/>
WOMOD_REWRITE - Remove configuration for use with mod_rewrite.<br/>
WMOD_DEFLATE - Configure for use with mod_deflate.<br/>
WOMOD_DEFLATE - Remove configuration for use with mod_deflate.<br/>
WMOD_SSL - Configure for use with mod_ssl.<br/>
WOMOD_SSL - Remove configuration for use with mod_ssl.<br/>
WMOD_SPELING - Configure for use with mod_speling.<br/>
WOMOD_SPELING - Remove configuration for use with mod_speling.<br/>
WMOD_HTTP2 - Configure for use with mod_http2.<br/>
WOMOD_HTTP2 - Remove configuration for use with mod_http2.<br/>
WMOD_SYSTEMD - Configure for use with mod_systemd.<br/>
WOMOD_SYSTEMD - Remove configuration for use with mod_systemd.<br/>

