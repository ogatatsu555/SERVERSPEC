require 'spec_helper'

#####################
# INCLUDE VARS HERE
#####################
service_name = "tomcat_pos3"
listen_port_http = "38180"
listen_port_ajp = "38109"
listen_port_shutdown = "38105"
#####################

### ServiceName
describe service( "#{service_name}" ) do
  it { should be_enabled }
  it { should be_running }
end



### Files
describe file( "/etc/#{service_name}/bin/catalina.sh" ) do
  it { should be_file }
  it { should be_owned_by( "tomcat" ) }
  it { should be_grouped_into( "tomcat" ) }
  it { should be_mode( "755" ) }
end

describe file( "/etc/#{service_name}/conf/logging.properties" ) do
  it { should be_file }
  it { should be_owned_by( "tomcat" ) }
  it { should be_grouped_into( "tomcat" ) }
  it { should be_mode( "644" ) }
end

describe file( "/etc/#{service_name}/conf/server.xml" ) do
  it { should be_file }
  it { should be_owned_by( "tomcat" ) }
  it { should be_grouped_into( "tomcat" ) }
  it { should be_mode( "644" ) }
end



### logging.properties
# handlers
describe command( "grep -Ec '^handlers = 1catalina\.org\.apache\.juli\.AsyncFileHandler, 2localhost\.org\.apache\.juli\.AsyncFileHandler, 3manager\.org\.apache\.juli\.AsyncFileHandler, 4host-manager\.org\.apache\.juli\.AsyncFileHandler, java\.util\.logging\.ConsoleHandler$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# 1catalina
describe command( "grep -Ec '^1catalina\\.org\\.apache\\.juli\\.AsyncFileHandler\\.level = FINE$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^1catalina\\.org\\.apache\\.juli\\.AsyncFileHandler\\.directory = \\${catalina\\.base}/logs$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^1catalina\\.org\\.apache\\.juli\\.AsyncFileHandler\\.prefix = catalina\\.$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^1catalina\\.org\\.apache\\.juli\\.AsyncFileHandler\\.encoding = UTF-8$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^1catalina\\.org\\.apache\\.juli\\.AsyncFileHandler\\.rotatable = false$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^1catalina\\.org\\.apache\\.juli\\.AsyncFileHandler\\.suffix = log$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# 2localhost
describe command( "grep -Ec '^2localhost\\.org\\.apache\\.juli\\.AsyncFileHandler\\.level = FINE$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^2localhost\\.org\\.apache\\.juli\\.AsyncFileHandler\\.directory = \\${catalina\\.base}/logs$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^2localhost\\.org\\.apache\\.juli\\.AsyncFileHandler\\.prefix = localhost\\.$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^2localhost\\.org\\.apache\\.juli\\.AsyncFileHandler\\.encoding = UTF-8$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^2localhost\\.org\\.apache\\.juli\\.AsyncFileHandler\\.rotatable = false$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^2localhost\\.org\\.apache\\.juli\\.AsyncFileHandler\\.suffix = log$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# 3manager
describe command( "grep -Ec '^3manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.level = FINE$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^3manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.directory = \\${catalina\\.base}/logs$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^3manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.prefix = manager\\.$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^3manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.encoding = UTF-8$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^3manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.rotatable = false$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^3manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.suffix = log$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# 4host-manager
describe command( "grep -Ec '^4host-manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.level = FINE$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^4host-manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.directory = \\${catalina\\.base}/logs$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^4host-manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.prefix = host-manager\\.$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^4host-manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.encoding = UTF-8$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^4host-manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.rotatable = false$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^4host-manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.suffix = log$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# java
describe command( "grep -Ec '^java\\.util\\.logging\\.ConsoleHandler\\.level = FINE$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^java\\.util\\.logging\\.ConsoleHandler\\.formatter = org\\.apache\\.juli\\.OneLineFormatter$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^java\\.util\\.logging\\.ConsoleHandler\\.encoding = UTF-8$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end



describe command( "grep -Ec '^org\\.apache\\.catalina\\.core\\.ContainerBase\\.\\[Catalina\\]\\.\\[localhost\\]\\.level = INFO$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^org\\.apache\\.catalina\\.core\\.ContainerBase\\.\\[Catalina\\]\\.\\[localhost\\]\\.handlers = 2localhost\\.org\\.apache\\.juli\\.AsyncFileHandler$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^org\\.apache\\.catalina\\.core\\.ContainerBase\\.\\[Catalina\\]\\.\\[localhost\\]\\.\\[/manager\\]\\.level = INFO$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^org\\.apache\\.catalina\\.core\\.ContainerBase\\.\\[Catalina\\]\\.\\[localhost\\]\\.\\[/manager\\]\\.handlers = 3manager\\.org\\.apache\\.juli\\.AsyncFileHandler$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^org\\.apache\\.catalina\\.core\\.ContainerBase\\.\\[Catalina\\]\\.\\[localhost\\]\\.\\[/host-manager\\]\\.level = INFO$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^org\\.apache\\.catalina\\.core\\.ContainerBase\\.\\[Catalina\\]\\.\\[localhost\\]\\.\\[/host-manager\\]\\.handlers = 4host-manager\\.org\\.apache\\.juli\\.AsyncFileHandler$' /etc/#{service_name}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end



### server.xml
# Server
describe command( "grep -Ec '^<Server port=\"#{listen_port_shutdown}\" shutdown=\"SHUTDOWN\">$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

# Listener
describe command( "grep -Ec '^\s*<Listener className=\"org\\.apache\\.catalina\\.startup\\.VersionLoggerListener\" />$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*<Listener className=\"org\\.apache\\.catalina\\.core\\.AprLifecycleListener\" SSLEngine=\"on\" />$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*<Listener className=\"org\\.apache\\.catalina\\.core\\.JreMemoryLeakPreventionListener\" />$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*<Listener className=\"org\\.apache\\.catalina\\.mbeans\\.GlobalResourcesLifecycleListener\" />$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*<Listener className=\"org\\.apache\\.catalina\\.core\\.ThreadLocalLeakPreventionListener\" />$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

# GlobalNamingResources
describe command( "grep -Ec '^\s*<GlobalNamingResources>$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*<Resource name=\"UserDatabase\" auth=\"Container\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*type=\"org\\.apache\\.catalina\\.UserDatabase\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*description=\"User database that can be updated and saved\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*factory=\"org\\.apache\\.catalina\\.users\\.MemoryUserDatabaseFactory\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*pathname=\"conf/tomcat-users.xml\" />$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*</GlobalNamingResources>$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

# Service
describe command( "grep -Ec '^\s*<Service name=\"Catalina\">$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

# Connector(HTTP)
describe command( "grep -Ec '^\s*<Connector$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^2$/ }
end

describe command( "grep -Ec '^\s*address=\"\\${tomcat\\.bind\\.address}\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^2$/ }
end

describe command( "grep -Ec '^\s*port=\"#{listen_port_http}\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*protocol=\"HTTP/1.1\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*redirectPort=\"8443\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^2$/ }
end

describe command( "grep -Ec '^\s*acceptCount=\"5\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*connectionTimeout=\"60000\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*keepAliveTimeout=\"-1\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*maxConnections=\"5\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*maxKeepAliveRequests=\"0\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*maxThreads=\"5\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*minSpareThreads=\"0\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^2$/ }
end

# Connector(AJS)
describe command( "grep -Ec '^\s*port=\"#{listen_port_ajp}\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*protocol=\"AJP/1.3\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*proxyPort=\"443\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*scheme=\"https\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*secure=\"true\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*acceptCount=\"400\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*connectionTimeout=\"150000\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*keepAliveTimeout=\"150000\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*maxConnections=\"220\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*maxThreads=\"220\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*enableLookups=\"false\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

# Engine
describe command( "grep -Ec '^\s*<Engine name=\"Catalina\" defaultHost=\"localhost\" jvmRoute=\"\\${jvmRoute}\">$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

# Realm
describe command( "grep -Ec '^\s*<Realm className=\"org\\.apache\\.catalina\\.realm\\.LockOutRealm\">$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*<Realm className=\"org\\.apache\\.catalina\\.realm\\.UserDatabaseRealm\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*resourceName=\"UserDatabase\"/>$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

# Host
describe command( "grep -Ec '^\s*<Host name=\"localhost\" appBase=\"webapps\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*unpackWARs=\"true\" autoDeploy=\"true\">$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

# Valve
describe command( "grep -Ec '^\s*<Valve$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*className=\"org\\.apache\\.catalina\\.valves\\.AccessLogValve\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*directory=\"logs\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*prefix=\"access\\.\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*suffix=\"log\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*rotatable=\"false\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*pattern=\"%h %l %u %t &quot;%r&quot; %s %b &quot;%{JSESSIONID}c&quot; %D\"$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end



describe command( "grep -Ec '^\s*</Host>$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*</Engine>$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*</Service>$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^</Server>$' /etc/#{service_name}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end



### catalina.out
describe file( "/var/log/#{service_name}/catalina.out" ) do
  it { should be_file }
  it { should be_owned_by( "tomcat" ) }
  it { should be_grouped_into( "tomcat" ) }
  it { should be_mode( "640" ) }
end



### catalina.log
describe file( "/etc/#{service_name}/logs/catalina.log" ) do
  it { should be_file }
  it { should be_owned_by( "tomcat" ) }
  it { should be_grouped_into( "tomcat" ) }
  it { should be_mode( "640" ) }
end



### access.log
describe file( "/etc/#{service_name}/logs/access.log" ) do
  it { should be_file }
  it { should be_owned_by( "tomcat" ) }
  it { should be_grouped_into( "tomcat" ) }
  it { should be_mode( "640" ) }
end

describe command( "curl -s http://localhost:#{listen_port_http}/HC.html" ) do
  its( :stdout ) { should match /^HC: #{service_name}:#{listen_port_http}$/ }
end

describe command( "curl -s http://localhost:#{listen_port_http}/#{service_name}.html" ) do
  its( :stdout ) { should match /./ }
end

describe command( "sync;sync;sleep 10;grep -E #{service_name}\.html /var/log/#{service_name}/access.log" ) do
  its( :stdout ) { should match /#{service_name}/ }
end



### firewalld
describe command( "firewall-cmd --list-ports" ) do
  its( :stdout ) { should match /#{listen_port_http}\/tcp/ }
end

describe command( "firewall-cmd --list-ports" ) do
  its( :stdout ) { should match /#{listen_port_ajp}\/tcp/ }
end

