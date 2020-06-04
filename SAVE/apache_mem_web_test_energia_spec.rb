require 'spec_helper'

#####################
# INCLUDE VARS HERE
#####################
service_name = "httpd_mem_web_test_energia"
server_root = "mem_web_test/apache/energia"
server_name = "s-energia.cardnet.co.jp"
listen_port_http = "19205"
tomcat_addr = "127.0.0.1"
tomcat_port = "29205"
ap_name = "KAIINWeb"
#####################

### ServiceName
describe service( "#{service_name}" ) do
  it { should be_enabled }
  it { should be_running }
end



### Files
describe file( "/app/#{server_root}/bin/apachectl" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "755" ) }
end

describe file( "/app/#{server_root}/conf/httpd.conf" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/app/#{server_root}/conf/extra/httpd-mpm.conf" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/app/#{server_root}/conf/extra/httpd-multilang-errordoc.conf" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/app/#{server_root}/conf/extra/httpd-info.conf" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/app/#{server_root}/conf/extra/httpd-default.conf" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/app/#{server_root}/conf/extra/httpd-jk.conf" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/app/#{server_root}/conf/extra/workers.properties" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe file( "/app/#{server_root}/conf/extra/uriworkermap.properties" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

#describe file( "/app/#{service_name}/conf/extra/httpd-security.conf" ) do
#  it { should be_file }
#  it { should be_owned_by( "root" ) }
#  it { should be_grouped_into( "root" ) }
#  it { should be_mode( "644" ) }
#end



# ServerRoot
describe command( "grep -Ec '^ServerRoot' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^0$/ }
end

# Listen(HTTP)
describe command( "grep -Ec '^Listen' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^Listen' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^Listen #{listen_port_http}$/ }
end

describe port( "#{listen_port_http}" ) do
  it { should be_listening }
end

# User
describe command( "grep -Ec '^User' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^User' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^User apache$/ }
end

# Group
describe command( "grep -Ec '^Group' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^Group' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^Group apache$/ }
end

# ServerAdmin
describe command( "grep -Ec '^ServerAdmin' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^ServerAdmin' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^ServerAdmin root@localhost$/ }
end

# ServerName
describe command( "grep -Ec '^ServerName' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^ServerName' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^ServerName #{server_name}$/ }
end

# DocumentRoot
describe command( "grep -Ec '^DocumentRoot' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^DocumentRoot' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^DocumentRoot "\/app\/#{server_root}\/docs"$/ }
end

describe command( "grep -Ec '^<Directory \"/app/#{server_root}/docs\">$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# DirectoryIndex
describe command( "grep -Ec '^\s*DirectoryIndex' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^\s*DirectoryIndex' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^\s*DirectoryIndex index\.html$/ }
end

# ErrorLog
describe command( "grep -Ec '^ErrorLog' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^ErrorLog' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^ErrorLog "logs\/error.log"$/ }
end

# LogLevel
describe command( "grep -Ec '^LogLevel' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^LogLevel' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^LogLevel error$/ }
end

# CustomLog
describe command( "grep -Ec '^\s*LogFormat .+ combined$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^\s*LogFormat .+ combined$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /LogFormat "\[%{%Y-%m-%d %T}t\] \\"%{X-Forwarded-For}i\\" \\"%r\\" %>s %b %D \\"%{Referer}i\\" \\"%{User-Agent}i\\"" combined$/ }
end

# CustomLog
describe command( "grep -Ec '^\s*CustomLog .+ combined env=!no_log$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^\s*CustomLog .+ combined env=!no_log$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /CustomLog "logs\/access.log" combined env=!no_log$/ }
end

# TypesConfig
describe command( "grep -Ec '^\s*TypesConfig' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^\s*TypesConfig' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /TypesConfig conf\/mime\.types$/ }
end

# TraceEnable
describe command( "grep -Ec '^TraceEnable Off$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# LimitRequestBody
describe command( "grep -Ec '^LimitRequestBody\s+1048576$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# LimitRequestFields
describe command( "grep -Ec '^LimitRequestFields 100$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# FileETag
describe command( "grep -Ec '^FileETag MTime Size$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# LoadModule
describe command( "grep -Ec '^LoadModule authz_host_module modules/mod_authz_host\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule authz_core_module modules/mod_authz_core\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule ext_filter_module modules/mod_ext_filter\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule include_module modules/mod_include\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule deflate_module modules/mod_deflate\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule mime_module modules/mod_mime\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule log_config_module modules/mod_log_config\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule logio_module modules/mod_logio\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule mime_magic_module modules/mod_mime_magic\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule expires_module modules/mod_expires\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule headers_module modules/mod_headers\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule setenvif_module modules/mod_setenvif\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule unixd_module modules/mod_unixd\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule status_module modules/mod_status\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule autoindex_module modules/mod_autoindex\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule info_module modules/mod_info\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule negotiation_module modules/mod_negotiation\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule dir_module modules/mod_dir\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule speling_module modules/mod_speling\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule alias_module modules/mod_alias\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^LoadModule rewrite_module modules/mod_rewrite\\.so$' /app/#{server_root}/conf/httpd.conf" ) do
  its( :stdout ) { should match /^1$/ }
end



### httpd-mpm.conf
# StartServers
describe command( "grep -Ec '^\s*StartServers\s*5$' /app/#{server_root}/conf/extra/httpd-mpm.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# MinSpareServers
describe command( "grep -Ec '^\s*MinSpareServers\s*5$' /app/#{server_root}/conf/extra/httpd-mpm.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# MaxSpareServers
describe command( "grep -Ec '^\s*MaxSpareServers\s*20$' /app/#{server_root}/conf/extra/httpd-mpm.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# ServerLimit
describe command( "grep -Ec '^\s*ServerLimit\s*256$' /app/#{server_root}/conf/extra/httpd-mpm.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# MaxRequestsWorkers
describe command( "grep -Ec '^\s*MaxRequestWorkers\s*256$' /app/#{server_root}/conf/extra/httpd-mpm.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# MaxConnectionsPerChild
describe command( "grep -Ec '^\s*MaxConnectionsPerChild\s*1$' /app/#{server_root}/conf/extra/httpd-mpm.conf" ) do
  its( :stdout ) { should match /^1$/ }
end



### httpd-multilang-errordoc.conf
# Alias
describe command( "grep -Ec '^Alias /error/ \"/app/#{server_root}/error/\"$' /app/#{server_root}/conf/extra/httpd-multilang-errordoc.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# Directory
describe command( "grep -Ec '^<Directory \"/app/#{server_root}/error\">$' /app/#{server_root}/conf/extra/httpd-multilang-errordoc.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# ErrorDocument
describe command( "grep -Ec '^ErrorDocument 404 /error/404\\.html$' /app/#{server_root}/conf/extra/httpd-multilang-errordoc.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^ErrorDocument 500 /error/500\\.html$' /app/#{server_root}/conf/extra/httpd-multilang-errordoc.conf" ) do
  its( :stdout ) { should match /^1$/ }
end



### httpd-info.conf
# Location(server-status)
describe command( "grep -Ec '^<Location /server-status>$' /app/#{server_root}/conf/extra/httpd-info.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*SetHandler server-status$' /app/#{server_root}/conf/extra/httpd-info.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*Require ip 127\\.0\\.0\\.1/32$' /app/#{server_root}/conf/extra/httpd-info.conf" ) do
  its( :stdout ) { should match /^2$/ }
end

# ExtendedStatus
describe command( "grep -Ec '^ExtendedStatus On$' /app/#{server_root}/conf/extra/httpd-info.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# Location(server-info)
describe command( "grep -Ec '^<Location /server-info>$' /app/#{server_root}/conf/extra/httpd-info.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*SetHandler server-info$' /app/#{server_root}/conf/extra/httpd-info.conf" ) do
  its( :stdout ) { should match /^1$/ }
end



### httpd-default.conf
# Timeout
describe command( "grep -Ec '^Timeout 300$' /app/#{server_root}/conf/extra/httpd-default.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# KeepAlive
describe command( "grep -Ec '^KeepAlive On$' /app/#{server_root}/conf/extra/httpd-default.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# MaxKeepAliveRequests
describe command( "grep -Ec '^MaxKeepAliveRequests 100$' /app/#{server_root}/conf/extra/httpd-default.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# KeepAliveTimeout
describe command( "grep -Ec '^KeepAliveTimeout 15$' /app/#{server_root}/conf/extra/httpd-default.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# UseCanonicalName
describe command( "grep -Ec '^UseCanonicalName Off$' /app/#{server_root}/conf/extra/httpd-default.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# ServerTokens
describe command( "grep -Ec '^ServerTokens Prod$' /app/#{server_root}/conf/extra/httpd-default.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# ServerSignature
describe command( "grep -Ec '^ServerSignature Off$' /app/#{server_root}/conf/extra/httpd-default.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# HostnameLookups
describe command( "grep -Ec '^HostnameLookups Off$' /app/#{server_root}/conf/extra/httpd-default.conf" ) do
  its( :stdout ) { should match /^1$/ }
end



### httpd-jk.conf
# LoadModule
describe command( "grep -Ec '^LoadModule jk_module modules/mod_jk\\.so$' /app/#{server_root}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkWorkersFile
describe command( "grep -Ec '^\s*JkWorkersFile conf/extra/workers\\.properties$' /app/#{server_root}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkLogFile
describe command( "grep -Ec '^\s*JkLogFile logs/mod_jk\\.log$' /app/#{server_root}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkLogLevel
describe command( "grep -Ec '^\s*JkLogLevel info$' /app/#{server_root}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkShmFile
describe command( "grep -Ec '^\s*JkShmFile /dev/shm/jk\\.shm$' /app/#{server_root}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkLogStampFormat
describe command( "grep -Ec '^\s*JkLogStampFormat \"\\[%a %b %d %H:%M:%S %Y\\]\"$' /app/#{server_root}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkRequestLogFormat
describe command( "grep -Ec '^\s*JkRequestLogFormat \"%w %V %T\"$' /app/#{server_root}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkOptions
describe command( "grep -Ec '^\s*JkOptions \\+ForwardKeySize \\+ForwardURICompat -ForwardDirectories$' /app/#{server_root}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# Locateion(jk-status)
describe command( "grep -Ec '^\s*<Location /jk-status>$' /app/#{server_root}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*JkMount jk-status$' /app/#{server_root}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*Require ip 127\\.0\\.0\\.1/32$' /app/#{server_root}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^2$/ }
end

# Locateion(jk-manager)
describe command( "grep -Ec '^\s*<Location /jk-manager>$' /app/#{server_root}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*JkMount jk-manager$' /app/#{server_root}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end

# JkMountFile
describe command( "grep -Ec '^\s*JkMountFile conf/extra/uriworkermap.properties$' /app/#{server_root}/conf/extra/httpd-jk.conf" ) do
  its( :stdout ) { should match /^1$/ }
end



### workers.properties
# List
describe command( "grep -Ec '^worker\\.list=worker1,jk-status,jk-manager$' /app/#{server_root}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# Template
describe command( "grep -Ec '^worker\\.template\\.type=ajp13$' /app/#{server_root}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^worker\\.template\\.ping_mode=A$' /app/#{server_root}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^worker\\.template\\.reply_timeout=298000$' /app/#{server_root}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end


describe command( "grep -Ec '^worker\\.template\\.socket_connect_timeout=298000$' /app/#{server_root}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^worker\\.template\\.connection_pool_timeout=600$' /app/#{server_root}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end


describe command( "grep -Ec '^worker\\.template\\.retries=1$' /app/#{server_root}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# worker1
describe command( "grep -Ec '^worker\\.worker1\\.reference=worker\\.template$' /app/#{server_root}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^worker\\.worker1\\.host=#{tomcat_addr}$' /app/#{server_root}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^worker\\.worker1\\.port=#{tomcat_port}$' /app/#{server_root}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end


# jk-status
describe command( "grep -Ec '^worker\\.jk-status\\.type=status$' /app/#{server_root}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^worker\\.jk-status\\.read_only=true$' /app/#{server_root}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# jk-manager
describe command( "grep -Ec '^worker\\.jk-manager\\.type=status$' /app/#{server_root}/conf/extra/workers.properties" ) do
  its( :stdout ) { should match /^1$/ }
end



### uriworkermap.properties
# jk-status
describe command( "grep -Ec '^/jk-status=jk-status$' /app/#{server_root}/conf/extra/uriworkermap.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^/jk-status/\\*=jk-status$' /app/#{server_root}/conf/extra/uriworkermap.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# jk-manager
describe command( "grep -Ec '^/jk-manager=jk-manager$' /app/#{server_root}/conf/extra/uriworkermap.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^/jk-manager/\\*=jk-manager$' /app/#{server_root}/conf/extra/uriworkermap.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# worker1
describe command( "grep -Ec '^/#{ap_name}=worker1$' /app/#{server_root}/conf/extra/uriworkermap.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^/#{ap_name}/\\*=worker1$' /app/#{server_root}/conf/extra/uriworkermap.properties" ) do
  its( :stdout ) { should match /^1$/ }
end



### httpd-security.conf
# Header
#describe command( "grep -Ec '^Header always append X-Frame-Options SAMEORIGIN$' /app/#{server_root}/conf/extra/httpd-security.conf" ) do
#  its( :stdout ) { should match /^1$/ }
#end
#
#describe command( "grep -Ec '^Header always set X-XSS-Protection \"1; mode=block\"$' /app/#{server_root}/conf/extra/httpd-security.conf" ) do
#  its( :stdout ) { should match /^1$/ }
#end
#
#describe command( "grep -Ec '^Header always set X-Content-Type-Options nosniff$' /app/#{server_root}/conf/extra/httpd-security.conf" ) do
#  its( :stdout ) { should match /^1$/ }
#end
#
#describe command( "grep -Ec '^Header always set Content-Security-Policy \"script-src .self. .unsafe-inline. .unsafe-eval.; object-src .self.\"$' /app/#{server_root}/conf/extra/httpd-security.conf" ) do
#  its( :stdout ) { should match /^1$/ }
#end
#
#describe command( "grep -Ec '^Header always set Strict-Transport-Security \"max-age=31536000; includeSubDomains\"$' /app/#{server_root}/conf/extra/httpd-security.conf" ) do
#  its( :stdout ) { should match /^1$/ }
#end



### apachectl
describe command( "grep -Ec '^HTTPD=\".+ -E ' /app/#{server_root}/bin/apachectl" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -E '^HTTPD=\".+ -d .+ -E ' /app/#{server_root}/bin/apachectl" ) do
  its( :stdout ) { should match /-d \/app\/#{server_root} -E \/app\/#{server_root}\/logs\/httpd\.log"$/ }
end

describe file( "/app/#{server_root}/logs/httpd.log" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end



### access.log(HTTP)
describe file( "/app/#{server_root}/logs/access.log" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end

describe command( "curl -s http://localhost:#{listen_port_http}/index.html" ) do
  its( :stdout ) { should match /^INDEX: #{service_name}:#{listen_port_http}$/ }
end

describe command( "curl -s http://localhost:#{listen_port_http}/#{service_name}.html" ) do
  its( :stdout ) { should match /./ }
end

describe command( "sync;sync;sleep 10;grep -E #{service_name}\.html /var/applog/#{server_root}/access.log" ) do
  its( :stdout ) { should match /#{service_name}/ }
end



### ErrorLog(HTTP)
describe file( "/app/#{server_root}/logs/error.log" ) do
  it { should be_file }
  it { should be_owned_by( "root" ) }
  it { should be_grouped_into( "root" ) }
  it { should be_mode( "644" ) }
end



### firewalld
describe command( "firewall-cmd --list-ports" ) do
  its( :stdout ) { should match /#{listen_port_http}\/tcp/ }
end

