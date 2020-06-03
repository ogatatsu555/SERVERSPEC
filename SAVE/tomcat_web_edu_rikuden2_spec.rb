require 'spec_helper'

#####################
# INCLUDE VARS HERE
#####################
service_name = "tomcat_web_edu_rikuden2"
server_root = "web_edu/tomcat/rikuden2"
listen_port_http = "38106"
listen_port_ajp = "28106"
listen_port_shutdown = "48106"
#####################

### ServiceName
describe service( "#{service_name}" ) do
  it { should be_enabled }
  it { should be_running }
end



### Files
describe file( "/app/#{server_root}/bin/catalina.sh" ) do
  it { should be_file }
  it { should be_owned_by( "tomcat" ) }
  it { should be_grouped_into( "tomcat" ) }
  it { should be_mode( "755" ) }
end

describe file( "/app/#{server_root}/conf/logging.properties" ) do
  it { should be_file }
  it { should be_owned_by( "tomcat" ) }
  it { should be_grouped_into( "tomcat" ) }
  it { should be_mode( "644" ) }
end

describe file( "/app/#{server_root}/conf/server.xml" ) do
  it { should be_file }
  it { should be_owned_by( "tomcat" ) }
  it { should be_grouped_into( "tomcat" ) }
  it { should be_mode( "644" ) }
end



