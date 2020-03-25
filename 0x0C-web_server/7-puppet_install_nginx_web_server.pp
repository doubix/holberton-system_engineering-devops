# Install ngnix with puppet and configurate a server
# Requirements:
#    Nginx should be listening on port 80
#    When querying Nginx at its root / with a GET request (requesting a page) using curl, it must return a page that contains the string Holberton School
#    The redirection must be a “301 Moved Permanently”

exec {'update':
  provider => shell,
  path     => '/usr/bin:/usr/sbin:/bin',
  command  => 'sudo apt-get -y update',
}

exec {'install':
  provider => shell,
  path     => '/usr/bin:/usr/sbin:/bin',
  command  => 'sudo apt-get -y install nginx',
}

exec {'html':
  provider => shell,
  path     => '/usr/bin:/usr/sbin:/bin',
  command  => 'sudo echo "Holberton School" | sudo tee /var/www/html/index.nginx-debian.html',
}

exec {'sedConfig':
  provider => shell,
  command  => 'sudo sed -i "/server_name _;/ a\\\trewrite ^/redirect_me http://www.youtube.com permanent;" /etc/nginx/sites-available/default',
  path     => '/usr/bin:/usr/sbin:/bin',
}

exec {'start':
  provider => shell,
  command  => 'sudo service nginx start',
  path     => '/usr/bin:/usr/sbin:/bin',
}
