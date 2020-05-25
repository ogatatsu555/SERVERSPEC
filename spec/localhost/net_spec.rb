require 'spec_helper'

#####################
# INCLUDE VARS HERE
#####################
if_name0 = "ens33"
ip_address0 = "192.168.222.129/24"
#if_name0 = "enp0s3"
#ip_address0 = "10.0.2.15/24"
#if_name1 = "enp0s8"
#ip_address1 = "192.168.56.114/24"
#hostname = "centos7\.ogatatsu\.jp"
hostname = "infra00\.ogatatsu\.jp"
#gateway = "10.0.2.2"
gateway = "192.168.222.2"
#####################

describe interface( "#{if_name0}" ) do
  it { should exist }
end

describe interface( "#{if_name0}" ) do
  it { should be_up }
end

describe interface( "#{if_name0}" ) do
  it { should have_ipv4_address( "#{ip_address0}" ) }
end

#describe interface( "#{if_name1}" ) do
#  it { should exist }
#end
#
#describe interface( "#{if_name1}" ) do
#  it { should be_up }
#end
#
#describe interface( "#{if_name1}" ) do
#  it { should have_ipv4_address( "#{ip_address1}" ) }
#end

describe routing_table do
  it do
    should have_entry(
      :destination => "default",
      :gateway => "#{gateway}"
    )
  end
end

describe command( "hostname" ) do
  its( :stdout ) { should match /#{hostname}/ }
end

