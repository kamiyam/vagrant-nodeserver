#
# Cookbook Name:: simple-server
# Recipe:: default
#
# Copyright 2013, meteorworks
#
# All rights reserved - Do Not Redistribute
#

app_path = "simple-server"

### server root folder create
directory "#{node['node-simple-server']['server_dir']}/#{app_path}" do
  owner node['node-simple-server']['owner']
  group node['node-simple-server']['group']
  mode '0775'
  action [:create]
end

### package.json include
template "#{node['node-simple-server']['server_dir']}/#{app_path}/package.json" do
  source   'package.json.erb'
  owner     node['node-simple-server']['owner']
  group   node['node-simple-server']['group']
  mode     '0664'
  action [:nothing]
end

### app.js include
template "#{node['node-simple-server']['server_dir']}/#{app_path}/app.js" do
  source   'app.js.erb'
  owner     node['node-simple-server']['owner']
  group     node['node-simple-server']['group']
  mode     '0664'
  action [:nothing]
end

nodebrew_npm 'forever'

bash "starting_node_server" do
  user  "node"
  cwd   "#{node['node-simple-server']['server_dir']}/#{app_path}"
  code <<-EOH
    npm i
    sudo forever stopall
    npm start
  EOH
end