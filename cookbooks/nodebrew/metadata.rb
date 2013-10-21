name             'nodebrew'
maintainer       'linyows'
maintainer_email 'linyows@gmail.com'
license          'MIT'
description      'Installs and manages your versionsf Node.js in Chef with nodebrew'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe "nodebrew", "Installs and configures nodebrew"

%w(centos redhat fedora ubuntu debian).each { |os| supports os }
%w(apt git build-essential).each { |cookbook| depends cookbook }
