require 'spec_helper'

### Apache
describe group( "apache" ) do
  it { should have_gid 1002 }
end

describe user( "apache" ) do
  it { should have_uid 1002 }
end

describe user( "apache" ) do
  it { should belong_to_group "apache" }
end



### Tomcat
describe group( "tomcat" ) do
  it { should have_gid 1003 }
end

describe user( "tomcat" ) do
  it { should have_uid 1003 }
end

describe user( "tomcat" ) do
  it { should belong_to_group "tomcat" }
end

