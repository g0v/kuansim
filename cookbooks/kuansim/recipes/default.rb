#
# Cookbook Name:: kuansim
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#
require 'json'

runit_service "kuansim" do
  default_logger true
end

File.open("/etc/pgrest-config.json","w") do |f|
  f.write(node['pgrest']['config'].to_json)
end
