require 'spec_helper'

#####################
# INCLUDE VARS HERE
#####################
service_name = "httpd_cct1"
listen_port_http = "11001"
listen_port_https = "11101"
tomcat_addr = "localhost"
tomcat_port = "21001"
#####################

### ServiceName
describe service( "#{service_name}" ) do
  it { should be_enabled }
  it { should be_running }
end



### Files
describe file( "/etc/#{service_name}/bin/apachectl" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "755" ) }
end

describe file( "/etc/#{service_name}/conf/httpd.conf" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/etc/#{service_name}/conf/extra/httpd-mpm.conf" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/etc/#{service_name}/conf/extra/httpd-multilang-errordoc.conf" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/etc/#{service_name}/conf/extra/httpd-info.conf" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/etc/#{service_name}/conf/extra/httpd-default.conf" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/etc/#{service_name}/conf/extra/httpd-jk.conf" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/etc/#{service_name}/conf/extra/workers.properties" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/etc/#{service_name}/conf/extra/uriworkermap.properties" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/etc/#{service_name}/conf/extra/httpd-security.conf" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end



### httpd.conf
# ServerRoot
describe command( "grep -Ec '^ServerRoot' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^0$/ }
end

# Listen(HTTP)
describe command( "grep -Ec '^Listen' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^Listen' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^Listen #{listen_port_http}$/ }
end

describe port( "#{listen_port_http}" ) do
  it { should be_listening }
end

# User
describe command( "grep -Ec '^User' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^User' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^User apache$/ }
end

# Group
describe command( "grep -Ec '^Group' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^Group' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^Group apache$/ }
end

# ServerAdmin
describe command( "grep -Ec '^ServerAdmin' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^ServerAdmin' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^ServerAdmin root@localhost$/ }
end

# ServerName
describe command( "grep -Ec '^ServerName' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^ServerName' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^ServerName localhost:#{listen_port_http}$/ }
end

# DocumentRoot
describe command( "grep -Ec '^DocumentRoot' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^DocumentRoot' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^DocumentRoot "\/etc\/#{service_name}\/docs"$/ }
end

describe command( "grep -Ec '^<Directory \"/etc/#{service_name}/docs\">$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# DirectoryIndex
describe command( "grep -Ec '^\s*DirectoryIndex' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^\s*DirectoryIndex' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^\s*DirectoryIndex index\.html$/ }
end

# ErrorLog
describe command( "grep -Ec '^ErrorLog' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^ErrorLog' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^ErrorLog "logs\/error_log"$/ }
end

# LogLevel
describe command( "grep -Ec '^LogLevel' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^LogLevel' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^LogLevel warn$/ }
end

# CustomLog
describe command( "grep -Ec '^\s*LogFormat .+ combined$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^\s*LogFormat .+ combined$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /LogFormat "%t %h %{X-Forwarded-For}i %l %u \\"%r\\" %>s %b \\"%{Referer}i\\" \\"%{User-Agent}i\\" %X %D #%{Host}i#" combined$/ }
end

# SetEnvIf(Request_URI)
describe command( "grep -Ec '^\s*SetEnvIf Request_URI \"\\\\\.ico\\$\" no_log' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# CustomLog
describe command( "grep -Ec '^\s*CustomLog .+ combined env=!no_log$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^\s*CustomLog .+ combined env=!no_log$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /CustomLog "logs\/access_log" combined env=!no_log$/ }
end

# RequestHeader(unset)
describe command( "grep -Ec '^\s*RequestHeader unset' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^\s*RequestHeader unset' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /RequestHeader unset Proxy early$/ }
end

# TypesConfig
describe command( "grep -Ec '^\s*TypesConfig' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^\s*TypesConfig' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /TypesConfig conf\/mime\.types$/ }
end

# AddType
describe command( "grep -Ec '^\s*AddType application\/x-compress \\.Z$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*AddType application\/x-gzip \\.gz \\.tgz$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*AddType application\/x-x509-ca-cert \\.crt$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*AddType application\/x-pkcs7-crl \\.crl$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# AddHandler
describe command( "grep -Ec '^\s*AddHandler type-map var$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# AddOutputFilter
describe command( "grep -Ec '^\s*AddOutputFilter INCLUDES \\.shtml$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# MIMEMagicFile
describe command( "grep -Ec '^MIMEMagicFile conf\/magic$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# EnableMMAP
describe command( "grep -Ec '^EnableMMAP on$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# EnableSendfile
describe command( "grep -Ec '^EnableSendfile on$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# BrowserMatch
describe command( "grep -Ec '^BrowserMatch \"Mozilla/2\" nokeepalive$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^BrowserMatch \"MSIE 4\\\\.0b2;\" nokeepalive downgrade-1\\.0 force-response-1.0$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^BrowserMatch \"RealPlayer 4\\\\.0\" force-response-1.0$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^BrowserMatch \"Java/1\\\\.0\" force-response-1\\.0$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^BrowserMatch \"JDK/1\\\\.0\" force-response-1\\.0$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^BrowserMatch \"Microsoft Data Access Internet Publishing Provider\" redirect-carefully$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^BrowserMatch \"MS FrontPage\" redirect-carefully$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^BrowserMatch \"\\^WebDrive\" redirect-carefully$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^BrowserMatch \"\\^WebDAVFS/1\\.\\\[0123\\\]\" redirect-carefully$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^BrowserMatch \"\\^gnome-vfs/1\\.0\" redirect-carefully$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^BrowserMatch \"\\^XML Spy\" redirect-carefully$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^BrowserMatch \"\\^Dreamweaver-WebDAV-SCM1\" redirect-carefully$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end
 
# Redirect
describe command( "grep -Ec '^Redirect 404 /favicon\\.ico$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# Location(/favicon.ico)
describe command( "grep -Ec '^ErrorDocument 404 \"No favicon\"$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# RewriteEngine
describe command( "grep -Ec '^RewriteEngine On$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# SetEnvIf(X-Forwarded-For)
describe command( "grep -Ec '^SetEnvIf X-Forwarded-For \"\\.\\+\" forwarded$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# RewriteRule(CLIENT_ADDR.html)
describe command( "grep -Ec '^RewriteRule \\^\\(\\.\\*\\) - \\[E=CLIENT_ADDR:%{REMOTE_ADDR}\\]$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# RequestHeader
describe command( "grep -Ec '^RequestHeader set X-Forwarded-For \"%{CLIENT_ADDR}e\" env=!forwarded$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# RewriteRule(CCT)
describe command( "grep -Ec '^RewriteRule \\^/\\?\\$ /jstorage-jets/ \\[R,L\\]$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# TraceEnable
describe command( "grep -Ec '^TraceEnable Off$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# LimitRequestBody
describe command( "grep -Ec '^LimitRequestBody 1073741824$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# FileETag
describe command( "grep -Ec '^FileETag MTime Size$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# LoadModule
describe command( "grep -Ec '^LoadModule authz_host_module modules/mod_authz_host\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule authz_core_module modules/mod_authz_core\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule cache_module modules/mod_cache\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule cache_disk_module modules/mod_cache_disk\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule socache_shmcb_module modules/mod_socache_shmcb\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule ext_filter_module modules/mod_ext_filter\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule include_module modules/mod_include\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule substitute_module modules/mod_substitute\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule deflate_module modules/mod_deflate\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule mime_module modules/mod_mime\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule log_config_module modules/mod_log_config\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule logio_module modules/mod_logio\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule env_module modules/mod_env\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule mime_magic_module modules/mod_mime_magic\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule expires_module modules/mod_expires\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule headers_module modules/mod_headers\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule setenvif_module modules/mod_setenvif\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule version_module modules/mod_version\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule ssl_module modules/mod_ssl\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule unixd_module modules/mod_unixd\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule status_module modules/mod_status\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule autoindex_module modules/mod_autoindex\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule info_module modules/mod_info\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule vhost_alias_module modules/mod_vhost_alias\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule negotiation_module modules/mod_negotiation\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule dir_module modules/mod_dir\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule speling_module modules/mod_speling\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule alias_module modules/mod_alias\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule rewrite_module modules/mod_rewrite\\.so$' /etc/#{service_name}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end



### httpd-mpm.conf
# ThreadLimit
describe command( "grep -Ec '^\s*ThreadLimit\s*200$' /etc/#{service_name}/conf/extra/httpd-mpm.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# StartServers
describe command( "grep -Ec '^\s*StartServers\s*1$' /etc/#{service_name}/conf/extra/httpd-mpm.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# MinSpareThreads
describe command( "grep -Ec '^\s*MinSpareThreads\s*50$' /etc/#{service_name}/conf/extra/httpd-mpm.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# MaxSpareThreads
describe command( "grep -Ec '^\s*MaxSpareThreads\s*160$' /etc/#{service_name}/conf/extra/httpd-mpm.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# ThreadsPerChild
describe command( "grep -Ec '^\s*ThreadsPerChild\s*200$' /etc/#{service_name}/conf/extra/httpd-mpm.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# MaxRequestsWorkers
describe command( "grep -Ec '^\s*MaxRequestWorkers\s*400$' /etc/#{service_name}/conf/extra/httpd-mpm.conf" ) do
  its( :stdout ) { should match /^2$/ }
end

# MaxConnectionsPerChild
describe command( "grep -Ec '^\s*MaxConnectionsPerChild\s*10000$' /etc/#{service_name}/conf/extra/httpd-mpm.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# MaxMemFree
describe command( "grep -Ec '^\s*MaxMemFree\s*2048$' /etc/#{service_name}/conf/extra/httpd-mpm.conf" ) do
  its( :stdout ) { should match /^2$/ }
end



### httpd-multilang-errordoc.conf
# Alias
describe command( "grep -Ec '^Alias /error/ \"/etc/#{service_name}/error/\"$' /etc/#{service_name}/conf/extra/httpd-multilang-errordoc.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# Directory
describe command( "grep -Ec '^<Directory \"/etc/#{service_name}/error\">$' /etc/#{service_name}/conf/extra/httpd-multilang-errordoc.conf" ) do
  its( :stdout ) { should match /^1$/ }
end



### httpd-autoindex.conf
# IndexOptions
describe command( "grep -Ec '^IndexOptions FancyIndexing VersionSort NameWidth=\\* HTMLTable Charset=UTF-8$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# Directory
describe command( "grep -Ec '^\s*Options Indexes MultiViews FollowSymLinks$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*AllowOverride None$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*Require ip 127\\.0\\.0\\.1/32$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# AddIconByEncoding
describe command( "grep -Ec '^AddIconByEncoding \\(CMP,/icons/compressed\\.gif\\) x-compress x-gzip$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# AddIconByType
describe command( "grep -Ec '^AddIconByType \\(TXT,/icons/text\\.gif\\) text/\\*$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIconByType \\(IMG,/icons/image2\\.gif\\) image/\\*$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIconByType \\(SND,/icons/sound2\\.gif\\) audio/\\*$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIconByType \\(VID,/icons/movie\\.gif\\) video/\\*$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# AddIconByType
describe command( "grep -Ec '^AddIcon /icons/binary\\.gif \\.bin \\.exe$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/binhex\\.gif \\.hqx$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/tar\\.gif \\.tar$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/world2\\.gif \\.wrl \\.wrl\\.gz \\.vrml \\.vrm \\.iv$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/compressed\\.gif \\.Z \\.z \\.tgz \\.gz \\.zip$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/a\\.gif \\.ps \\.ai \\.eps$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/layout\\.gif \\.html \\.shtml \\.htm \\.pdf$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/text\\.gif \\.txt$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/c\\.gif \\.c$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/p\\.gif \\.pl \\.py$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/f\\.gif \\.for$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/dvi\\.gif \\.dvi$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/uuencoded\\.gif \\.uu$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/script\\.gif \\.conf \\.sh \\.shar \\.csh \\.ksh \\.tcl$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/tex\\.gif \\.tex$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/bomb\\.gif core$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/bomb\\.gif core$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/back\\.gif \\.\\.$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/hand\\.right\\.gif README$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/folder\\.gif \\^\\^DIRECTORY\\^\\^$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddIcon /icons/blank\\.gif \\^\\^BLANKICON\\^\\^$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# DefaultIcon
describe command( "grep -Ec '^DefaultIcon /icons/unknown\\.gif$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# ReadmeName
describe command( "grep -Ec '^ReadmeName README\\.html$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# HeaderName
describe command( "grep -Ec '^HeaderName HEADER\\.html$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# IndexIgnore
describe command( "grep -Ec '^IndexIgnore \\.\\?\\?\\* \\*~ \\*# HEADER\\* README\\* RCS CVS \\*,v \\*,t$' /etc/#{service_name}/conf/extra/httpd-autoindex.conf" ) do
  its( :stdout ) { should match /^1$/ }
end



### httpd-languages.comf
# AddLanguage
describe command( "grep -Ec '^AddLanguage ca \\.ca$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage cs \\.cz \\.cs$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage da \\.dk$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage de \\.de$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage el \\.el$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage en \\.en$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage eo \\.eo$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage es \\.es$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage et \\.et$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage fr \\.fr$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage he \\.he$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage hr \\.hr$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage it \\.it$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage ja \\.ja$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage ko \\.ko$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage ltz \\.ltz$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage nl \\.nl$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage nn \\.nn$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage no \\.no$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage pl \\.po$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage pt \\.pt$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage pt-BR \\.pt-br$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage ru \\.ru$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage sv \\.sv$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage tr \\.tr$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage zh-CN \\.zh-cn$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^AddLanguage zh-TW \\.zh-tw$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# LanguagePriority
describe command( "grep -Ec '^LanguagePriority ja en ca cs da de el eo es et fr he hr it ko ltz nl nn no pl pt pt-BR ru sv tr zh-CN zh-TW$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# ForceLanguagePriority
describe command( "grep -Ec '^ForceLanguagePriority Prefer Fallback$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# AddDefaultCharset
describe command( "grep -Ec '^AddDefaultCharset UTF-8$' /etc/#{service_name}/conf/extra/httpd-languages.conf" ) do
  its( :stdout ) { should match /^1$/ }
end



### httpd-info.conf
# Location(server-status)
describe command( "grep -Ec '^<Location /server-status>$' /etc/#{service_name}/conf/extra/httpd-info.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*SetHandler server-status$' /etc/#{service_name}/conf/extra/httpd-info.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*Require ip 127\\.0\\.0\\.1/32$' /etc/#{service_name}/conf/extra/httpd-info.conf" ) do
  its( :stdout ) { should match /^2$/ }
end

# ExtendedStatus
describe command( "grep -Ec '^ExtendedStatus On$' /etc/#{service_name}/conf/extra/httpd-info.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# Location(server-info)
describe command( "grep -Ec '^<Location /server-info>$' /etc/#{service_name}/conf/extra/httpd-info.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*SetHandler server-info$' /etc/#{service_name}/conf/extra/httpd-info.conf" ) do
  its( :stdout ) { should match /^1$/ }
end



### httpd-default.conf
# Timeout
describe command( "grep -Ec '^Timeout 300$' /etc/#{service_name}/conf/extra/httpd-default.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# KeepAlive
describe command( "grep -Ec '^KeepAlive On$' /etc/#{service_name}/conf/extra/httpd-default.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# MaxKeepAliveRequests
describe command( "grep -Ec '^MaxKeepAliveRequests 200$' /etc/#{service_name}/conf/extra/httpd-default.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# KeepAliveTimeout
describe command( "grep -Ec '^KeepAliveTimeout 1200$' /etc/#{service_name}/conf/extra/httpd-default.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# UseCanonicalName
describe command( "grep -Ec '^UseCanonicalName Off$' /etc/#{service_name}/conf/extra/httpd-default.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# AccessFileName
describe command( "grep -Ec '^AccessFileName \\.htaccess$' /etc/#{service_name}/conf/extra/httpd-default.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# ServerTokens
describe command( "grep -Ec '^ServerTokens Prod$' /etc/#{service_name}/conf/extra/httpd-default.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# ServerSignature
describe command( "grep -Ec '^ServerSignature Off$' /etc/#{service_name}/conf/extra/httpd-default.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# HostnameLookups
describe command( "grep -Ec '^HostnameLookups Off$' /etc/#{service_name}/conf/extra/httpd-default.conf" ) do
  its( :stdout ) { should match /^1$/ }
end



### httpd-jk.conf
# LoadModule
describe command( "grep -Ec '^LoadModule jk_module modules/mod_jk\\.so$' /etc/#{service_name}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkWorkersFile
describe command( "grep -Ec '^\s*JkWorkersFile conf/extra/workers\\.properties$' /etc/#{service_name}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkLogFile
describe command( "grep -Ec '^\s*JkLogFile logs/mod_jk\\.log$' /etc/#{service_name}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkLogLevel
describe command( "grep -Ec '^\s*JkLogLevel error$' /etc/#{service_name}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkShmFile
describe command( "grep -Ec '^\s*JkShmFile /dev/shm/jk\\.shm$' /etc/#{service_name}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkLogStampFormat
describe command( "grep -Ec '^\s*JkLogStampFormat \"\\[%a %b %d %H:%M:%S %Y\\]\"$' /etc/#{service_name}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkRequestLogFormat
describe command( "grep -Ec '^\s*JkRequestLogFormat \"%w %V %T %R\"$' /etc/#{service_name}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkWatchdogInterval
describe command( "grep -Ec '^\s*JkWatchdogInterval 60$' /etc/#{service_name}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# Locateion(jk-status)
describe command( "grep -Ec '^\s*<Location /jk-status>$' /etc/#{service_name}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*JkMount jk-status$' /etc/#{service_name}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*Require ip 127\\.0\\.0\\.1/32$' /etc/#{service_name}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^2$/ }
end

# Locateion(jk-manager)
describe command( "grep -Ec '^\s*<Location /jk-manager>$' /etc/#{service_name}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*JkMount jk-manager$' /etc/#{service_name}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkMountFile
describe command( "grep -Ec '^\s*JkMountFile conf/extra/uriworkermap.properties$' /etc/#{service_name}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkMountCopy
describe command( "grep -Ec '^\s*JkMountCopy All$' /etc/#{service_name}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end



### workers.properties
# List
describe command( "grep -Ec '^worker\\.list=cctap01,jk-status,jk-manager$' /etc/#{service_name}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# Template
describe command( "grep -Ec '^worker\\.template\\.type=ajp13$' /etc/#{service_name}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^worker\\.template\\.ping_mode=A$' /etc/#{service_name}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^worker\\.template\\.socket_timeout=1500$' /etc/#{service_name}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^worker\\.template\\.socket_keepalive=False$' /etc/#{service_name}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^worker\\.template\\.connection_pool_size=200$' /etc/#{service_name}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^worker\\.template\\.connection_pool_minsize=0$' /etc/#{service_name}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^worker\\.template\\.connection_pool_timeout=60$' /etc/#{service_name}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# CCT
describe command( "grep -Ec '^worker\\.cctap01\\.reference=worker\\.template$' /etc/#{service_name}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^worker\\.cctap01\\.host=#{tomcat_addr}$' /etc/#{service_name}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^worker\\.cctap01\\.port=#{tomcat_port}$' /etc/#{service_name}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# jk-status
describe command( "grep -Ec '^worker\\.jk-status\\.type=status$' /etc/#{service_name}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^worker\\.jk-status\\.read_only=true$' /etc/#{service_name}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# jk-manager
describe command( "grep -Ec '^worker\\.jk-manager\\.type=status$' /etc/#{service_name}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end



### uriworkermap.properties
# jk-status
describe command( "grep -Ec '^/jk-status=jk-status$' /etc/#{service_name}/conf/extra/uriworkermap.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^/jk-status/\\*=jk-status$' /etc/#{service_name}/conf/extra/uriworkermap.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# jk-manager
describe command( "grep -Ec '^/jk-manager=jk-manager$' /etc/#{service_name}/conf/extra/uriworkermap.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^/jk-manager/\\*=jk-manager$' /etc/#{service_name}/conf/extra/uriworkermap.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# CCT
describe command( "grep -Ec '^/jstorage-jets=cctap01;use_server_errors=400$' /etc/#{service_name}/conf/extra/uriworkermap.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^/jstorage-jets/\\*=cctap01;use_server_errors=400$' /etc/#{service_name}/conf/extra/uriworkermap.properties" ) do
  its( :stdout ) { should match /^1$/ }
end



### httpd-security.conf
# Header
describe command( "grep -Ec '^Header always append X-Frame-Options SAMEORIGIN$' /etc/#{service_name}/conf/extra/httpd-security.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^Header always set X-XSS-Protection \"1; mode=block\"$' /etc/#{service_name}/conf/extra/httpd-security.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^Header always set X-Content-Type-Options nosniff$' /etc/#{service_name}/conf/extra/httpd-security.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^Header always set Content-Security-Policy \"script-src .self. .unsafe-inline. .unsafe-eval.; object-src .self.\"$' /etc/#{service_name}/conf/extra/httpd-security.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^Header always set Strict-Transport-Security \"max-age=31536000; includeSubDomains\"$' /etc/#{service_name}/conf/extra/httpd-security.conf" ) do
  its( :stdout ) { should match /^1$/ }
end



### httpd-ssl.conf
# SSLRandomSeed
describe command( "grep -Ec '^SSLRandomSeed startup file:/dev/urandom 512$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^SSLRandomSeed connect builtin$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# Mutex
describe command( "grep -Ec '^Mutex default ssl-cache$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# SSLCryptoDevice 
describe command( "grep -Ec '^SSLCryptoDevice builtin$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# Listen(HTTPS)
describe command( "grep -Ec '^Listen #{listen_port_https}$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# SSLCipherSuite
describe command( "grep -Ec '^SSLCipherSuite ALL:!ADH:!EXPORT:!SSLv2:RC4\\+RSA:\\+HIGH:\\+MEDIUM:\\+LOW$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# SSLProtocol
describe command( "grep -Ec '^SSLProtocol all -SSLv2$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# SSLPassPhraseDialog
describe command( "grep -Ec '^SSLPassPhraseDialog builtin$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# SSLSessionCache
describe command( "grep -Ec '^SSLSessionCache \"shmcb:/var/cache/mod_ssl/scache\\(512000\\)\"$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# SSLSessionCacheTimeout
describe command( "grep -Ec '^SSLSessionCacheTimeout 300$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# VirtualHost
describe command( "grep -Ec '^<VirtualHost _default_:#{listen_port_https}>$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkMountCopy
describe command( "grep -Ec '^JkMountCopy On$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# DocumentRoot
describe command( "grep -Ec '^DocumentRoot \"/etc/#{service_name}/docs\"$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# ServerName
describe command( "grep -Ec '^ServerName localhost:#{listen_port_https}$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# ServerAdmin
describe command( "grep -Ec '^ServerAdmin root@localhost$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# ErrorLog
describe command( "grep -Ec '^ErrorLog \"logs/ssl_error_log\"$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# CustomLog
describe command( "grep -Ec '^CustomLog \"logs/ssl_access_log\" combined env=!no_log$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# LogLevel
describe command( "grep -Ec '^LogLevel warn$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# SSLEngine
describe command( "grep -Ec '^SSLEngine on$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# SSLCertificateFile
describe command( "grep -Ec '^SSLCertificateFile \"/etc/pki/tls/certs/localhost.crt\"$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# SSLCertificateKeyFile
describe command( "grep -Ec '^SSLCertificateKeyFile \"/etc/pki/tls/private/localhost.key\"$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# FilesMatch
describe command( "grep -Ec '^<FilesMatch \"\\\\\.\\(cgi\\|shtml\\|phtml\\|php3\\?\\)\\$\"\>$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# SSLOptions
describe command( "grep -Ec '^\s*SSLOptions \\+StdEnvVars$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^2$/ }
end

# Directory
describe command( "grep -Ec '^<Directory \"/var/www/cgi-bin\">$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# SetEnvIf
describe command( "grep -Ec '^SetEnvIf User-Agent \"\\.\\*MSIE\\.\\*\" \\\\$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*nokeepalive ssl-unclean-shutdown \\\\$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*downgrade-1.0 force-response-1.0$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end



# CustomLog(RequestLog)
describe command( "grep -Ec '^CustomLog \"logs/ssl_request_log\" \\\\$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*\"%t %h %{X-Forwarded-For}i %{SSL_PROTOCOL}x %{SSL_CIPHER}x \\\\\"%r\\\\\" %b\"$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# Directory
describe command( "grep -Ec '^<Directory  \"/etc/#{service_name}/docs\">$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*AllowOverride ALL$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# RewriteEngine
describe command( "grep -Ec '^RewriteEngine On$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# RewriteOptions
describe command( "grep -Ec '^RewriteOptions inherit$' /etc/#{service_name}/conf/extra/httpd-ssl.conf" ) do
  its( :stdout ) { should match /^1$/ }
end



### apachectl
describe command( "grep -Ec '^HTTPD=\".+ -E ' /etc/#{service_name}/bin/apachectl" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^HTTPD=\".+ -d .+ -E ' /etc/#{service_name}/bin/apachectl" ) do
  its( :stdout ) { should match /-d \/etc\/#{service_name} -E \/etc\/#{service_name}\/logs\/httpd\.log"$/ }
end

describe file( "/etc/#{service_name}/logs/httpd.log" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end



### access_log(HTTP)
describe file( "/etc/#{service_name}/logs/access_log" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe command( "curl -s http://localhost:#{listen_port_http}/HC.html" ) do
  its( :stdout ) { should match /^HC: #{service_name}:#{listen_port_http}$/ }
end

describe command( "curl -s http://localhost:#{listen_port_http}/#{service_name}.html" ) do
  its( :stdout ) { should match /./ }
end

describe command( "sync;sync;sleep 10;grep -E #{service_name}\.html /var/log/#{service_name}/access_log" ) do
  its( :stdout ) { should match /#{service_name}/ }
end



### access_log(HTTPS)
describe file( "/etc/#{service_name}/logs/ssl_access_log" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe command( "curl -sk https://localhost:#{listen_port_https}/HC.html" ) do
  its( :stdout ) { should match /^HC: #{service_name}:#{listen_port_http}$/ }
end

describe command( "curl -sk https://localhost:#{listen_port_https}/#{service_name}.html" ) do
  its( :stdout ) { should match /./ }
end

describe command( "sync;sync;grep -E #{service_name}\.html /var/log/#{service_name}/ssl_access_log" ) do
  its( :stdout ) { should match /#{service_name}/ }
end



### RequestLog(HTTPS)
describe file( "/etc/#{service_name}/logs/ssl_request_log" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe command( "curl -sk https://localhost:#{listen_port_https}/#{service_name}.html" ) do
  its( :stdout ) { should match /./ }
end

describe command( "sync;sync;sleep 10;grep -E #{service_name}\.html /var/log/#{service_name}/ssl_request_log" ) do
  its( :stdout ) { should match /#{service_name}/ }
end



### ErrorLog(HTTP)
describe file( "/etc/#{service_name}/logs/error_log" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end



### ErrorLog(HTTPS)
describe file( "/var/log/#{service_name}/ssl_error_log" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end



### firewalld
describe command( "firewall-cmd --list-ports" ) do
  its( :stdout ) { should match /#{listen_port_http}\/tcp/ }
end

describe command( "firewall-cmd --list-ports" ) do
  its( :stdout ) { should match /#{listen_port_https}\/tcp/ }
end


