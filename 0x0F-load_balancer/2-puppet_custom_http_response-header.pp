# creating a custom HTTP header response, but with Puppet.
#
#    The name of the custom HTTP header must be X-Served-By
#    The value of the custom HTTP header must be the hostname of the server Nginx is running on
#    Write 2-puppet_custom_http_response-header.pp so that it configures a brand new Ubuntu machine to the requirements asked in this task


exec { 'update_packages':
command => 'sudo apt-get -y update',
provider => 'shell',
}

exec { 'install_nginx':
command => 'sudo apt-get -y install nginx',
provider => 'shell',
}

exec { 'start_nginx':
command => 'sudo service nginx start',
provider => 'shell',
}

exec { 'modify_nginx_config':
command => 'sed -i -e "/sendfile/i \\\tadd_header X-Served-By \$hostname;" /etc/nginx/nginx.conf',
provider => 'shell',
}

exec { 'restart_nginx':
command => 'sudo service nginx restart',
provider => 'shell',
}

