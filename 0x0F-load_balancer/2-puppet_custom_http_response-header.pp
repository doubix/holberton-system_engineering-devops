#!/usr/bin/env bash
# creating a custom HTTP header response, but with Puppet.
#
#    The name of the custom HTTP header must be X-Served-By
#    The value of the custom HTTP header must be the hostname of the server Nginx is running on
#    Write 2-puppet_custom_http_response-header.pp so that it configures a brand new Ubuntu machine to the requirements asked in this task


exec {'update':
  command  => 'sudo apt-get -y update',
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  provider => shell,
  }
exec {'upgrade':
  command  => 'sudo apt-get -y upgrade',
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  provider => shell,
  } 
exec {'install':
  command  => 'sudo apt-get -y install nginx',
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  provider => shell,
  } 

-> file_line { 'change header':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  line   => "	location / {
  add_header X-Served-By ${hostname};",
  match  => '^\tlocation / {',
}
exec {'restart':
  command  => 'sudo service nginx restart',
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  provider => shell,
  }