### logging.properties
# handlers
describe command( "grep -Ec '^handlers = 1catalina\.org\.apache\.juli\.AsyncFileHandler, 2localhost\.org\.apache\.juli\.AsyncFileHandler, 3manager\.org\.apache\.juli\.AsyncFileHandler, 4host-manager\.org\.apache\.juli\.AsyncFileHandler, java\.util\.logging\.ConsoleHandler$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# 1catalina
describe command( "grep -Ec '^1catalina\\.org\\.apache\\.juli\\.AsyncFileHandler\\.level = FINE$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^1catalina\\.org\\.apache\\.juli\\.AsyncFileHandler\\.directory = \\${catalina\\.base}/logs$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^1catalina\\.org\\.apache\\.juli\\.AsyncFileHandler\\.prefix = catalina\\.$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^1catalina\\.org\\.apache\\.juli\\.AsyncFileHandler\\.encoding = UTF-8$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^1catalina\\.org\\.apache\\.juli\\.AsyncFileHandler\\.rotatable = false$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^1catalina\\.org\\.apache\\.juli\\.AsyncFileHandler\\.suffix = log$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# 2localhost
describe command( "grep -Ec '^2localhost\\.org\\.apache\\.juli\\.AsyncFileHandler\\.level = FINE$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^2localhost\\.org\\.apache\\.juli\\.AsyncFileHandler\\.directory = \\${catalina\\.base}/logs$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^2localhost\\.org\\.apache\\.juli\\.AsyncFileHandler\\.prefix = localhost\\.$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^2localhost\\.org\\.apache\\.juli\\.AsyncFileHandler\\.encoding = UTF-8$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^2localhost\\.org\\.apache\\.juli\\.AsyncFileHandler\\.rotatable = false$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^2localhost\\.org\\.apache\\.juli\\.AsyncFileHandler\\.suffix = log$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# 3manager
describe command( "grep -Ec '^3manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.level = FINE$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^3manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.directory = \\${catalina\\.base}/logs$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^3manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.prefix = manager\\.$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^3manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.encoding = UTF-8$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^3manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.rotatable = false$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^3manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.suffix = log$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# 4host-manager
describe command( "grep -Ec '^4host-manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.level = FINE$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^4host-manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.directory = \\${catalina\\.base}/logs$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^4host-manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.prefix = host-manager\\.$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^4host-manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.encoding = UTF-8$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^4host-manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.rotatable = false$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^4host-manager\\.org\\.apache\\.juli\\.AsyncFileHandler\\.suffix = log$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

# java
describe command( "grep -Ec '^java\\.util\\.logging\\.ConsoleHandler\\.level = FINE$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^java\\.util\\.logging\\.ConsoleHandler\\.formatter = org\\.apache\\.juli\\.OneLineFormatter$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^java\\.util\\.logging\\.ConsoleHandler\\.encoding = UTF-8$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end



describe command( "grep -Ec '^org\\.apache\\.catalina\\.core\\.ContainerBase\\.\\[Catalina\\]\\.\\[localhost\\]\\.level = INFO$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^org\\.apache\\.catalina\\.core\\.ContainerBase\\.\\[Catalina\\]\\.\\[localhost\\]\\.handlers = 2localhost\\.org\\.apache\\.juli\\.AsyncFileHandler$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^org\\.apache\\.catalina\\.core\\.ContainerBase\\.\\[Catalina\\]\\.\\[localhost\\]\\.\\[/manager\\]\\.level = INFO$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^org\\.apache\\.catalina\\.core\\.ContainerBase\\.\\[Catalina\\]\\.\\[localhost\\]\\.\\[/manager\\]\\.handlers = 3manager\\.org\\.apache\\.juli\\.AsyncFileHandler$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^org\\.apache\\.catalina\\.core\\.ContainerBase\\.\\[Catalina\\]\\.\\[localhost\\]\\.\\[/host-manager\\]\\.level = INFO$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^org\\.apache\\.catalina\\.core\\.ContainerBase\\.\\[Catalina\\]\\.\\[localhost\\]\\.\\[/host-manager\\]\\.handlers = 4host-manager\\.org\\.apache\\.juli\\.AsyncFileHandler$' /app/#{server_root}/conf/logging.properties" ) do
  its( :stdout ) { should match /^1$/ }
end



### server.xml
# Server
describe command( "grep -Ec '^<Server port=\"#{listen_port_shutdown}\" shutdown=\"SHUTDOWN\">$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

# Listener
describe command( "grep -Ec '^\s*<Listener className=\"org\\.apache\\.catalina\\.startup\\.VersionLoggerListener\" />$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*<Listener className=\"org\\.apache\\.catalina\\.core\\.AprLifecycleListener\" SSLEngine=\"off\" />$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*<Listener className=\"org\\.apache\\.catalina\\.core\\.JreMemoryLeakPreventionListener\" />$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*<Listener className=\"org\\.apache\\.catalina\\.mbeans\\.GlobalResourcesLifecycleListener\" />$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*<Listener className=\"org\\.apache\\.catalina\\.core\\.ThreadLocalLeakPreventionListener\" />$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

# GlobalNamingResources
describe command( "grep -Ec '^\s*<GlobalNamingResources>$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*<Resource name=\"UserDatabase\" auth=\"Container\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*type=\"org\\.apache\\.catalina\\.UserDatabase\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*description=\"User database that can be updated and saved\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*factory=\"org\\.apache\\.catalina\\.users\\.MemoryUserDatabaseFactory\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*pathname=\"conf/tomcat-users.xml\" />$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*</GlobalNamingResources>$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

# Service
describe command( "grep -Ec '^\s*<Service name=\"Catalina\">$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

# Connector(HTTP)
describe command( "grep -Ec '^\s*<Connector$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^2$/ }
end

describe command( "grep -Ec '^\s*address=\"\\${tomcat\\.bind\\.address}\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^2$/ }
end

describe command( "grep -Ec '^\s*port=\"#{listen_port_http}\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*protocol=\"HTTP/1.1\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*redirectPort=\"8443\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^2$/ }
end

# Connector(AJS)
describe command( "grep -Ec '^\s*port=\"#{listen_port_ajp}\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*protocol=\"AJP/1.3\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*redirectPort=\"8443\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^2$/ }
end

describe command( "grep -Ec '^\s*secure=\"true\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*maxThreads=\"256\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*maxPostSize=\"1048576\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*connectionTimeout=\"298000\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

# Engine
describe command( "grep -Ec '^\s*<Engine name=\"Catalina\" defaultHost=\"localhost\">$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

# Realm
describe command( "grep -Ec '^\s*<Realm className=\"org\\.apache\\.catalina\\.realm\\.LockOutRealm\">$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*<Realm className=\"org\\.apache\\.catalina\\.realm\\.UserDatabaseRealm\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*resourceName=\"UserDatabase\"/>$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

# Host
describe command( "grep -Ec '^\s*<Host name=\"localhost\" appBase=\"webapps\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*unpackWARs=\"true\" autoDeploy=\"false\"$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*errorReportValveClass=\"jp\\.co\\.cardnet\\.kokyo\\.tomcat\\.valve\\.KokyoErrorReportValve\">$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*</Host>$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

# Valve
describe command( "grep -Ec '^\s*<Valve className=\"org\\.apache\\.catalina\\.valves\\.RemoteIpValve\" />$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*</Engine>$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^\s*</Service>$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end

describe command( "grep -Ec '^</Server>$' /app/#{server_root}/conf/server.xml" ) do
  its( :stdout ) { should match /^1$/ }
end



### catalina.out
describe file( "/var/applog/#{server_root}/catalina.out" ) do
  it { should be_file }
  it { should be_owned_by( "tomcat" ) }
  it { should be_grouped_into( "tomcat" ) }
  it { should be_mode( "640" ) }
end



### catalina.log
describe file( "/app/#{server_root}/logs/catalina.log" ) do
  it { should be_file }
  it { should be_owned_by( "tomcat" ) }
  it { should be_grouped_into( "tomcat" ) }
  it { should be_mode( "640" ) }
end



### firewalld
describe command( "firewall-cmd --list-ports" ) do
  its( :stdout ) { should match /#{listen_port_http}\/tcp/ }
end

describe command( "firewall-cmd --list-ports" ) do
  its( :stdout ) { should match /#{listen_port_ajp}\/tcp/ }
end

