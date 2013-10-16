# Cookbook Name:: simple-server
# Attributes:: default

default[:simple-server][:root] = ''

default[:simple-server][:name] = 'simple-node-server'
default[:simple-server][:version] = '0.0.0'
default[:simple-server][:description] = ''
default[:simple-server][:entry-point] = 'app.js'
default[:simple-server][:preinstall-command] = 'npm i -g forever'
default[:simple-server][:start-command] = 'forever app.js'
default[:simple-server][:test-command] = 'echo ﾂ･"Error: no test specifiedﾂ･" && exit 1'
default[:simple-server][:git-repository] = ''
default[:simple-server][:autor] = ''
default[:simple-server][:license] = 'BSD'