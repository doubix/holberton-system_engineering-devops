#!/usr/bin/env bash
# creating a custom HTTP header response, but with Puppet.
#
#    The name of the custom HTTP header must be X-Served-By
#    The value of the custom HTTP header must be the hostname of the server Nginx is running on
#    Write 2-puppet_custom_http_response-header.pp so that it configures a brand new Ubuntu machine to the requirements asked in this task


exec {'update':
  command  => 'sudo apt-get -y update',
  provider => shell,
  }
exec {'Upgrade':
  command  => 'sudo apt-get -y upgrade',
  provider => shell,
  } 
exec {'Install':
  command  => 'sudo apt-get -y install nginx',
  provider => shell,
  } 

exec {'Sed':
  command  => 'sudo sed -i "11i\\\tadd_header X-Served-By ${hostname};" /etc/nginx/nginx.conf',
  provider => shell,
  }
exec {'Restart':
  command  => 'sudo service nginx restart',
  provider => shell,
  } 
