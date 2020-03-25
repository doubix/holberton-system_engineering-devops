# Install ngnix with puppet and configurate a server
# Requirements:
#    Nginx should be listening on port 80
#    When querying Nginx at its root / with a GET request (requesting a page) using curl, it must return a page that contains the string Holberton School
#    The redirection must be a “301 Moved Permanently”

exec { 'install':
  provider => shell,
  command  => 'sudo apt-get -y update ; sudo apt-get -y upgrade ; sudo apt-get -y install nginx ; echo "Holberton School" | sudo tee /var/www/html/index.nginx-debian.html ; sudo sed -i "s/server_name _;/server_name _;\n\trewrite ^\/redirect_me https:\/\/www.youtube.com\/watch?v=EshjSGSg0q0&t=35s permanent;/" /etc/nginx/sites-available/default ; sudo service nginx restart ; sudo service nginx reload',
}
