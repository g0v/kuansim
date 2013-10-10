include_recipe "runit"
include_recipe "database"
include_recipe "cron"
include_recipe "postgresql::ruby"

require 'json'

directory "/opt/kuansim" do
  action :create
end

execute "install LiveScript" do
  command "npm i -g LiveScript@1.1.1"
  not_if "test -e /usr/bin/lsc"
end

git "/opt/kuansim/backend" do
  repository "git://github.com/g0v/kuansim-backend.git"
  reference "develop"
  action :sync
end

execute "install kuansim backend" do
  cwd "/opt/kuansim/backend"
  action :nothing
  subscribes :run, resources(:git => "/opt/kuansim/backend"), :immediately
  command "npm i -unsafe-perm && npm link"
end

postgresql_connection_info = {:host => "127.0.0.1",
                              :port => node['postgresql']['config']['port'],
                              :username => 'postgres',
                              :password => node['postgresql']['password']['postgres']}

database 'kuansim' do
  connection postgresql_connection_info
  provider Chef::Provider::Database::Postgresql
  action :create
end

db_user = postgresql_database_user 'kuansim' do
  connection postgresql_connection_info
  database_name 'kuansim'
  password 'password'
  privileges [:all]
  action :create
end

postgresql_database "grant schema" do
  connection postgresql_connection_info
  database_name 'kuansim'
  sql "grant CREATE on database kuansim to kuansim"
  action :nothing
  subscribes :query, resources(:postgresql_database_user => 'kuansim'), :immediately
end

connection_info = postgresql_connection_info.clone()
connection_info[:username] = 'kuansim'
connection_info[:password] = 'password'
conn = "postgres://#{connection_info[:username]}:#{connection_info[:password]}@#{connection_info[:host]}/ly"

# XXX: use whitelist
postgresql_database "plv8" do
  connection postgresql_connection_info
  database_name 'kuansim'
  sql "create extension plv8"
  action :nothing
  subscribes :query, resources(:postgresql_database_user => 'kuansim'), :immediately
end

# booting
execute "boot kuansim backend" do
  cwd "/opt/kuansim/backend"
  action :nothing
  user "nobody"
  command "kuansim --db #{conn} --boot"
end

#runit_service "kuansim" do
#  default_logger true
#end

#File.open("/etc/kuansim-config.json","w") do |f|
#  f.write(node['kuansim']['config'].to_json)
#end
