#
# Cookbook Name:: simple-server
# Attributes:: node
#
# Copyright 2008-2013, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['node-simple-server']['group'] = 'development'
default['node-simple-server']['owner'] = 'node'

# Where the various parts of apache are
case node['platform']
when 'redhat', 'centos', 'scientific', 'fedora', 'suse', 'amazon', 'oracle'
  default['node-simple-server']['server_dir'] = '/var/node'
when 'debian', 'ubuntu'
  default['node-simple-server']['server_dir'] = '/var/node'
when 'arch'
  default['node-simple-server']['server_dir'] = '/srv/node'
when 'freebsd'
  default['node-simple-server']['server_dir'] = '/usr/local/node'
else
  default['node-simple-server']['server_dir'] = '/var/node'
end

# General settings
default['node-simple-server']['apps']['name']  = 'simple-server'
default['node-simple-server']['apps']['version']  = '0.0.0'
default['node-simple-server']['apps']['description']  = ''
default['node-simple-server']['apps']['main']  = 'app.js'
default['node-simple-server']['apps']['scripts']['preinstall']  = 'sudo npm i -g forever'
default['node-simple-server']['apps']['scripts']['start']  = 'forever start app.js'
default['node-simple-server']['apps']['scripts']['test']  = 'npm debug'
default['node-simple-server']['apps']['repository']  = ''
default['node-simple-server']['apps']['author']  = ''
default['node-simple-server']['apps']['license']  = 'BSD'


default['node-simple-server']['listen_addresses']  = '127.0.0.1'
default['node-simple-server']['listen_ports']      = 3000
default['node-simple-server']['default_site_enabled'] = false
default['node-simple-server']['sudo_proccess'] = false