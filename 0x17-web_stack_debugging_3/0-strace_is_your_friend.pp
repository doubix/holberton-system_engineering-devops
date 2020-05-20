# fixes Apache 500 error
exec { 'fix WP':
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  provider => 'shell',
  command => "sed -i 's/phpp/php/' /var/www/html/wp-settings.php",
}
